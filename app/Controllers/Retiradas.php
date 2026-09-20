<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\RetiradaModel;

use CodeIgniter\Controller;

class Retiradas extends Controller
{
    private $link = [
        'li' => '7.x',
        'item' => '7.0',
        'subItem' => '7.3'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $retirada_model;
    private $caixa_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->retirada_model           = new RetiradaModel();
        $this->caixa_model              = new CaixaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('retiradas_do_caixa');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Retiradas',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Retiradas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['retiradas'] = $this->retirada_model      
                                    ->where('id_empresa', $this->id_empresa)     
                                    ->findAll();   

        echo view('templates/header', $data);
        echo view('retiradas/index');
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
            'modulo' => 'Nova Retirada',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota' => "/retiradas", 'active' => false],
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
        echo view('retiradas/form');
        echo view('templates/footer');
    }

    public function edit($id_retirada)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Retirada',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Lançamentos", 'rota' => "/retiradas", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['retirada'] = $this->retirada_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_retirada', $id_retirada)
                                ->first();

        echo view('templates/header', $data);
        echo view('retiradas/form');
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

        if(isset($dados['id_retirada'])) :
            $this->retirada_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Retirada atualizada com sucesso!'
                ]
            );

            return redirect()->to("/retiradas/edit/{$dados['id_retirada']}");
        endif;

        // Adiciona IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->retirada_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Retirada cadastrada com sucesso!'
            ]
        );

        return redirect()->to('/retiradas');
    }

    public function delete($id_retirada)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->retirada_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_retirada', $id_retirada)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Retirada excluida com sucesso!'
            ]
        );
        
        return redirect()->to('/retiradas');
    }
}