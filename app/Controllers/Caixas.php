<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\CaixaModel;
use App\Models\LancamentoModel;
use App\Models\RetiradaModel;
use App\Models\VendaModel;

use CodeIgniter\Controller;

class Caixas extends Controller
{
    private $link = [
        'li' => '7.x',
        'item' => '7.0',
        'subItem' => '7.1'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $caixa_model;
    private $lancamento_model;
    private $venda_model;
    private $retirada_model;

    private $permissao;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->caixa_model              = new CaixaModel();
        $this->lancamento_model         = new LancamentoModel();
        $this->venda_model              = new VendaModel();
        $this->retirada_model           = new RetiradaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('caixas');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Caixas',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('caixas/index');
        echo view('templates/footer');
    }

    public function show($id_caixa)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Dados do Caixa',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota' => "/caixas", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixa'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_caixa', $id_caixa)
                                ->first();

        $data['lancamentos'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_caixa', $id_caixa)
                                    ->findAll();

        $data['vendas'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_caixa', $id_caixa)
                                ->findAll();

        $data['retiradas'] = $this->retirada_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_caixa', $id_caixa)
                                    ->findAll();

        // Somatórios Receitas geradas pelo caixa
        $sum_lancamentos = $this->lancamento_model
                                ->selectSum('valor')
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_caixa', $id_caixa)
                                ->first()['valor'];
                                
        $sum_vendas = $this->venda_model
                            ->selectSum('valor_a_pagar')
                            ->where('id_empresa', $this->id_empresa)
                            ->where('id_caixa', $id_caixa)
                            ->first()['valor_a_pagar'];

        $valor_inicial = $data['caixa']['valor_inicial'];

        $data['somatorio'] = $sum_lancamentos + $sum_vendas + $valor_inicial;

        echo view('templates/header', $data);
        echo view('caixas/show');
        echo view('templates/footer');
    }

    public function abrir()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Abrir Caixa',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota' => "/caixas", 'active' => false],
            ['titulo' => "Abrir", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('caixas/form');
        echo view('templates/footer');
    }

    public function edit($id_caixa)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Editar Caixa',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Caixas", 'rota' => "/caixas", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['caixa'] = $this->caixa_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('id_caixa', $id_caixa)
                            ->first();

        // Somatórios Receitas geradas pelo caixa
        $sum_lancamentos = $this->lancamento_model
                                ->selectSum('valor')
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_caixa', $id_caixa)
                                ->first()['valor'];
                                
        $sum_vendas = $this->venda_model
                            ->selectSum('valor_a_pagar')
                            ->where('id_empresa', $this->id_empresa)
                            ->where('id_caixa', $id_caixa)
                            ->first()['valor_a_pagar'];

        $valor_inicial = $data['caixa']['valor_inicial'];

        $data['somatorio'] = $sum_lancamentos + $sum_vendas + $valor_inicial;

        echo view('templates/header', $data);
        echo view('caixas/form');
        echo view('templates/footer');
    }

    public function fechar($id_caixa)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte de BRL para USD
        $dados['valor_de_fechamento'] = converteMoney($dados['valor_de_fechamento']);
        
        $this->caixa_model
            ->where('id_empresa', $this->id_empresa)
            ->save([
                'id_caixa'            => $id_caixa,
                'data_de_fechamento'  => date('Y-m-d'),
                'hora_de_fechamento'  => date('H:i:s'),
                'valor_de_fechamento' => $dados['valor_de_fechamento'],
                'observacoes'         => $dados['observacoes'],
                'status'              => 'Fechado'
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Caixa fechado com sucesso!'
            ]
        );

        return redirect()->to("/caixas/show/$id_caixa");
    }

    public function reabrir($id_caixa)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $this->caixa_model
        ->where('id_empresa', $this->id_empresa)
        ->save([
            'id_caixa' => $id_caixa,
            'status'   => 'Aberto'
        ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Caixa reaberto com sucesso!'
            ]
        );

        return redirect()->to("/caixas/show/$id_caixa");
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte de BRL para USD
        $dados['valor_inicial']       = converteMoney($dados['valor_inicial']);
        
        if(isset($dados['valor_de_fechamento'])) :
            $dados['valor_total']         = converteMoney($dados['valor_total']);
            $dados['valor_de_fechamento'] = converteMoney($dados['valor_de_fechamento']);
        endif;
        
        // Caso a ação seja editar caixa
        if(isset($dados['id_caixa'])) :
            $this->caixa_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Caixa atualizado com sucesso!'
                ]
            );
            
            return redirect()->to("/caixas/show/{$dados['id_caixa']}");
        endif;

        // Caso a ação seja cadastrar
        $dados['id_empresa']  = $this->id_empresa;
        $dados['status']      = "Aberto";

        $this->caixa_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Caixa aberto com sucesso!'
            ]
        );

        return redirect()->to('/caixas');
    }

    public function delete($id_caixa)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;
        
        $this->caixa_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_caixa', $id_caixa)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Caixa excluido com sucesso!'
            ]
        );

        return redirect()->to('/caixas');
    }
}
