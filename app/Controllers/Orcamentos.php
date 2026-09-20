<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\ClienteModel;
use App\Models\OrcamentoModel;
use App\Models\ProdutoDoOrcamentoModel;
use App\Models\VendaModel;
use App\Models\ProdutoDaVendaModel;
use CodeIgniter\Controller;

class Orcamentos extends Controller
{
    private $link = [
        'li' => '2.x',
        'item' => '2.0',
        'subItem' => '2.4'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $orcamento_model;
    private $produto_do_orcamento_model;
    private $venda_model;
    private $produto_da_venda_model;

    private $cliente_model;
    private $caixa_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model   = new ControleDeAcessoModel();
        $this->orcamento_model            = new OrcamentoModel();
        $this->produto_do_orcamento_model = new ProdutoDoOrcamentoModel();
        $this->venda_model                = new VendaModel();
        $this->produto_da_venda_model     = new ProdutoDaVendaModel();
        $this->cliente_model              = new ClienteModel();
        $this->caixa_model                = new CaixaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('orcamentos');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Orçamentos',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Orçamentos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['orcamentos'] = $this->orcamento_model
                                    ->where('orcamentos.id_empresa', $this->id_empresa)
                                    ->select('
                                        id_orcamento,
                                        nome,
                                        status,
                                        valor_a_pagar,
                                        data,
                                        hora
                                    ')
                                    ->join('clientes', 'orcamentos.id_cliente = clientes.id_cliente')
                                    ->findAll();

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('orcamentos/index');
        echo view('templates/footer');
    }

    public function show($id_orcamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Dados do Orçamento',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Orçamentos", 'rota' => "/orcamentos", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['orcamento'] = $this->orcamento_model
                                    ->where('orcamentos.id_empresa', $this->id_empresa)
                                    ->select('
                                        id_orcamento,
                                        orcamentos.status,
                                        valor_a_pagar,
                                        desconto,
                                        valor_recebido,
                                        troco,
                                        forma_de_pagamento,
                                        data,
                                        hora,
                                        clientes.nome AS nome_do_cliente,
                                        vendedores.nome AS nome_do_vendedor,
                                        id_caixa
                                    ')
                                    ->join('clientes', 'orcamentos.id_cliente = clientes.id_cliente')
                                    ->join('vendedores', 'orcamentos.id_vendedor = vendedores.id_vendedor')
                                    ->where('id_orcamento', $id_orcamento)
                                    ->first();

        $data['produtos_do_orcamento'] = $this->produto_do_orcamento_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_orcamento', $id_orcamento)
                                                ->findAll();

        echo view('templates/header', $data);
        echo view('orcamentos/show');
        echo view('templates/footer');
    }

    public function finalizarVenda($id_orcamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->orcamento_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_orcamento', $id_orcamento)
                        ->first();

        $produtos = $this->produto_do_orcamento_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_orcamento', $id_orcamento)
                        ->findAll();

        $id_venda = $this->venda_model
                        ->insert($dados);

        foreach($produtos as $produto) :
            $produto['id_venda'] = $id_venda;
            
            $this->produto_da_venda_model
                ->insert($produto);
        endforeach;

        $this->orcamento_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_orcamento', $id_orcamento)
            ->set('status', "Finalizado")
            ->update(); // Altera o status informando que o orçamento foi finalizado e registrado como venda.

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Venda finalizada com sucesso!'
            ]
        );
        
        return redirect()->to("/orcamentos/show/$id_orcamento");
    }

    public function delete($id_orcamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->orcamento_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_orcamento', $id_orcamento)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Orçamento excluido com sucesso!'
            ]
        );

        return redirect()->to('/orcamentos');
    }
}
