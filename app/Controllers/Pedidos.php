<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\ClienteModel;
use App\Models\PedidoModel;
use App\Models\ProdutoDoPedidoModel;
use App\Models\VendaModel;
use App\Models\ProdutoDaVendaModel;
use CodeIgniter\Controller;

class Pedidos extends Controller
{
    private $link = [
        'li' => '2.x',
        'item' => '2.0',
        'subItem' => '2.5'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $pedido_model;
    private $produto_do_pedido_model;
    private $venda_model;
    private $produto_da_venda_model;
    private $cliente_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->pedido_model             = new PedidoModel();
        $this->produto_do_pedido_model  = new ProdutoDoPedidoModel();
        $this->venda_model              = new VendaModel();
        $this->produto_da_venda_model   = new ProdutoDaVendaModel();
        $this->cliente_model            = new ClienteModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('pedidos');
    }

    public function index()
    {    
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Pedidos',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Pedidos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['pedidos'] = $this->pedido_model
                                ->where('pedidos.id_empresa', $this->id_empresa)
                                ->select('
                                    id_pedido,
                                    clientes.nome,
                                    situacao,
                                    valor_a_pagar,
                                    data,
                                    hora,
                                    pedidos.id_cliente,
                                    prazo_de_entrega
                                ')
                                ->join('clientes', 'pedidos.id_cliente = clientes.id_cliente')
                                ->findAll();

        echo view('templates/header', $data);
        echo view('pedidos/index');
        echo view('templates/footer');
    }

    public function show($id_pedido)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Dados do Pedido',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Pedidos", 'rota' => "/pedidos", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['pedido'] = $this->pedido_model
                                ->where('pedidos.id_empresa', $this->id_empresa)
                                ->where('id_pedido', $id_pedido)
                                ->select('
                                    id_pedido,
                                    situacao,
                                    valor_a_pagar,
                                    desconto,
                                    valor_recebido,
                                    troco,
                                    forma_de_pagamento,
                                    prazo_de_entrega,
                                    clientes.nome AS nome_do_cliente,
                                    vendedores.nome AS nome_do_vendedor,
                                    data,
                                    hora,
                                    id_caixa
                                ')
                                ->join('clientes', 'pedidos.id_cliente = clientes.id_cliente')
                                ->join('vendedores', 'pedidos.id_vendedor = vendedores.id_vendedor')
                                ->first();

        $data['produtos_do_pedido'] = $this->produto_do_pedido_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_pedido', $id_pedido)
                                            ->findAll();

        echo view('templates/header', $data);
        echo view('pedidos/show');
        echo view('templates/footer');
    }

    public function finalizarPedido($id_pedido)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->pedido_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_pedido', $id_pedido)
                        ->first();

        $produtos = $this->produto_do_pedido_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_pedido', $id_pedido)
                        ->findAll();

        $id_venda = $this->venda_model
                        ->insert($dados);

        foreach($produtos as $produto) :
            $produto['id_venda'] = $id_venda;
            
            $this->produto_da_venda_model
                ->insert($produto);
        endforeach;

        // Altera o status informando que o orçamento foi finalizado e registrado como venda.
        $this->pedido_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_pedido', $id_pedido)
            ->set('situacao', "Pago - Finalizado")
            ->update();
            
        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Pedido finalizado com sucesso!'
            ]
        );

        return redirect()->to("/pedidos/show/$id_pedido");
    }

    public function delete($id_pedido)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->pedido_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_pedido', $id_pedido)
            ->delete();

        $session = session();
        $session->setFlashdata('alert', 'success_delete');

        return redirect()->to('/pedidos');
    }
}
