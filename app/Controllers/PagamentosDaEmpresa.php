<?php

namespace App\Controllers;

use App\Models\PagamentoDaEmpresaModel;
use App\Models\ControleDeAcessoModel;
use CodeIgniter\Controller;

class PagamentosDaEmpresa extends Controller
{
    private $link = [
        'item' => '2'
    ];

    private $session;

    private $pagamento_da_empresa_model;
    private $controle_de_acesso_model;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();

        $this->pagamento_da_empresa_model = new PagamentoDaEmpresaModel();
        $this->controle_de_acesso_model   = new ControleDeAcessoModel();
    }

    public function index($id_empresa)
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Pagamentos da Empresa',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Empresas", 'rota' => "/empresas", 'active' => false],
            ['titulo' => "Pagamentos da Empresa", 'rota'   => "", 'active' => true]
        ];

        $data['pagamentos'] = $this->pagamento_da_empresa_model
                                ->where('id_empresa', $id_empresa)
                                ->findAll();

        $data['id_empresa'] = $id_empresa;

        echo view('templates/header');
        echo view('admin/pagamentos_da_empresa/index', $data);
        echo view('templates/footer');
    }

    public function show($id_empresa, $id_pagamento)
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Pagamentos da Empresa',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Empresas", 'rota' => "/empresas", 'active' => false],
            ['titulo' => "Pagamentos da Empresa", 'rota'   => "", 'active' => true]
        ];

        $data['pagamento'] = $this->pagamento_da_empresa_model
                                ->where('id_empresa', $id_empresa)
                                ->where('id_pagamento', $id_pagamento)
                                ->first();

        echo view('templates/header');
        echo view('admin/pagamentos_da_empresa/show', $data);
        echo view('templates/footer');
    }

    public function create($id_empresa)
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Pagamento',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Empresas", 'rota'   => "/empresas", 'active' => false],
            ['titulo' => "Pagametos", 'rota'   => "/pagamentosDaEmpresa/index/{$id_empresa}", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['id_empresa'] = $id_empresa;

        echo view('templates/header');
        echo view('admin/pagamentos_da_empresa/form', $data);
        echo view('templates/footer');
    }

    public function edit($id_empresa, $id_pagamento)
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Pagamento',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Empresas", 'rota'   => "/empresas", 'active' => false],
            ['titulo' => "Pagametos", 'rota'   => "/pagamentosDaEmpresa/index/{$id_empresa}", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['pagamento'] = $this->pagamento_da_empresa_model
                                    ->where('id_empresa', $id_empresa)
                                    ->where('id_pagamento', $id_pagamento)
                                    ->first();

        $data['id_empresa'] = $id_empresa;

        echo view('templates/header');
        echo view('admin/pagamentos_da_empresa/form', $data);
        echo view('templates/footer');
    }

    public function store($id_empresa)
    {
        $dados = $this->request->getVar();
        
        // Converte de BRL para USD
        $dados['valor'] = converteMoney($dados['valor']);

        // Insere id_empresa no array
        $dados['id_empresa'] = $id_empresa;
        
        // Caso a ação seja editar
        if(isset($dados['id_pagamento'])):
            $this->pagamento_da_empresa_model
                ->where('id_empresa', $id_empresa)
                ->where('id_pagamento', $dados['id_pagamento'])
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => 'Pagamento atualizado com sucesso!'
                ]
            );

            return redirect()->to("/pagamentosDaEmpresa/edit/{$id_empresa}/{$dados['id_pagamento']}");
        endif;

        // Caso a ação seja cadastrar
        $this->pagamento_da_empresa_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Pagamento cadastrado com sucesso!'
            ]
        );

        return redirect()->to("/pagamentosDaEmpresa/index/{$id_empresa}");
    }

    public function delete($id_empresa, $id_pagamento)
    {
        $this->pagamento_da_empresa_model
            ->where('id_empresa', $id_empresa)
            ->where('id_pagamento', $id_pagamento)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Pagamento excluido com sucesso!'
            ]
        );

        return redirect()->to("/pagamentosDaEmpresa/index/{$id_empresa}");
    }
}

?>