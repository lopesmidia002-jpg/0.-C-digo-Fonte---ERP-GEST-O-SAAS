<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\UfModel;
use App\Models\MunicipioModel;
use App\Models\PagamentoDoClienteModel;
use App\Models\OrcamentoModel;
use App\Models\PedidoModel;
use App\Models\VendaModel;
use App\Models\ClienteModel;
use CodeIgniter\Controller;

class Clientes extends Controller
{
    private $link = [
        'li' => '5.x',
        'item' => '5.0',
        'subItem' => '5.1'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $cliente_model;
    private $venda_model;
    private $orcamento_model;
    private $pedido_model;
    private $pagamento_do_cliente_model;
    private $uf_model;
    private $municipio_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->controle_de_acesso_model     = new ControleDeAcessoModel();
        $this->cliente_model                = new ClienteModel();
        $this->venda_model                  = new VendaModel();
        $this->orcamento_model              = new OrcamentoModel();
        $this->pedido_model                 = new PedidoModel();
        $this->pagamento_do_cliente_model   = new PagamentoDoClienteModel();
        $this->uf_model                     = new UfModel();
        $this->municipio_model              = new MunicipioModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('clientes');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Clientes',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Clientes", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('clientes/index');
        echo view('templates/footer');
    }

    public function show($id_cliente)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Cliente',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Clientes", 'rota' => "/clientes", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['cliente'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_cliente', $id_cliente)
                                ->join('ufs', 'clientes.id_uf = ufs.id_uf')
                                ->join('municipios', 'clientes.id_municipio = municipios.id_municipio')
                                ->first();

        $data['vendas'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_cliente', $id_cliente)
                                ->findAll();

        $data['orcamentos'] = $this->orcamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_cliente', $id_cliente)
                                    ->findAll();

        $data['pedidos'] = $this->pedido_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_cliente', $id_cliente)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('clientes/show');
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
            'modulo' => 'Novo Cliente',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Clientes", 'rota'   => "/clientes", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['municipios'] = $this->municipio_model->findAll();
        $data['ufs']        = $this->uf_model->findAll();

        echo view('templates/header', $data);
        echo view('clientes/form');
        echo view('templates/footer');
    }

    public function edit($id_cliente)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Cliente',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Clientes", 'rota'   => "/clientes", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $cliente = $this->cliente_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_cliente', $id_cliente)
                        ->first();

        $data['ufs'] = $this->uf_model->findAll();

        $data['municipios'] = $this->municipio_model
                                    ->where('id_uf', $cliente['id_uf'])
                                    ->findAll();
        
        $data['cliente'] = $cliente;

        echo view('templates/header', $data);
        echo view('clientes/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Remove mascaras        
        if(isset($dados['cpf'])):
            $dados['cpf'] = removeMascara($dados['cpf']);
        else:
            $dados['cnpj'] = removeMascara($dados['cnpj']);
        endif;

        $dados['cep']       = removeMascara($dados['cep']);
        $dados['fixo']      = removeMascara($dados['fixo']);
        $dados['celular_1'] = removeMascara($dados['celular_1']);
        $dados['celular_2'] = removeMascara($dados['celular_2']);

        // Caso o número não exite então coloca S/N
        if(!isset($dados['numero'])):
            $dados['numero'] = "S/N";
        endif;

        // Caso seja isento de ICMS então não precisa ter I.E
        if($dados['isento'] == 1):
            $dados['ie'] = "";
        endif;

        // Caso a ação é editar
        if(isset($dados['id_cliente'])):
            $this->cliente_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);
            
            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'success', 
                    'title' => 'Cliente atualizado com sucesso!'
                ]
            );

            return redirect()->to("/clientes/edit/{$dados['id_cliente']}");
        endif;

        // Caso a ação seja cadastrar, adiciona id_empresa no array
        $dados['id_empresa'] = $this->id_empresa;

        $this->cliente_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success', 
                'title' => 'Cliente cadastrado com sucesso!'
            ]
        );

        return redirect()->to('/clientes');
    }

    public function delete($id_cliente)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->cliente_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_cliente', $id_cliente)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Cliente excluido com sucesso!'
            ]
        );

        return redirect()->to('/clientes');
    }
}
