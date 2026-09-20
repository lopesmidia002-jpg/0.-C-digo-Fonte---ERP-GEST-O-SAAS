<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\UfModel;
use App\Models\MunicipioModel;
use CodeIgniter\Controller;
use App\Models\FornecedorModel;

class Fornecedores extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.2'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $contole_de_acesso_model;
    private $uf_model;
    private $municipio_model;
    private $fornecedor_model;

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
        $this->fornecedor_model         = new FornecedorModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('fornecedores');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Fornecedores',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "fornecedores", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['fornecedores'] = $this->fornecedor_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('fornecedores/index');
        echo view('templates/footer');
    }

    public function show($id_fornecedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Fornecedor',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Fornecedor", 'rota' => "/fornecedores", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['fornecedor'] = $this->fornecedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_fornecedor', $id_fornecedor)
                                    ->join('ufs', 'fornecedores.id_uf = ufs.id_uf')
                                    ->join('municipios', 'fornecedores.id_municipio = municipios.id_municipio')
                                    ->first();

        echo view('templates/header', $data);
        echo view('fornecedores/show');
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
            'modulo' => 'Novo Fornecedor',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Fornecedores", 'rota'   => "/fornecedores", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['ufs'] = $this->uf_model->findAll();

        echo view('templates/header', $data);
        echo view('fornecedores/form');
        echo view('templates/footer');
    }

    public function edit($id_fornecedor)
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
            ['titulo' => "Fornecedores", 'rota'   => "/fornecedores", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $fornecedor = $this->fornecedor_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_fornecedor', $id_fornecedor)
                        ->first();

        $data['ufs'] = $this->uf_model
                            ->findAll();

        $data['municipios'] = $this->municipio_model
                                ->where('id_uf', $fornecedor['id_uf'])
                                ->findAll();

        $data['fornecedor'] = $fornecedor;

        echo view('templates/header', $data);
        echo view('fornecedores/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Remove mascaras
        $dados['cnpj']      = removeMascara($dados['cnpj']);
        $dados['cep']       = removeMascara($dados['cep']);
        $dados['comercial'] = removeMascara($dados['comercial']);
        $dados['celular_1'] = removeMascara($dados['celular_1']);
        $dados['celular_2'] = removeMascara($dados['celular_2']);
        
        // Caso a ação é editar
        if(isset($dados['id_fornecedor'])) :
            $this->fornecedor_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Fornecedor atualizado com sucesso!'
                ]    
            );

            return redirect()->to("/fornecedores/edit/{$dados['id_fornecedor']}");
        
        endif;

        // Caso a ação seja cadastrar, insere o id_empresa no array
        $dados['id_empresa'] = $this->id_empresa;

        $this->fornecedor_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Fornecedor cadastrado com sucesso!'
            ]    
        );

        return redirect()->to('/fornecedores');
    }

    public function delete($id_fornecedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->fornecedor_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_fornecedor', $id_fornecedor)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Fornecedor excluido com sucesso!'
            ]    
        );

        return redirect()->to('/fornecedores');
    }
}