<?php

namespace App\Controllers;

use App\Models\CaixaModel;

use App\Models\ControleDeAcessoModel;
use App\Models\EmpresaModel;
use App\Models\ClienteModel;
use App\Models\FormaDePagamentoModel;
use App\Models\ProdutoDaVendaModel;
use App\Models\ProdutoModel;
use App\Models\ProdutoPdvModel;
use App\Models\VendaModel;
use App\Models\VendedorModel;
use CodeIgniter\Controller;

class Pdv extends Controller
{
    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $empresa_model;
    private $produto_model;
    private $produto_pdv_model;
    private $cliente_model;
    private $venda_model;
    private $produto_da_venda_model;
    private $forma_de_pagamento_model;
    private $vendedor_model;
    private $caixa_model;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->empresa_model            = new EmpresaModel();
        $this->produto_model            = new ProdutoModel();
        $this->produto_pdv_model        = new ProdutoPdvModel();
        $this->cliente_model            = new ClienteModel();
        $this->venda_model              = new VendaModel();
        $this->produto_da_venda_model   = new ProdutoDaVendaModel();
        $this->caixa_model              = new CaixaModel();
        $this->forma_de_pagamento_model = new FormaDePagamentoModel();
        $this->vendedor_model           = new VendedorModel();
    }

    public function index()
    {
        $data['link'] = [
            'li' => '2.x',
            'item' => '2.0',
            'subItem' => '2.6'
        ];

        $data['titulo'] = [
            'modulo' => 'Caixas Abertos',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas Abertos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', 'Aberto')
                                ->findAll();

        echo view('templates/header', $data);
        echo view('pdv/seleciona_caixa');
        echo view('templates/footer');
    }

    public function start($id_caixa)
    {
        $data['id_caixa'] = $id_caixa;

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->select(
                                    'id_cliente,
                                    tipo,
                                    nome,
                                    razao_social
                                ')
                                ->findAll();
        
        $data['produtos'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->select(
                                    'id_produto,
                                    nome
                                ')
                                ->findAll();
        
        $data['produtos_do_pdv'] = $this->produto_pdv_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();
        
        $data['valor_a_pagar'] = $this->produto_pdv_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->selectSum('valor_final')
                                    ->first();
        
        $data['formas_de_pagamento'] = $this->forma_de_pagamento_model
                                                                ->findAll();
        
        $data['vendedores'] = $this->vendedor_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        echo view('pdv/start', $data);
    }

    public function adicionaProdutoPorCodigoDeBarras($id_caixa)
    {
        $dados = $this->request->getvar('codigo_de_barras');

        // Separa a quantidade do codigo de barras
        $aux = explode('x', $dados);

        // Caso exista aux na posição 1 então quer dizer que foi separado o x dos valores
        if(isset($aux[1])) :
            $quantidade = $aux[0];
            $codigo_de_barras = $aux[1];
        else :
            $quantidade       = 1;
            $codigo_de_barras = $dados;
        endif;

        $produto = $this->produto_model
                        ->select('
                            id_produto,
                            nome,
                            unidade,
                            codigo_de_barras,
                            valor_de_venda,
                            NCM,
                            CSOSN,
                            CFOP_NFe,
                            CFOP_NFCe
                        ')
                        ->where('id_empresa', $this->id_empresa)
                        ->where('codigo_de_barras', $codigo_de_barras)
                        ->first();

        if(!empty($produto)) :
            $valor_unitario = $produto['valor_de_venda'];
            $subtotal       = $quantidade * $valor_unitario;
            $desconto       = 0;
            $valor_final    = $subtotal - $desconto;

            $this->produto_pdv_model->insert([
                'nome'             => $produto['nome'],
                'unidade'          => $produto['unidade'],
                'codigo_de_barras' => $produto['codigo_de_barras'],
                'quantidade'       => $quantidade,
                'valor_unitario'   => $valor_unitario,
                'subtotal'         => $subtotal,
                'desconto'         => $desconto,
                'valor_final'      => $valor_final,
                'NCM'              => $produto['NCM'],
                'CSOSN'            => $produto['CSOSN'],
                'CFOP_NFe'         => $produto['CFOP_NFe'],
                'CFOP_NFCe'        => $produto['CFOP_NFCe'],
                'id_produto'       => $produto['id_produto'],
                'id_empresa'       => $this->id_empresa
            ]);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Produto adicionado com sucesso!'
                ]
            );

            return redirect()->to("/pdv/start/$id_caixa");
        endif;

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'warning',
                'title' => 'Produto com cód. de barras não encontrado!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function adicionaProdutoPorNome($id_caixa, $id_produto)
    {
        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $id_produto)
                        ->select('
                            id_produto,
                            nome,
                            unidade,
                            codigo_de_barras,
                            valor_de_venda,
                            NCM,
                            CSOSN,
                            CFOP_NFe,
                            CFOP_NFCe
                        ')
                        ->first();

        $quantidade     = 1;
        $valor_unitario = $produto['valor_de_venda'];
        $subtotal       = $quantidade * $valor_unitario;
        $desconto       = 0;
        $valor_final    = $subtotal - $desconto;

        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->insert([
                'nome'             => $produto['nome'],
                'unidade'          => $produto['unidade'],
                'codigo_de_barras' => $produto['codigo_de_barras'],
                'quantidade'       => $quantidade,
                'valor_unitario'   => $valor_unitario,
                'subtotal'         => $subtotal,
                'desconto'         => $desconto,
                'valor_final'      => $valor_final,
                'NCM'              => $produto['NCM'],
                'CSOSN'            => $produto['CSOSN'],
                'CFOP_NFe'         => $produto['CFOP_NFe'],
                'CFOP_NFCe'        => $produto['CFOP_NFCe'],
                'id_produto'       => $produto['id_produto'],
                'id_empresa'       => $this->id_empresa
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto adicionado com sucesso!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function removeProdutoDoPdv($id_caixa, $id_produto_pdv)
    {
        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_pdv', $id_produto_pdv)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto removido com sucesso!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function alteraQtdDoProduto($id_caixa)
    {
        $id_produto_pdv = $this->request
                                ->getvar('id_produto_pdv');
        
        $produto = $this->produto_pdv_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto_pdv', $id_produto_pdv)
                        ->first();

        // Prepara os dados para alterar
        $dados = $this->request
                        ->getvar();

        $dados['subtotal'] = ($dados['quantidade'] * $produto['valor_unitario']);
        $dados['valor_final'] = (($dados['quantidade'] * $produto['valor_unitario']) - $produto['desconto']);

        // Atualiza com os novos dados
        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->save($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Qtd. alterada com sucesso!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function alteraValorUnitarioDoProduto($id_caixa)
    {
        $id_produto_pdv = $this->request
                                ->getvar('id_produto_pdv');
        
        $produto = $this->produto_pdv_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto_pdv', $id_produto_pdv)
                        ->first();

        // Prepara os dados para alterar
        $dados = $this->request
                        ->getvar();

        $dados['subtotal'] = ($produto['quantidade'] * $dados['valor_unitario']);
        $dados['valor_final'] = (($produto['quantidade'] * $dados['valor_unitario']) - $produto['desconto']);

        // Atualiza com os novos dados
        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_pdv', $id_produto_pdv)
            ->set($dados)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Valor uniátio alterado com sucesso!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function alteraDescontoDoProduto($id_caixa)
    {
        $id_produto_pdv = $this->request
                                ->getvar('id_produto_pdv');

        $produto = $this->produto_pdv_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto_pdv', $id_produto_pdv)
                        ->first();

        // Prepara os dados para alterar
        $dados = $this->request
                        ->getvar();

        $dados['valor_final'] = (($produto['quantidade'] * $produto['valor_unitario']) - $dados['desconto']);

        // Atualiza com os novos dados
        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_pdv', $id_produto_pdv)
            ->set($dados)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Desconto alterado com sucesso!'
            ]
        );

        return redirect()->to("/pdv/start/$id_caixa");
    }

    public function format($valor)
    {
        return number_format($valor, 2, '.', '');
    }

    public function finalizaVenda($id_caixa)
    {
        $dados = $this->request->getvar();

        // Adiciona data e hora da venda
        $dados['data']     = date('Y-m-d');
        $dados['hora']     = date('H:i:s');
        $dados['id_caixa'] = $id_caixa;

        // Adiciona id da empresa
        $dados['id_empresa'] = $this->id_empresa;

        $id_venda = $this->venda_model
                        ->insert($dados);

        $produtos_do_pdv = $this->produto_pdv_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $produtos_para_o_cupom_nao_fiscal = "";

        foreach ($produtos_do_pdv as $produto) :
            $produto['id_venda'] = $id_venda;
			
			// Decrementa da quantidade do estoque a quantidade do produto vendido
            $produto_do_estoque = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto', $produto['id_produto'])
                                        ->first();

            $nova_qtd = $produto_do_estoque['quantidade'] - $produto['quantidade'];

            $this->produto_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto', $produto['id_produto'])
                ->set('quantidade', $nova_qtd)
                ->update();
			
            $this->produto_da_venda_model
                ->insert($produto);

            // Guarda os dados dos produtos em uma variável para inserir no cupom
            $subtotal = $produto['quantidade'] * $produto['valor_unitario'];

            $produtos_para_o_cupom_nao_fiscal .= "
                <tr>
                    <td>{$produto['nome']}</td>
                    <td>{$produto['quantidade']} x {$produto['valor_unitario']}</td>
                    <td>{$subtotal}</td>
                </tr>
            ";
        endforeach;

        // Remove todos os registros da tabela produtos_do_pdv.
        $this->produto_pdv_model
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Venda finalizada com sucesso!'
            ]
        );

        // ---------------------------------- MONTAGEM DO CUPOM NÃO FISCAL ------------------------------------------- //
        $empresa  = $this->empresa_model
                        ->where('id_empresa', $this->id_empresa)
                        ->first();

        $cliente  = $this->cliente_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_cliente', $dados['id_cliente'])
                        ->first();

        $vendedor = $this->vendedor_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_vendedor', $dados['id_vendedor'])
                        ->first();

        $data = date('d/m/Y');
        $hora = date('H:i');

        echo "
            <p style='text-align: center'>
                <b>{$empresa['xFant']}</b><br>
                {$empresa['xNome']}<br>
                {$empresa['xLgr']}<br>
                {$empresa['fone']}
            </p>

            <p>
                <b>CNPJ:</b> {$empresa['CNPJ']}<br>
                <b>Cliente:</b> {$cliente['nome']}<br>
                {$data} às {$hora} - <b>Nº {$id_venda}</b>
            </p>

            <hr>

            <table width='100%'>
                <thead>
                    <tr>
                        <th>Desc.</th>
                        <th>Qtd X Unit.</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    {$produtos_para_o_cupom_nao_fiscal}
                </tbody>
            </table>

            <hr>

            <p>
                <b>Total:</b>    {$dados['valor_a_pagar']}<br>
                <b>Recebido:</b> {$dados['valor_recebido']}<br>
                <b>Troco:</b>    {$dados['troco']}<br>
                <b>Forma de PGTO:</b> {$dados['forma_de_pagamento']}
            </p>
            
            <hr>

            <p><b>Vendedor:</b> {$vendedor['nome']}</p>

            <hr>

            <p style='text-align: center'>
                ____________________________
                <br>
                Assinatura do Cliente
            </p>
        ";
    }
}
