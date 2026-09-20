<?php

namespace App\Controllers;

use App\Models\LoginModel;
use App\Models\ConfiguracaoModel;
use CodeIgniter\Controller;

class Configuracoes extends Controller
{
    private $link = [
        'item' => '5'
    ];

    private $session;

    private $login_model;
    private $configuracao_model;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();

        $this->login_model        = new LoginModel();
        $this->configuracao_model = new ConfiguracaoModel();
    }

    public function edit()
    {
        $data['link'] = [
            'li' => '5.x',
            'item' => '5.0',
            'subItem' => '5.1'
        ];

        $data['titulo'] = [
            'modulo' => 'Configurações',
            'icone'  => 'fa fa-user-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/admin/inicio", 'active' => false],
            ['titulo' => "Configuracoes", 'rota'   => "", 'active' => true]
        ];

        $data['configuracao'] = $this->configuracao_model
                                    ->where('id_config', 1)
                                    ->first();

        echo view('templates/header');
        echo view('admin/configuracoes/form', $data);
        echo view('templates/footer');
    }

    public function store()
    {
        $dados = $this->request->getVar();
        $file = $this->request->getFile('arquivo');

        // Verifica se foi selecionado uma imagem, e atribui ao
        // array o nome do arquivo depois de movido para a pasta.
        if ($file->isValid()) :
            $configuracao = $this->configuracao_model
                                ->where('id_config', 1)
                                ->first();

            if($configuracao['logomarca'] != "") :
                unlink("assets/img/logomarcas/" . $configuracao['logomarca']);
            endif;

            $name = $file->getRandomName();
            $file->store('../../public/assets/img/logomarcas/', $name);

            $dados['logomarca'] = $name;
        endif;

        // Remove Mascaras
        $dados['CNPJ'] = removeMascara($dados['CNPJ']);

        // Adiciona id_config ao array
        $dados['id_config'] = 1;

        $this->configuracao_model
            ->save($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Sucesso! Feche e abra novamente o sistema para ver as alterações.'
            ]
        );

        return redirect()->to('/configuracoes/edit');
    }

    // ----------------------------------------------------- LOGIN --------------------------------------------------- //
    public function editLogin()
    {
        $data['link'] = [
            'li' => '5.x',
            'item' => '5.0',
            'subItem' => '5.2'
        ];

        $data['titulo'] = [
            'modulo' => 'Configurações do Login',
            'icone'  => 'fa fa-user-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/admin/inicio", 'active' => false],
            ['titulo' => "Configuracoes", 'rota'   => "", 'active' => true]
        ];

        $data['configuracao'] = $this->configuracao_model
                                    ->where('id_config', 1)
                                    ->first();

        $data['login'] = $this->login_model
                            ->where('id_login', 1)
                            ->first();

        echo view('templates/header');
        echo view('admin/configuracoes/form_login', $data);
        echo view('templates/footer');
    }

    public function storeLogin()
    {
        $dados = $this->request->getVar();
        $file = $this->request->getFile('arquivo');

        // Verifica se foi selecionado uma imagem, e atribui ao
        // array o nome do arquivo depois de movido para a pasta.
        if ($file->isValid()) :
            $configuracao = $this->configuracao_model
                                ->where('id_config', 1)
                                ->first();

            if($configuracao['arquivo-imagem-de-fundo-login'] != "") :
                unlink("assets/img/" . $configuracao['arquivo-imagem-de-fundo-login']);
            endif;

            $name = "arquivo-imagem-de-fundo-login.jpg";
            $file->store('../../public/assets/img/', $name);

            $dados['arquivo-imagem-de-fundo-login'] = $name;

            $this->configuracao_model
                ->where('id_config', 1)
                ->set('arquivo-imagem-de-fundo-login', $name)
                ->update();
        endif;

        $this->login_model
            ->where('id_login', 1)
            ->set($dados)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Sucesso! Feche e abra novamente o sistema para ver as alterações.'
            ]
        );

        return redirect()->to('/configuracoes/editLogin');
    }

    public function deleteImagemDeDundoLogin()
    {
        unlink("assets/img/arquivo-imagem-de-fundo-login.jpg");

        $configuracao = $this->configuracao_model
                                ->where('id_config', 1)
                                ->set('arquivo-imagem-de-fundo-login', "")
                                ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Imagem de fundo do LOGIN excluida com sucesso!'
            ]
        );

        return redirect()->to('/configuracoes/editLogin');
    }
}

?>