<?php

namespace App\Controllers;

use App\Models\CaixaModel;
use App\Models\PagamentoDoClienteModel;
use CodeIgniter\Controller;

class PagamentosDoCliente extends Controller
{
    private $links;
    private $pagamento_do_cliente_model;
    private $caixa_model;

    function __construct()
    {
        $this->links = [
            'menu' => '5.m',
            'item' => '5.0',
            'subItem' => '5.2'
        ];

        $this->pagamento_do_cliente_model = new PagamentoDoClienteModel();
        $this->caixa_model = new CaixaModel();
    }

    public function create($id_cliente)
    {
        $data['links'] = $this->links;

        $data['titulo'] = [
            'modulo' => 'Novo Pagameto',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Clientes", 'rota' => "/clientes", 'active' => false],
            ['titulo' => "Dados do Cliente", 'rota' => "/clientes/show/$id_cliente", 'active' => false],
            ['titulo' => "Novo PGTO", 'rota'   => "", 'active' => true]
        ];

        $data['id_cliente'] = $id_cliente;

        echo view('templates/header');
        echo view('pagamentos_do_cliente/form', $data);
        echo view('templates/footer');
    }

    public function edit($id_pagamento, $id_cliente)
    {
        $data['links'] = $this->links;

        $data['titulo'] = [
            'modulo' => 'Editar Pagamento do Cliente',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Cliente", 'rota' => "/clientes/show/$id_cliente", 'active' => false],
            ['titulo' => "Editar PGTO", 'rota'   => "", 'active' => true]
        ];

        $data['pagamento']  = $this->pagamento_do_cliente_model->where('id_pagamento', $id_pagamento)->first();
        $data['id_cliente'] = $id_cliente;

        echo view('templates/header');
        echo view('pagamentos_do_cliente/form', $data);
        echo view('templates/footer');
    }

    public function store()
    {
        $dados = $this->request->getvar();
        $this->pagamento_do_cliente_model->save($dados);

        $session = session();

        // Se o usuário estiver editando
        if(isset($dados['id_pagamento']))
        {
            $session->setFlashdata('alert', 'success_edit_pagamento');

            return redirect()->to("/clientes/show/{$dados['id_cliente']}");
        }

        $session->setFlashdata('alert', 'success_create_pagamento');

        return redirect()->to("/clientes/show/{$dados['id_cliente']}");
    }

    public function delete($id_pagamento, $id_cliente)
    {
        $this->pagamento_do_cliente_model->where('id_pagamento', $id_pagamento)->delete();

        $session = session();
        $session->setFlashdata('alert', 'success_delete_pagamento');

        return redirect()->to("/clientes/show/$id_cliente");
    }
}