<?php

namespace App\Controllers;

use App\Models\UnidadeModel;
use App\Models\TransportadoraModel;
use App\Models\ControleDeAcessoModel;
use App\Models\EmpresaModel;
use App\Models\VendedorModel;
use App\Models\ClienteModel;
use App\Models\ProdutoDaVendaModel;
use App\Models\VendaModel;

use CodeIgniter\Controller;

class Vendas extends Controller
{
    private $link = [
        'li' => '2.x',
        'item' => '2.0',
        'subItem' => '2.3'
    ];
    
    private $session;
    private $id_empresa;
    private $id_login;

    private $unidade_model;
    private $transportadora_model;
    private $controle_de_acesso_model;
    private $empresa_model;
    private $vendedor_model;
    private $venda_model;
    private $produtos_da_venda;
    private $nfe_model;
    private $nfce_model;
    private $cliente_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->unidade_model            = new UnidadeModel();
        $this->transportadora_model     = new TransportadoraModel();
        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->empresa_model            = new EmpresaModel();
        $this->vendedor_model           = new VendedorModel();
        $this->venda_model              = new VendaModel();
        $this->produtos_da_venda        = new ProdutoDaVendaModel();
        $this->cliente_model            = new ClienteModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('historico_de_vendas');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Vendas',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Vendas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $vendas = $this->venda_model
                        ->where('vendas.id_empresa', $this->id_empresa)
                        ->join('clientes', 'vendas.id_cliente = clientes.id_cliente')
                        ->find();

        $data['vendas'] = $vendas;

        echo view('templates/header', $data);
        echo view('vendas/index');
        echo view('templates/footer');
    }

    public function show($id_venda)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados da Venda',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa'] = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->join('ufs', 'empresas.id_uf = ufs.id_uf')
                                ->join('municipios', 'empresas.id_municipio = municipios.id_municipio')
                                ->first();

        $data['venda'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_venda', $id_venda)
                                ->first();

        // Adiciona um elemento 'nome_do_cliente' e 'nome_do_vendedor' ao array associativo vendas
        $data['venda']['nome_do_cliente'] = $this->cliente_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_cliente', $data['venda']['id_cliente'])
                                                ->first()['nome'];

        $data['venda']['nome_do_vendedor'] = $this->vendedor_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_vendedor', $data['venda']['id_vendedor'])
                                                ->first()['nome'];
        
        $data['produtos_da_venda'] = $this->produtos_da_venda
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_venda', $id_venda)
                                        ->findAll();

        $data['transportadoras'] = $this->transportadora_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        $data['unidades'] = $this->unidade_model
                                        ->findAll();

        $data['id_venda'] = $id_venda;

        echo view('templates/header', $data);
        echo view('vendas/show');
        echo view('templates/footer');
    }

    public function enviarWhats()
    {
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Venda enviada no WhatsApp!',
            ]
        );

        return redirect()->to('/vendas/show/13');
    }

    public function delete($id_venda)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->venda_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_venda', $id_venda)
            ->delete();

        // Cria um alert na sessão
        $this->session->setFlashdata(
            'alert', 
            [
                'type'  => 'success',
                'title' => 'Venda excluida com sucesso!',
            ]
        );

        return redirect()->to('/vendas');
    }
}