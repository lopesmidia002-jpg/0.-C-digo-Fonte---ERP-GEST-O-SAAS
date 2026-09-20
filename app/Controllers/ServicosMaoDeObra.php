<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\ServicoMaoDeObraModel;

use CodeIgniter\Controller;

class ServicosMaoDeObra extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.7'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $servico_mao_de_obra_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model  = new ControleDeAcessoModel();
        $this->servico_mao_de_obra_model = new ServicoMaoDeObraModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('servico_mao_de_obra');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Serviços/Mão de Obra',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Serviços/Mão de Obra", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['servicos'] = $this->servico_mao_de_obra_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('servicos_mao_de_obra/index');
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
            'modulo' => 'Novo Serviço/Mão de Obra',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Serviços/Mão de Obra", 'rota'   => "/servicosMaoDeObra", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('servicos_mao_de_obra/form');
        echo view('templates/footer');
    }

    public function edit($id_servico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Serviço/Mão de Obra',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Serviços/Mão de Obra", 'rota'   => "/servicosMaoDeObra", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['servico'] = $this->servico_mao_de_obra_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_servico', $id_servico)
                                ->first();

        echo view('templates/header', $data);
        echo view('servicos_mao_de_obra/form');
        echo view('templates/footer');
    }

    public function show($id_servico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Serviço/Mão de Obra',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Serviços/Mão de Obra", 'rota'   => "/servicosMaoDeObra", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['servico'] = $this->servico_mao_de_obra_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_servico', $id_servico)
                                ->first();

        echo view('templates/header', $data);
        echo view('servicos_mao_de_obra/show');
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

        // Caso a ação é editar
        if(isset($dados['id_servico'])) :
            $this->servico_mao_de_obra_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Serviço/Mão de Obra atualizado com sucesso!'
                ]    
            );

            return redirect()->to("/servicosMaoDeObra/edit/{$dados['id_servico']}");
        endif;

        // Caso ação seja cadastrar, insere id_empresa no array
        $dados['id_empresa'] = $this->id_empresa;

        $this->servico_mao_de_obra_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Serviço/Mão de Obra cadastrado com sucesso!'
            ]    
        );

        return redirect()->to('/servicosMaoDeObra');
    }

    public function delete($id_servico)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->servico_mao_de_obra_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_servico', $id_servico)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Serviço/Mão de Obra excluido com sucesso!'
            ]    
        );

        return redirect()->to('/servicosMaoDeObra');
    }
}
