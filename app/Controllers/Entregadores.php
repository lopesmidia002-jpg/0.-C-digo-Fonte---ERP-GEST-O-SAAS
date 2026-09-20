<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\EntregadorModel;

use CodeIgniter\Controller;

class Entregadores extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.5'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $entregador_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->entregador_model         = new EntregadorModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('entregadores');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
    
        $data['titulo'] = [
            'modulo' => 'Entregadores',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregadores", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entregadores'] = $this->entregador_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('entregadores/index');
        echo view('templates/footer');
    }

    public function create()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Entregador',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregadores", 'rota'   => "/entregadores", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('entregadores/form');
        echo view('templates/footer');
    }

    public function edit($id_entregador)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Entregador',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregadores", 'rota'   => "/funcionarios", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entregador'] = $this->entregador_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_entregador', $id_entregador)
                                    ->first();

        echo view('templates/header', $data);
        echo view('entregadores/form');
        echo view('templates/footer');
    }

    public function show($id_entregador)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Entregador',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregadores", 'rota'   => "/funcionarios", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entregador'] = $this->entregador_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_entregador', $id_entregador)
                                    ->first();

        echo view('templates/header', $data);
        echo view('entregadores/show');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Caso a ação é editar
        if(isset($dados['id_entregador'])) :
            $this->entregador_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Entregador atualizado com sucesso!'
                ]    
            );

            return redirect()->to("/entregadores/edit/{$dados['id_entregador']}");
        endif;

        // Caso ação seja cadastrar, insere id_empresa no array
        $dados['id_empresa']  = $this->id_empresa;

        $this->entregador_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Entregador cadastrado com sucesso!'
            ]    
        );

        return redirect()->to('/entregadores');
    }

    public function delete($id_entregador)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->entregador_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_entregador', $id_entregador)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Entregador excluido com sucesso!'
            ]    
        );

        return redirect()->to('/entregadores');
    }
}