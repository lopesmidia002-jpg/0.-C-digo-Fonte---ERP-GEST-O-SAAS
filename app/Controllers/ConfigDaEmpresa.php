<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\MunicipioModel;
use App\Models\UfModel;
use App\Models\EmpresaModel;
use CodeIgniter\Controller;

class ConfigDaEmpresa extends Controller
{
    private $session;
    private $id_empresa;
    private $id_login;

    private $link = [
        'li' => '12.x',
        'item' => '12.0',
        'subItem' => '12.3'
    ];

    private $controle_de_acesso_model;
    private $empresa_model;
    private $uf_model;
    private $municipio_model;

    private $permissao;

    function __construct()
    {
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->helpers = ['app'];

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->municipio_model          = new MunicipioModel();
        $this->uf_model                 = new UfModel();
        $this->empresa_model            = new EmpresaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('config_da_empresa');
    }

    public function edit()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Configurações da Empresa',
            'icone'  => 'fa fa-user-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/admin/inicio", 'active' => false],
            ['titulo' => "Configuracoes da Conta", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa'] = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['ufs'] = $this->uf_model
                                ->findAll();

        $data['municipios'] = $this->municipio_model
                                            ->findAll();

        echo view('templates/header', $data);
        echo view('config/form_config_da_empresa');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getVar();

        // Remove Mascara
        $dados['CNPJ'] = removeMascara($dados['CNPJ']);
        $dados['CEP'] = removeMascara($dados['CEP']);
        $dados['fone'] = removeMascara($dados['fone']);

        $this->empresa_model
            ->where('id_empresa', $this->id_empresa)
            ->set($dados)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Dados da empresa atualizado com sucesso!'
            ]
        );

        return redirect()->to('/configDaEmpresa/edit');
    }
}

?>