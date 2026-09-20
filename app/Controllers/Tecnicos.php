<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\UfModel;
use App\Models\MunicipioModel;
use App\Models\TecnicoModel;

use CodeIgniter\Controller;

class Tecnicos extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.6'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $uf_model;
    private $municipio_model;
    private $tecnico_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->uf_model                 = new UfModel();
        $this->municipio_model          = new MunicipioModel();
        $this->tecnico_model            = new TecnicoModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('tecnicos');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Técnicos',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Técnicos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['tecnicos'] = $this->tecnico_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('tecnicos/index');
        echo view('templates/footer');
    }

    public function show($id_tecnico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Técnico',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Técnicos", 'rota' => "/tecnicos", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['tecnico'] = $this->tecnico_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_tecnico', $id_tecnico)
                                ->join('ufs', 'tecnicos.id_uf = ufs.id_uf')
                                ->join('municipios', 'tecnicos.id_municipio = municipios.id_municipio')
                                ->first();

        echo view('templates/header', $data);
        echo view('tecnicos/show');
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
            'modulo' => 'Novo Técnico',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Técnicos", 'rota'   => "/tecnicos", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['ufs'] = $this->uf_model
                            ->findAll();

        $data['municipios'] = $this->municipio_model
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('tecnicos/form');
        echo view('templates/footer');
    }

    public function edit($id_tecnico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Técnico',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Técnicos", 'rota'   => "/tecnicos", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $tecnico = $this->tecnico_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_tecnico', $id_tecnico)
                        ->first();

        $data['ufs'] = $this->uf_model->findAll();

        $data['municipios'] = $this->municipio_model
                                    ->where('id_uf', $tecnico['id_uf'])
                                    ->findAll();

        $data['tecnico'] = $tecnico;

        echo view('templates/header', $data);
        echo view('tecnicos/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Remove Mascaras
        $dados['cpf']       = removeMascara($dados['cpf']);
        $dados['cep']       = removeMascara($dados['cep']);
        $dados['fixo']      = removeMascara($dados['fixo']);
        $dados['celular_1'] = removeMascara($dados['celular_1']);
        $dados['celular_2'] = removeMascara($dados['celular_2']);

        // Caso a ação é editar
        if(isset($dados['id_tecnico'])) :
            $this->tecnico_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Técnico atualizado com sucesso!'
                ]    
            );

            return redirect()->to("/tecnicos/edit/{$dados['id_tecnico']}");
        endif;

        // Caso ação seja cadastrar, adiciona id_empresa no array
        $dados['id_empresa'] = $this->id_empresa;
        
        $this->tecnico_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Técnico cadastrado com sucesso!'
            ]    
        );

        return redirect()->to('/tecnicos');
    }

    public function delete($id_tecnico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->tecnico_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_tecnico', $id_tecnico)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Técnico excluido com sucesso!'
            ]    
        );

        return redirect()->to('/tecnicos');
    }
}
