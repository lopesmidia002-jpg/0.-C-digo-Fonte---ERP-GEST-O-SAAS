<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CategoriasDosProdutosModel;

use CodeIgniter\Controller;

class CategoriasDosProdutos extends Controller
{
    private $link = [
        'li' => '6.x',
        'item' => '6.0',
        'subItem' => '6.5'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $categoria_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->categoria_model          = new CategoriasDosProdutosModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('categoria_dos_produtos');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Categorias dos Produtos',
            'icone'  => 'fa fa-database'
        ];
        
        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Categorias", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['categorias'] = $this->categoria_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('categorias_dos_produtos/index');
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
            'modulo' => 'Nova Categoria',
            'icone'  => 'fa fa-plus-circle'
        ];
        
        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Categorias dos Produtos", 'rota' => "/CategoriasDosProdutos", 'active' => false],
            ['titulo' => "Nova", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('categorias_dos_produtos/form');
        echo view('templates/footer');
    }

    public function edit($id_categoria)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Categoria',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Categorias dos Produtos", 'rota' => "/categoriasDosProdutos", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['categoria'] = $this->categoria_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_categoria', $id_categoria)
                                ->first();

        echo view('templates/header', $data);
        echo view('categorias_dos_produtos/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();
        
        // Caso a ação seja editar
        if(isset($dados['id_categoria'])) :
            $this->categoria_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Categoria atualizada com sucesso!'
                ]
            );

            return redirect()->to("/categoriasDosProdutos/edit/{$dados['id_categoria']}");
        endif;
        
        // Adiciona os id_empresa ao array
        $dados['id_empresa'] = $this->id_empresa;

        $this->categoria_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Categoria cadastrada com sucesso!'
            ]
        );

        return redirect()->to('/categoriasDosProdutos');
    }

    public function delete($id_categoria)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        // Localiza o registro e deleta
        $this->categoria_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_categoria', $id_categoria)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Categoria excluida com sucesso!'
            ]
        );

        return redirect()->to('/CategoriasDosProdutos');
    }
}
