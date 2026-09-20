<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\ProdutoModel;
use App\Models\ReposicaoModel;

use CodeIgniter\Controller;

class Reposicoes extends Controller
{
    private $link = [
        'li' => '6.x',
        'item' => '6.0',
        'subItem' => '6.2'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $reposicao_model;
    private $produto_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->reposicao_model          = new ReposicaoModel();
        $this->produto_model            = new ProdutoModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('reposicoes');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Reposições de Produtos',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Reposições", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['reposicoes'] = $this->reposicao_model
                                    ->where('reposicoes.id_empresa', $this->id_empresa)
                                    ->select('
                                        id_reposicao,
                                        nome,
                                        reposicoes.quantidade as qtd_da_reposicao,
                                        data,
                                        hora,
                                        observacoes
                                    ')
                                    ->join('produtos', 'produtos.id_produto = reposicoes.id_produto')
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('reposicoes/index');
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
            'modulo' => 'Nova Reposição',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Reposições", 'rota' => "/reposicoes", 'active' => false],
            ['titulo' => "Nova", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produtos'] = $this->produto_model
                            ->where('id_empresa', $this->id_empresa)
                            ->findAll();

        echo view('templates/header', $data);
        echo view('reposicoes/create');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();
        $dados['id_empresa']  = $this->id_empresa;

        $this->reposicao_model
            ->save($dados);

        // --------------------------- ATUALIZA A QUANTIDADE DO PRODUTO ------------------------------- //
        $qtd_reposicao = $dados['quantidade'];
        $id_produto = $dados['id_produto'];

        // Pega o produto pelo seu ID
        $produto = $this->produto_model
                        ->select('quantidade')
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $id_produto)
                        ->first();

        // Atribui a quantidade da reposição a quantidade do produto
        $qtd = $qtd_reposicao + $produto['quantidade'];

        // Atualiza a quantidade do produto com a nova quantidade
        $this->produto_model
            ->set('quantidade', $qtd)
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto', $id_produto)
            ->update();
        // ------------------------------------------------------------------------------------------ //
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Reposição cadastrada com sucesso!',
            ]
        );

        return redirect()->to('/reposicoes');
    }

    public function delete($id_reposicao)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        // ---------- RETIRA A QUANTIDADE DA REPOSIÇÃO DA QUANTIDADE DO PRODUTO ------------- // 
        // Pega a reposição e sua quantidade
        $reposicao = $this->reposicao_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_reposicao', $id_reposicao)
                        ->first();

        $qtd_da_reposicao = $reposicao['quantidade'];

        // Pega o produto e sua quantidade e seu ID
        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $reposicao['id_produto'])
                        ->first();
        
        $id_produto = $produto['id_produto'];
        $qtd_do_produto = $produto['quantidade'];

        // Tira da quantidade do produto a quantidade da reposição
        $qtd = $qtd_do_produto - $qtd_da_reposicao;
        
        // Atualiza o produto com a nova quantidae
        $this->produto_model
            ->set('quantidade', $qtd)
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto', $id_produto)
            ->update();
        // --------------------------------------------------------------------------------- //

        // Remove a reposição
        $this->reposicao_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_reposicao', $id_reposicao)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Reposição excluida com sucesso!',
            ]
        );

        return redirect()->to('/reposicoes');
    }
}
