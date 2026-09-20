<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\ClienteModel;
use App\Models\FormaDePagamentoModel;
use App\Models\OrcamentoModel;
use App\Models\PedidoModel;
use App\Models\ProdutoDaVendaModel;
use App\Models\ProdutoDaVendaRapidaModel;
use App\Models\ProdutoDoOrcamentoModel;
use App\Models\ProdutoDoPedidoModel;
use App\Models\ProdutoModel;
use App\Models\VendaModel;
use App\Models\VendedorModel;
use CodeIgniter\Controller;

class VendaRapida extends Controller
{
    private $link = [
        'li' => '2.x',
        'item' => '2.0',
        'subItem' => '2.1'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $produto_model;
    private $caixa_model;
    private $produto_da_venda_rapida_model;
    private $venda_model;
    private $cliente_model;
    private $produto_da_venda_model;
    private $pedido_model;
    private $produto_do_pedido_model;
    private $orcamento_model;
    private $produto_do_orcamento_model;
    private $forma_de_pagamento_model;
    private $vendedor_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model      = new ControleDeAcessoModel();
        $this->produto_model                 = new ProdutoModel();
        $this->caixa_model                   = new CaixaModel();
        $this->produto_da_venda_rapida_model = new ProdutoDaVendaRapidaModel();
        $this->venda_model                   = new VendaModel();
        $this->cliente_model                 = new ClienteModel();
        $this->produto_da_venda_model        = new ProdutoDaVendaModel();
        $this->pedido_model                  = new PedidoModel();
        $this->produto_do_pedido_model       = new ProdutoDoPedidoModel();
        $this->orcamento_model               = new OrcamentoModel();
        $this->produto_do_orcamento_model    = new ProdutoDoOrcamentoModel();
        $this->forma_de_pagamento_model      = new FormaDePagamentoModel();
        $this->vendedor_model                = new VendedorModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('venda_rapida');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Venda Rápida',
            'icone'  => 'fa fa-money-bill-alt'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Venda Rápida", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', "Aberto")
                                ->findAll();

        $data['produtos_do_estoque'] = $this->produto_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();
        
        $data['produtos_da_venda_rapida'] = $this->produto_da_venda_rapida_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->findAll();

        $data['valor_da_venda'] = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->selectSum('valor_final')
                                        ->first();

        $data['formas_de_pagamento'] = $this->forma_de_pagamento_model
                                            // ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        $data['vendedores'] = $this->vendedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('status', "Ativo")->find();

        echo view('templates/header', $data);
        echo view('venda_rapida/index');
        echo view('templates/footer');
    }

    public function addProdutoDaVenda()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Caso codigo_de_barras for igual a nada "" então o usuário selecionou um produto
        if($dados['codigo_de_barras'] == "")
        {
            $produto = $this->produto_model
                            ->where('id_produto', $dados['id_produto'])
                            ->first();

            $this->produto_da_venda_rapida_model
                ->insert([
                    'nome'                  => $produto['nome'],
                    'unidade'               => $produto['unidade'],
                    'codigo_de_barras'      => $produto['codigo_de_barras'],
                    'quantidade'            => $dados['quantidade'],
                    'valor_unitario'        => $produto['valor_de_venda'],
                    'subtotal'              => $dados['quantidade'] * $produto['valor_de_venda'],
                    'desconto'              => 0,
                    'valor_final'           => $dados['quantidade'] * $produto['valor_de_venda'],
                    'tipo_da_comissao'      => $produto['tipo_da_comissao'],
                    'porcentagem_comissao'  => $produto['porcentagem_comissao'],
                    'valor_comissao'        => $produto['valor_comissao'],
                    'NCM'                   => $produto['NCM'],
                    'CSOSN'                 => $produto['CSOSN'],
                    'CFOP_NFe'              => $produto['CFOP_NFe'],
                    'CFOP_NFCe'             => $produto['CFOP_NFCe'],
                    'CFOP_Externo'          => $produto['CFOP_Externo'],
                    'id_produto'            => $produto['id_produto'],
                    'id_empresa'            => $this->id_empresa,
                ]);

            $this->session->setFlashdata(
                'alert', 
                [
                    'type'  => 'success',
                    'title' => 'Produto adicionado com sucesso!',
                ]
            );
        }
        else // Senão ele digitou um codigo_de_barras
        {
            $produto = $this->produto_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('codigo_de_barras', $dados['codigo_de_barras'])
                            ->first();

            if(!empty($produto)) // Caso produto não seja vazio então foi encontrado o produto
            {
                $this->produto_da_venda_rapida_model->insert([
                    'nome'                  => $produto['nome'],
                    'unidade'               => $produto['unidade'],
                    'codigo_de_barras'      => $produto['codigo_de_barras'],
                    'quantidade'            => $dados['quantidade'],
                    'valor_unitario'        => $produto['valor_de_venda'],
                    'subtotal'              => $dados['quantidade'] * $produto['valor_de_venda'],
                    'desconto'              => 0,
                    'valor_final'           => $dados['quantidade'] * $produto['valor_de_venda'],
                    'tipo_da_comissao'      => $dados['tipo_da_comissao'],
                    'porecentagem_comissao' => $dados['porecentagem_comissao'],
                    'valor_comissao'        => $dados['valor_comissao'],
                    'NCM'                   => $produto['NCM'],
                    'CSOSN'                 => $produto['CSOSN'],
                    'CFOP_NFe'              => $produto['CFOP_NFe'],
                    'CFOP_NFCe'             => $produto['CFOP_NFCe'],
                    'CFOP_Externo'          => $produto['CFOP_Externo'],
                    'id_produto'            => $produto['id_produto'],
                    'id_empresa'            => $this->id_empresa,
                ]);

                $this->session->setFlashdata(
                'alert', 
                    [
                        'type'  => 'success',
                        'title' => 'Produto adicionado com sucesso!',
                    ]
                );
            }
            else // Produto com o codigo_de_barras não encontrado
            {
                $this->session->setFlashdata(
                    'alert', 
                    [
                        'type'  => 'warning',
                        'title' => 'Produto com código de barras não encontrado!',
                    ]
                );
            }
        }

        return redirect()->to('/vendaRapida');
    }

    public function tipoVenda($dados)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        // Converte BRL para USD
        $dados['valor_a_pagar']  = converteMoney($dados['valor_a_pagar']);
        $dados['valor_recebido'] = converteMoney($dados['valor_recebido']);
        $dados['troco']          = converteMoney($dados['troco']);

        $id_venda = $this->venda_model
                        ->insert($dados);

        $produtos_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        foreach ($produtos_da_venda_rapida as $produto) :
            $produto['id_venda']    = $id_venda;
            
            // Adiciona os IDs ao array do produto
            $produto['id_empresa']  = $this->id_empresa;

            // Cadastra o produto
            $this->produto_da_venda_model
                ->insert($produto);

            // Decrementa da quantidade do estoque a quantidade do produto vendido
            $produto_do_estoque = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto', $produto['id_produto'])
                                        ->first();

            // Cáculo
            $nova_qtd = $produto_do_estoque['quantidade'] - $produto['quantidade'];

            // Salva com a nova quantidade
            $this->produto_model
                ->set('quantidade', $nova_qtd)
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto', $produto['id_produto'])
                ->update();
        endforeach;

        // Remove todos os registros da tabela produtos_da_venda_rapida.
        $this->produto_da_venda_rapida_model
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        // Cria um alert na sessão
        $this->session->setFlashdata(
            'alert', 
            [
                'type'  => 'success',
                'title' => 'Venda realizada com sucesso!',
            ]
        );

        return "/vendas";
    }

    public function tipoOrcamento($dados)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        // Converte BRL para USD
        $dados['valor_a_pagar']  = converteMoney($dados['valor_a_pagar']);
        $dados['valor_recebido'] = converteMoney($dados['valor_recebido']);
        $dados['troco']          = converteMoney($dados['troco']);

        // Por padrão todo orçamento gerado terá o status de Aberto
        $dados['status'] = "Aberto";

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $id_orcamento = $this->orcamento_model
                            ->insert($dados);

        $produtos_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        foreach ($produtos_da_venda_rapida as $produto) :
            $produto['id_orcamento'] = $id_orcamento;

            // Adiciona os IDs da sessão ao array
            $produto['id_empresa']  = $this->id_empresa;
            
            $this->produto_do_orcamento_model
                ->insert($produto);
        endforeach;

        // Remove todos os registros da tabela produtos_da_venda_rapida.
        $this->produto_da_venda_rapida_model
            // ->emptyTable('produtos_da_venda_rapida');
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        // Cria um alert na sessão
        $this->session->setFlashdata(
            'alert', 
            [
                'type'  => 'success',
                'title' => 'Orçamento realizado com sucesso!',
            ]
        );

        return "/orcamentos";
    }

    public function tipoPedido($dados)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        // Converte BRL para USD
        $dados['valor_a_pagar']  = converteMoney($dados['valor_a_pagar']);
        $dados['valor_recebido'] = converteMoney($dados['valor_recebido']);
        $dados['troco']          = converteMoney($dados['troco']);

        // Situação do Pedido
        $dados['situacao'] = "Não Pago - Andamento";

        // Para de entrega é o mesmo da data, pode ser alterado na sessão pedidos
        $dados['prazo_de_entrega'] = $dados['data'];

        $id_pedido = $this->pedido_model
                        ->insert($dados);

        $produtos_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        foreach ($produtos_da_venda_rapida as $produto) :
            $produto['id_pedido'] = $id_pedido;
            
            $this->produto_do_pedido_model
                ->insert($produto);
        endforeach;

        // Remove todos os registros da tabela produtos_da_venda_rapida.
        $this->produto_da_venda_rapida_model
        // ->emptyTable('produtos_da_venda_rapida');
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        // Cria um alert na sessão
        $this->session->setFlashdata(
            'alert', 
            [
                'type'  => 'success',
                'title' => 'Pedido realizado com sucesso!',
            ]
        );

        return "/pedidos";
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();
        
        // Adiciona os IDs ao array
        $dados['id_empresa'] = $this->id_empresa;
        
        if($dados['tipo'] == "Venda") :
            $url = $this->tipoVenda($dados);
        elseif($dados['tipo'] == "Pedido") :
            $url = $this->tipoPedido($dados);
        elseif($dados['tipo'] == "Orçamento") :
            $url = $this->tipoOrcamento($dados);
        endif;

        return redirect()->to($url);
    }

    public function deleteProduto($id_produto_da_venda_rapida)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->produto_da_venda_rapida_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_da_venda_rapida', $id_produto_da_venda_rapida)
            ->delete();

        // Cria um alert na sessão
        $this->session->setFlashdata(
            'alert', 
            [
                'type'  => 'success',
                'title' => 'Produto excluido com sucesso!',
            ]
        );

        return redirect()->to('/vendaRapida');
    }

    public function alteraQuantidade()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        $produto_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto_da_venda_rapida', $dados['id_produto_da_venda_rapida'])
                                        ->first();

        // dd($produto_da_venda_rapida);

        $subtotal = $dados['quantidade'] * $produto_da_venda_rapida['valor_unitario'];

        $this->produto_da_venda_rapida_model
            ->where('id_empresa', $this->id_empresa)
            ->save([
                'id_produto_da_venda_rapida' => $dados['id_produto_da_venda_rapida'],
                'quantidade'                 => $dados['quantidade'],
                'subtotal'                   => $subtotal,
                'valor_final'                => $subtotal - $produto_da_venda_rapida['desconto']
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Quantidade alterada com sucesso!'
            ]
        );

        return redirect()->to('/vendaRapida');
    }


    public function alteraDesconto()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte BRL para USD
        $dados['desconto'] = converteMoney($dados['desconto']);

        $produto_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto_da_venda_rapida', $dados['id_produto_da_venda_rapida'])
                                        ->first();

        // dd($produto_da_venda_rapida);

        $subtotal = $produto_da_venda_rapida['quantidade'] * $produto_da_venda_rapida['valor_unitario'];

        $this->produto_da_venda_rapida_model
            ->where('id_empresa', $this->id_empresa)
            ->save([
                'id_produto_da_venda_rapida' => $dados['id_produto_da_venda_rapida'],
                'desconto'                   => $dados['desconto'],
                'subtotal'                   => $subtotal,
                'valor_final'                => $subtotal - $dados['desconto']
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Desconto adicionado com sucesso!'
            ]
        );

        return redirect()->to('/vendaRapida');
    }

    public function alteraValorUnitario()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $dados = $this->request->getvar();

        // Converte BRL para USD
        $dados['valor_unitario'] = converteMoney($dados['valor_unitario']);

        $produto_da_venda_rapida = $this->produto_da_venda_rapida_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto_da_venda_rapida', $dados['id_produto_da_venda_rapida'])
                                        ->first();

        // dd($produto_da_venda_rapida);

        $subtotal = $produto_da_venda_rapida['quantidade'] * $dados['valor_unitario'];

        $this->produto_da_venda_rapida_model
            ->where('id_empresa', $this->id_empresa)
            ->save([
                'id_produto_da_venda_rapida' => $dados['id_produto_da_venda_rapida'],
                'valor_unitario'             => $dados['valor_unitario'],
                'desconto'                   => $produto_da_venda_rapida['desconto'],
                'subtotal'                   => $subtotal,
                'valor_final'                => $subtotal - $produto_da_venda_rapida['desconto']
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Valor Unitário alterado com sucesso!'
            ]
        );
        
        return redirect()->to('/vendaRapida');
    }
}
