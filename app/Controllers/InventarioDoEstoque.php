<?php

namespace App\Controllers;

use App\Models\EmpresaModel;
use App\Models\ControleDeAcessoModel;
use App\Models\InventarioDoEstoqueModel;
use App\Models\ProdutoDoInventarioModel;
use App\Models\ProdutoModel;

use CodeIgniter\Controller;

class InventarioDoEstoque extends Controller
{
    private $link = [
        'li' => '6.x',
        'item' => '6.0',
        'subItem' => '6.4'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $empresa_model;
    private $controle_de_acesso_model;
    private $inventario_do_estoque_model;
    private $produto_model;
    private $produto_do_inventario_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->empresa_model               = new EmpresaModel();
        $this->controle_de_acesso_model    = new ControleDeAcessoModel();
        $this->inventario_do_estoque_model = new InventarioDoEstoqueModel();
        $this->produto_model               = new ProdutoModel();
        $this->produto_do_inventario_model = new ProdutoDoInventarioModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('inventario_do_estoque');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Inventário do Estoque',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Inventário do Estoque", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['inventarios'] = $this->inventario_do_estoque_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/index');
        echo view('templates/footer');
    }

    public function create_1()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $produtos = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->findAll();

        $dados = [
            'descricao' => "Inventario - Data: ".date('d/m/Y')." Hora: ".date('H:i:s'),
            'data'      => date('Y-m-d'),
            'observacoes' => "Inventário completo do estoque atual."
        ];

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $id_inventario = $this->inventario_do_estoque_model
                                ->insert($dados);

        foreach($produtos as $produto) :
            $this->produto_do_inventario_model->insert([
                'discriminacao'  => $produto['nome'],
                'unidade'        => $produto['unidade'],
                'quantidade'     => $produto['quantidade'],
                'valor_unitario' => $produto['valor_de_venda'],
                'id_inventario'  => $id_inventario,
                'id_empresa'     => $this->id_empresa,
            ]);
        endforeach;

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Inventário do Estoque gerado com sucesso!',
            ]
        );

        return redirect()->to('/inventarioDoEstoque');
    }

    public function show($id_inventario)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Relatório - Registro de Inventário',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Todos Inventários", 'rota' => "/inventarioDoEstoque", 'active' => false],
            ['titulo' => "Inventário", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa'] = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['inventario'] = $this->inventario_do_estoque_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_inventario', $id_inventario)
                                    ->first();

        $data['produtos_do_inventario'] = $this->produto_do_inventario_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_inventario', $id_inventario)
                                                ->findAll();

        $data['id_inventario'] = $id_inventario;

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/show');
        echo view('templates/footer');
    }

    public function edit($id_inventario) // Editar dados do Inventário do Estoque
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Editar dados do Inventário',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Todos Inventários", 'rota' => "/inventarioDoEstoque", 'active' => false],
            ['titulo' => "Editar Inventário", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['inventario'] = $this->inventario_do_estoque_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_inventario', $id_inventario)
                                    ->first();

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/edit');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        $this->inventario_do_estoque_model
            ->where('id_empresa', $this->id_empresa)
            ->save($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Inventário do Estoque atualizado com sucesso!',
            ]
        );

        return redirect()->to('/inventarioDoEstoque');
    }

    public function add($id_inventario) // Adiciona um novo produto ao inventário
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Add Produto ao Inventário',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Todos Inventários", 'rota' => "/inventarioDoEstoque", 'active' => false],
            ['titulo' => "Inventário", 'rota' => "/inventarioDoEstoque/show/$id_inventario", 'active' => false],
            ['titulo' => "Add Produto", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['id_inventario'] = $id_inventario;

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/form_produto');
        echo view('templates/footer');
    }

    public function listaProdutos($id_inventario) // Lista os produtos para poder excluir ou editar os registros.
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Editar/Excluir Produto',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Todos Inventários", 'rota' => "/inventarioDoEstoque", 'active' => false],
            ['titulo' => "Inventário", 'rota' => "/inventarioDoEstoque/show/$id_inventario", 'active' => false],
            ['titulo' => "Editar/Excluir Produto", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['id_inventario'] = $id_inventario;

        $data['produtos_do_inventario'] = $this->produto_do_inventario_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_inventario', $id_inventario)
                                                ->findAll();

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/lista_produtos');
        echo view('templates/footer');
    }

    public function editProduto($id_inventario, $id_produto_do_inventario) // Edita o produto do inventário
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Produto do Inventário',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Todos Inventários", 'rota' => "/inventarioDoEstoque", 'active' => false],
            ['titulo' => "Inventário", 'rota' => "/inventarioDoEstoque/show/$id_inventario", 'active' => false],
            ['titulo' => "Editar/Excluir Produto", 'rota' => "/inventarioDoEstoque/listaProdutos/$id_inventario", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produto'] = $this->produto_do_inventario_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_produto_do_inventario', $id_produto_do_inventario)
                                ->first();

        $data['id_inventario'] = $id_inventario;

        echo view('templates/header', $data);
        echo view('inventario_do_estoque/form_produto');
        echo view('templates/footer');
    }

    public function store_produto() // Store para create e edit do produto
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte de BRL para USD
        $dados['valor_unitario'] = converteMoney($dados['valor_unitario']);

        if(isset($dados['id_produto_do_inventario'])) :
            $this->produto_do_inventario_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);
            
            $this->session->setFlashdata(
            'alert',
                [
                    'type'  => 'success',
                    'title' => 'Produto do inventário editado com sucesso!',
                ]
            );

            return redirect()->to("/inventarioDoEstoque/listaProdutos/{$dados['id_inventario']}");
        endif;

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->produto_do_inventario_model
            ->save($dados);

        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto adicionado com sucesso ao Inventário!',
            ]
        );

        return redirect()->to("/inventarioDoEstoque/show/{$dados['id_inventario']}");
    }

    public function delete($id_inventario) // Deleta o inventário
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->inventario_do_estoque_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_inventario', $id_inventario)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Inventário do Estoque excluido com sucesso!',
            ]
        );

        return redirect()->to('/inventarioDoEstoque');
    }

    public function deleteProduto($id_inventario, $id_produto_do_inventario) // Deleta o produto do inventário
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->produto_do_inventario_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_do_inventario', $id_produto_do_inventario)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto do Inventário excluido com sucesso!',
            ]
        );

        return redirect()->to("/inventarioDoEstoque/listaProdutos/$id_inventario");
    }
}
