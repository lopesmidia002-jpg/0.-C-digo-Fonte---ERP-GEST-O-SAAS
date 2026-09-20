<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\UfModel;
use App\Models\MunicipioModel;
use CodeIgniter\Controller;
use App\Models\FuncionarioModel;

class Funcionarios extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.3'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $uf_model;
    private $municipio_model;
    private $funcionario_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->uf_model                 = new UfModel();
        $this->municipio_model          = new MunicipioModel();
        $this->funcionario_model        = new FuncionarioModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('funcionarios');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Funcionários',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Funcionários", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['funcionarios'] = $this->funcionario_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('funcionarios/index');
        echo view('templates/footer');
    }

    public function show($id_funcionario)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Funcionário',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Funcionários", 'rota' => "/funcionarios", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['funcionario'] = $this->funcionario_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_funcionario', $id_funcionario)
                                    ->join('ufs', 'funcionarios.id_uf = ufs.id_uf')
                                    ->join(
                                        'municipios',
                                        'funcionarios.id_municipio = municipios.id_municipio'
                                    )
                                    ->first();

        echo view('templates/header', $data);
        echo view('funcionarios/show');
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
            'modulo' => 'Novo Funcionário',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Funcionários", 'rota'   => "/funcionarios", 'active' => false],
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
        echo view('funcionarios/form');
        echo view('templates/footer');
    }

    public function edit($id_funcionario)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Funcionário',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Funcionários", 'rota'   => "/funcionarios", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $funcionario = $this->funcionario_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('id_funcionario', $id_funcionario)
                            ->first();

        $data['ufs'] = $this->uf_model
                            ->findAll();

        $data['municipios'] = $this->municipio_model
                                    ->where('id_uf', $funcionario['id_uf'])
                                    ->findAll();

        $data['funcionario'] = $funcionario;

        echo view('templates/header', $data);
        echo view('funcionarios/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Remove todas as mascaras
        $dados['cpf']       = removeMascara($dados['cpf']);
        $dados['cep']       = removeMascara($dados['cep']);
        $dados['fixo']      = removeMascara($dados['fixo']);
        $dados['celular_1'] = removeMascara($dados['celular_1']);
        $dados['celular_2'] = removeMascara($dados['celular_2']);

        // Converte a moeda de BRL para o padrão USD
        $dados['salario'] = converteMoney($dados['salario']);
        
        // Caso o número não exite então coloca S/N
        if(!isset($dados['numero'])):
            $dados['numero'] = "S/N";
        endif;

        // Caso a ação é editar
        if(isset($dados['id_funcionario'])):
            $this->funcionario_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Funcionário atualizado com sucesso!'
                ]    
            );

            return redirect()->to("/funcionarios/edit/{$dados['id_funcionario']}");
        endif;

        // Caso ação seja cadastrar, insere o id_empresa
        $dados['id_empresa'] = $this->id_empresa;

        $this->funcionario_model
            ->insert($dados);
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Funcionário cadastrado com sucesso!'
            ]    
        );

        return redirect()->to('/funcionarios');
    }

    public function delete($id_funcionario)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->funcionario_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_funcionario', $id_funcionario)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Funcionário excluido com sucesso!'
            ]    
        );

        return redirect()->to('/funcionarios');
    }
}