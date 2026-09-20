<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\ProdutoModel;
use App\Models\SaidaDeMercadoriaModel;

use CodeIgniter\Controller;

class SaidaDeMercadorias extends Controller
{
    private $link = [
        'li' => '6.x',
        'item' => '6.0',
        'subItem' => '6.3'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $saida_de_mercadoria_model;
    private $produto_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model  = new ControleDeAcessoModel();
        $this->produto_model             = new ProdutoModel();
        $this->saida_de_mercadoria_model = new SaidaDeMercadoriaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('saida_de_mercadorias');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Saída de Mercadorias',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Saída de Mercadorias", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['saida_de_mercadorias'] = $this->saida_de_mercadoria_model
                                            ->where('saida_de_mercadorias.id_empresa', $this->id_empresa)
                                            ->select('
                                                id_saida,
                                                nome,
                                                saida_de_mercadorias.quantidade as qtd_da_saida,
                                                data,
                                                hora,
                                                observacoes
                                            ')
                                            ->join('produtos', 'produtos.id_produto = saida_de_mercadorias.id_produto')
                                            ->findAll();

        echo view('templates/header', $data);
        echo view('saida_de_mercadorias/index');
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
            'modulo' => 'Nova Saída',
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
        echo view('saida_de_mercadorias/create');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Adiciona os IDs da sessão para serem inseridos no registro.
        $dados['id_empresa'] = $this->id_empresa;

        $this->saida_de_mercadoria_model
            ->save($dados);

        // --------------------------- ATUALIZA A QUANTIDADE DO PRODUTO ------------------------------- //
        $qtd_saida = $dados['quantidade'];
        $id_produto = $dados['id_produto'];

        // Pega o produto pelo seu ID
        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->select('quantidade')
                        ->where('id_produto', $id_produto)
                        ->first();

        // Tira da quantidade do produto a quantidade da saída
        $qtd = $produto['quantidade'] - $qtd_saida;

        // Atualiza a quantidade do produto com a nova quantidade
        $this->produto_model
            ->where('id_empresa', $this->id_empresa)
            ->set('quantidade', $qtd)
            ->where('id_produto', $id_produto)
            ->update();
        // ------------------------------------------------------------------------------------------ //

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Saída cadastrada com sucesso!',
            ]
        );

        return redirect()->to('/saidaDeMercadorias');
    }

    public function delete($id_saida)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        // ----------------- DEVOLTE A QUANTIDADE DA SAÍDA PARA O PRODUTO -------------------- // 
        // Pega a reposição e sua quantidade
        $saida = $this->saida_de_mercadoria_model
                    ->where('id_empresa', $this->id_empresa)
                    ->where('id_saida', $id_saida)
                    ->first();

        $qtd_da_saida = $saida['quantidade'];

        // Pega o produto e sua quantidade e seu ID
        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $saida['id_produto'])
                        ->first();

        $id_produto = $produto['id_produto'];
        $qtd_do_produto = $produto['quantidade'];

        // Adiciona a quantidade da saída a quantidade do produto
        $qtd = $qtd_do_produto + $qtd_da_saida;

        // Atualiza o produto com a nova quantidae
        $this->produto_model
            ->where('id_empresa', $this->id_empresa)
            ->set('quantidade', $qtd)
            ->where('id_produto', $id_produto)
            ->update();
        // --------------------------------------------------------------------------------- //

        // Remove a saída
        $this->saida_de_mercadoria_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_saida', $id_saida)
            ->delete();

        // Cria um alerta na sessão e retorna
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Saída excluida com sucesso!',
            ]
        );

        return redirect()->to('/saidaDeMercadorias');
    }
}
