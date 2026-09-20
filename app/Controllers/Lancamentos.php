<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\LancamentoModel;

use CodeIgniter\Controller;

class Lancamentos extends Controller
{
    private $link = [
        'li' => '7.x',
        'item' => '7.0',
        'subItem' => '7.2'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $lancamento_model;
    private $caixa_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->lancamento_model         = new LancamentoModel();
        $this->caixa_model              = new CaixaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('lancamentos');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Lançamentos',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['lancamentos'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('lancamentos/index');
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
            'modulo' => 'Novo Lançamento',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota' => "/lancamentos", 'active' => false],
            ['titulo' => "Nova", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', 'Aberto')
                                ->findAll();

        echo view('templates/header', $data);
        echo view('lancamentos/form');
        echo view('templates/footer');
    }

    public function show($id_lancamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Lançamento',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota' => "/lancamentos", 'active' => false],
            ['titulo' => "Ver", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['lancamento'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_lancamento', $id_lancamento)
                                    ->first();

        echo view('templates/header', $data);
        echo view('lancamentos/show');
        echo view('templates/footer');
    }

    public function edit($id_lancamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Lançamento',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota' => "/lancamentos", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['lancamento'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_lancamento', $id_lancamento)
                                    ->first();

        echo view('templates/header', $data);
        echo view('lancamentos/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte de BRL para USD
        $dados['valor'] = converteMoney($dados['valor']);

        // Se o usuário estiver editando
        if(isset($dados['id_lancamento'])) :
            $this->lancamento_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Lançamento atualizado com sucesso!'
                ]
            );
            
            return redirect()->to("/lancamentos/edit/{$dados['id_lancamento']}");
        endif;

        // Adiciona os IDs
        $dados['id_empresa'] = $this->id_empresa;

        $this->lancamento_model
            ->save($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Lançamento cadastrado com sucesso!'
            ]
        );

        return redirect()->to('/lancamentos');
    }

    public function delete($id_lancamento)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->lancamento_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_lancamento', $id_lancamento)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Lançamento excluido com sucesso!'
            ]
        );

        return redirect()->to('/lancamentos');
    }
}
