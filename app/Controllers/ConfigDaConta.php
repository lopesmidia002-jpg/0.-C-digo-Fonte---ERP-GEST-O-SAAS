<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\EmpresaModel;

use CodeIgniter\Controller;

class ConfigDaConta extends Controller
{
    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $empresa_model;

    private $permissao;

    private $link = [
        'li' => '12.x',
        'item' => '12.0',
        'subItem' => '12.2'
    ];

    function __construct()
    {
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->empresa_model            = new EmpresaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('config_da_conta');
    }

    public function edit()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Configurações da Conta',
            'icone'  => 'fa fa-user-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/admin/inicio", 'active' => false],
            ['titulo' => "Configuracoes", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa'] = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        echo view('templates/header', $data);
        echo view('config/form_config_da_conta');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $dados = $this->request->getVar();
        $file = $this->request->getFile('arquivo');

        // Verifica se foi selecionado uma imagem, e atribui ao array o nome do arquivo depois de movido para a pasta.
        if ($file->isValid()) :
            // Se a ação for editar, e se foi selecionado uma foto para trocar, então remove a que já existe e cadastra a nova
            if(isset($dados['id_empresa'])) :
                
                $empresa = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

                if($empresa['logomarca'] != "") :
                    unlink("assets/img/logomarcas/{$empresa['logomarca']}");
                endif;
                
            endif;

            $name = $file->getRandomName();
            $file->store('../../public/assets/img/logomarcas/', $name);

            $dados['logomarca'] = $name;
        endif;

        $this->empresa_model
            ->where('id_empresa', $this->id_empresa)
            ->save($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Alterações realizadas com sucesso! Feche e abra novamente o sistema.'
            ]
        );

        return redirect()->to('/configDaConta/edit');
    }
}

?>