<?php

namespace App\Controllers;

use App\Models\FormaDePagamentoModel;
use CodeIgniter\Controller;

class FormasDePagamento extends Controller
{
    private $session;

    private $tipo = 1;

    private $link;
    private $forma_de_pagamento_model;

    function __construct()
    {
        $this->session = session();

        $this->link = [
            'li' => '5.x',
            'item' => '5.0',
            'subItem' => '5.4'
        ];

        $this->forma_de_pagamento_model = new FormaDePagamentoModel();
    }

    public function index()
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Formas de Pagamento',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Formas de Pagamento", 'rota'   => "", 'active' => true]
        ];

        $data['formas_de_pagamento'] = $this->forma_de_pagamento_model->findAll();

        echo view('templates/header', $data);
        echo view('formas_de_pagamento/index');
        echo view('templates/footer');
    }

    public function create()
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Nova Forma de Pagamento',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Formas de Pagamento", 'rota'   => "", 'active' => true]
        ];

        echo view('templates/header', $data);
        echo view('formas_de_pagamento/form');
        echo view('templates/footer');
    }

    public function edit($id_forma)
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Editar Forma de Pagamento',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Formas de Pagamento", 'rota'   => "", 'active' => true]
        ];

        $data['forma_de_pagamento'] = $this->forma_de_pagamento_model
                                                    ->where('id_forma', $id_forma)
                                                    ->first();

        echo view('templates/header', $data);
        echo view('formas_de_pagamento/form');
        echo view('templates/footer');
    }

    public function store()
    {
        $dados = $this->request->getVar();

        // Caso ação seja editar
        if(isset($dados['id_forma'])):
            
            $this->forma_de_pagamento_model
                ->where('id_forma', $dados['id_forma'])
                ->set($dados)
                ->update();

            $this->session
                ->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Forma de Pagamento atualizada com sucesso!'
                    ]
                );

            return redirect()->to("/formasDePagamento/edit/{$dados['id_forma']}");

        endif;
        
        // Caso a ação seja cadastrar
        $this->forma_de_pagamento_model
                            ->insert($dados);

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Forma de Pagamento cadastrada com sucesso!'
                ]
            );

        return redirect()->to('/formasDePagamento');
    }

    public function delete($id_forma)
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //
        
        $this->forma_de_pagamento_model
                    ->where('id_forma', $id_forma)
                    ->delete();

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Forma de Pagamento excluida com sucesso!'
                ]
            );

        return redirect()->to('/formasDePagamento');
    }
}
