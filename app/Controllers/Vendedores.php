<?php

namespace App\Controllers;

use App\Models\ProdutoDaVendaModel;
use App\Models\VendaModel;
use App\Models\ControleDeAcessoModel;
use App\Models\VendedorModel;

use CodeIgniter\Controller;

class Vendedores extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.4'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $produto_da_venda_model;
    private $venda_model;
    private $controle_de_acesso_model;
    private $funcionario_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->produto_da_venda_model   = new ProdutoDaVendaModel();
        $this->venda_model              = new VendaModel();
        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->vendedor_model           = new VendedorModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('vendedores');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Vendedores',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendedores", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['vendedores'] = $this->vendedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('vendedores/index');
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
            'modulo' => 'Novo Vendedor',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendedores", 'rota'   => "/vendedores", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('vendedores/form');
        echo view('templates/footer');
    }

    public function edit($id_vendedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Vendedor',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendedores", 'rota'   => "/funcionarios", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['vendedor'] = $this->vendedor_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_vendedor', $id_vendedor)
                                ->first();

        echo view('templates/header', $data);
        echo view('vendedores/form');
        echo view('templates/footer');
    }

    public function show($id_vendedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Dados do Vendedor',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendedores", 'rota'   => "/funcionarios", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['id_vendedor'] = $id_vendedor;

        $data['vendedor'] = $this->vendedor_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_vendedor', $id_vendedor)
                                ->first();

        echo view('templates/header', $data);
        echo view('vendedores/show');
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
        if(isset($dados['id_vendedor'])) :
            $this->vendedor_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Vendedor atualizado com sucesso!'
                ]    
            );
            
            return redirect()->to("/vendedores/edit/{$dados['id_vendedor']}");
        endif;

        // Caso ação seja cadastrar, ediciona id_empresa no array
        $dados['id_empresa'] = $this->id_empresa;

        $this->vendedor_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Vendedor cadastrado com sucesso!'
            ]
        );

        return redirect()->to('/vendedores');
    }

    public function delete($id_vendedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->vendedor_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_vendedor', $id_vendedor)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Vendedor excluido com sucesso!'
            ]    
        );

        return redirect()->to('/vendedores');
    }

    public function relatorioDeVendasComissao($id_vendedor)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Relatório de Vendas e Comissão',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendedores", 'rota'   => "/vendedores", 'active' => false],
            ['titulo' => "Relatório de Vendas e Comissão", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['id_vendedor'] = $id_vendedor;

        $dados = $this->request->getVar();

        if(!isset($dados['data_inicio'])):
            $data_inicio = date('Y-m-d');
            $data_final = date('Y-m-d');
        else:
            $data_inicio = $dados['data_inicio'];
            $data_final = $dados['data_final'];
        endif;

        $vendas_realizadas_pelo_vendedor = $this->venda_model
                                                ->where('id_vendedor', $id_vendedor)
                                                ->where('data >=', $data_inicio)
                                                ->where('data <=', $data_final)
                                                ->find();

        $produtos_vendidos_pelo_vendedor = [];

        foreach($vendas_realizadas_pelo_vendedor as $venda):
            $produtos_da_venda = $this->produto_da_venda_model
                                        ->where('id_venda', $venda['id_venda'])
                                        ->find();

            foreach($produtos_da_venda as $produto):
                $produtos_vendidos_pelo_vendedor[] = $produto;
            endforeach;
        endforeach;

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => 'Relatório gerado com sucesso!'
                ]
            );

        $data['produtos_vendidos_pelo_vendedor'] = $produtos_vendidos_pelo_vendedor;

        $data['data_inicio'] = $data_inicio;
        $data['data_final'] = $data_final;

        echo view('templates/header', $data);
        echo view('vendedores/relatorio_de_vendas_e_comissao');
        echo view('templates/footer');
    }
}