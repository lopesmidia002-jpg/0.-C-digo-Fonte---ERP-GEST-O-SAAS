<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\EmpresaModel;
use App\Models\DespesaModel;
use App\Models\LancamentoModel;
use App\Models\VendaModel;

use CodeIgniter\Controller;

class RelatorioDRE extends Controller
{
    private $link = [
        'li' => '7.x',
        'item' => '7.0',
        'subItem' => '7.7'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $empresa_model;
    private $lancamento_model;
    private $venda_model;
    private $despesa_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->lancamento_model         = new LancamentoModel();
        $this->venda_model              = new VendaModel();
        $this->despesa_model            = new DespesaModel();
        $this->empresa_model            = new EmpresaModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('relatorio_dre');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Relatório DRE',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório DRE", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa'] = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $dados = $this->request->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final'] = date('Y-m-31');
        endif;

        // ----------------------------------------------------------------------------------------------------- //
        $lancamentos = $this->lancamento_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('data >=', $dados['data_inicio'])
                            ->where('data <=', $dados['data_final'])
                            ->selectSum('valor')
                            ->first()['valor'];

        $vendas = $this->venda_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('data >=', $dados['data_inicio'])
                        ->where('data <=', $dados['data_final'])
                        ->selectSum('valor_a_pagar')
                        ->first()['valor_a_pagar'];

        // Manda o valor do faturamento para view
        $data['faturamento'] = $lancamentos + $vendas;

        // ----------------------------------------------------------------------------------------------------- //

        $data['impostos'] = $this->despesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->selectSum('valor')
                                ->where('tipo', 'Impostos')
                                ->first()['valor'];
        
        $data['despesas_variaveis'] = $this->despesa_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('data >=', $dados['data_inicio'])
                                            ->where('data <=', $dados['data_final'])
                                            ->selectSum('valor')
                                            ->where('tipo', 'Despesas variáveis')
                                            ->first()['valor'];

        $data['despesas_fixas'] = $this->despesa_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('data >=', $dados['data_inicio'])
                                        ->where('data <=', $dados['data_final'])
                                        ->selectSum('valor')
                                        ->where('tipo', 'Despesas fixas')
                                        ->first()['valor'];

        $data['gastos_com_pessoas'] = $this->despesa_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('data >=', $dados['data_inicio'])
                                            ->where('data <=', $dados['data_final'])
                                            ->selectSum('valor')
                                            ->where('tipo', 'Gastos com pessoas')
                                            ->first()['valor'];

        $data['prolabore'] = $this->despesa_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data >=', $dados['data_inicio'])
                                    ->where('data <=', $dados['data_final'])
                                    ->selectSum('valor')
                                    ->where('tipo', 'Prolabore')
                                    ->first()['valor'];

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'DRE gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorio_dre/index');
        echo view('templates/footer');
    }
}
