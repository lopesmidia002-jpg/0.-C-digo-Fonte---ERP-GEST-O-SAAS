<?php

namespace App\Controllers;

use App\Models\RetiradaModel;   
use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\ContaPagarModel;

use CodeIgniter\Controller;

class ContasPagar extends Controller
{
    private $link = [
        'li' => '7.x',
        'item' => '7.0',
        'subItem' => '7.5'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $retirada_model;
    private $controle_de_acesso_model;
    private $caixa_model;
    private $conta_a_pagar_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->retirada_model           = new RetiradaModel();
        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->caixa_model              = new CaixaModel();
        $this->conta_a_pagar_model      = new ContaPagarModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('contas_a_pagar');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Contas à Pagar',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Contas à Pagar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['contas_a_pagar'] = $this->conta_a_pagar_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        echo view('templates/header', $data);
        echo view('contas_a_pagar/index');
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
            'modulo' => 'Nova Conta à Pagar',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Conta à Pagar", 'rota' => "/contasPagar", 'active' => false],
            ['titulo' => "Nova", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', "Aberto")
                                ->findAll();

        echo view('templates/header', $data);
        echo view('contas_a_pagar/form');
        echo view('templates/footer');
    }

    public function edit($id_conta)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Conta à Pagar',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Conta à Pagar", 'rota' => "/contasPagar", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['conta'] = $this->conta_a_pagar_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_conta', $id_conta)
                                ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', "Aberto")
                                ->findAll();

        echo view('templates/header', $data);
        echo view('contas_a_pagar/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte BRL para USD
        $dados['valor'] = converteMoney($dados['valor']);
        
        // Caso a ação seja editar
        if(isset($dados['id_conta'])) :
            $this->conta_a_pagar_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);
            
            // Adiciona o valor da conta ao caixa caso exista id_caixa e status == Paga
            if(isset($dados['id_caixa']) && $dados['status'] == "Paga"):
                $this->retirada_model
                    ->insert([
                        'tipo'        => "Simples",
                        'descricao'   => $dados['nome'],
                        'data'        => date('Y-m-d'),
                        'hora'        => date('H:i:s'),
                        'valor'       => $dados['valor'],
                        'id_caixa'    => $dados['id_caixa'],
                        'observacoes' => "Retirada inserida automaticamente como ação de conta a pagar.",
                        'id_empresa'  => $this->id_empresa
                    ]);
            endif;

            // Monta os alertas
            if(isset($dados['id_caixa']) && $dados['status'] == "Paga"):
                $this->session->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Conta atualizada e valor inserido no caixa com sucesso!'
                    ]
                );
            else:
                $this->session->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Conta atualizada com sucesso!'
                    ]
                );
            endif;

            return redirect()->to("/contasPagar");
        endif;

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->conta_a_pagar_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Conta cadastrada com sucesso!'
            ]
        );

        // Adiciona o valor da conta ao caixa caso exista id_caixa
        if(isset($dados['id_caixa']) && $dados['status'] == "Paga"):
            $this->retirada_model
                ->insert([
                    'tipo'        => "Simples",
                    'descricao'   => $dados['nome'],
                    'data'        => date('Y-m-d'),
                    'hora'        => date('H:i:s'),
                    'valor'       => $dados['valor'],
                    'id_caixa'    => $dados['id_caixa'],
                    'observacoes' => "Retirada inserida automaticamente como ação de conta a pagar.",
                    'id_empresa'  => $this->id_empresa
                ]);
        endif; 
        
        return redirect()->to('/contasPagar');
    }

    public function delete($id_conta)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->conta_a_pagar_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_conta', $id_conta)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Conta excluida com sucesso!'
            ]
        );
        
        return redirect()->to('/contasPagar');
    }
}
