<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use App\Models\EmpresaModel;
use App\Models\ClienteModel;
use App\Models\FornecedorModel;
use App\Models\FuncionarioModel;
use App\Models\VendaModel;
use App\Models\LancamentoModel;
use App\Models\ProdutoModel;
use App\Models\RetiradaModel;
use App\Models\DespesaModel;
use App\Models\ContaPagarModel;
use App\Models\ContaReceberModel;
use App\Models\VendedorModel;

use CodeIgniter\Controller;

class Relatorios extends Controller
{
    private $session;
    private $id_empresa;
    private $id_login;

    private $controle_de_acesso_model;
    private $empresa_model;
    private $cliente_model;
    private $fornecedor_model;
    private $funcionario_model;
    private $venda_model;
    private $lancamento_model;
    private $produto_model;
    private $retirada_model;
    private $despesa_model;
    private $conta_pagar_model;
    private $conta_receber_model;
    private $vendedor_model;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->empresa_model            = new EmpresaModel();
        $this->cliente_model            = new ClienteModel();
        $this->fornecedor_model         = new FornecedorModel();
        $this->funcionario_model        = new FuncionarioModel();
        $this->venda_model              = new VendaModel();
        $this->lancamento_model         = new LancamentoModel();
        $this->produto_model            = new ProdutoModel();
        $this->retirada_model           = new RetiradaModel();
        $this->despesa_model            = new DespesaModel();
        $this->conta_pagar_model        = new ContaPagarModel;
        $this->conta_receber_model      = new ContaReceberModel();
        $this->vendedor_model           = new VendedorModel();
    }

    public function clientes()
    {        
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('geral_clientes');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.7'
        ];
                
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE CLIENTES',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Clientes", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/clientes');
        echo view('templates/footer');
    }

    public function fornecedores()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('geral_fornecedores');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.8'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE FORNECEDORES',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Fornecedores", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['fornecedores'] = $this->fornecedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/fornecedores');
        echo view('templates/footer');
    }

    public function funcionarios()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('geral_funcionarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.9'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE FUNCIONÁRIOS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Funcionários", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['funcionarios'] = $this->funcionario_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/funcionarios');
        echo view('templates/footer');
    }

    public function vendedores()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('geral_vendedores');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.2.0'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO VENDEDORES',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Vendedores", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['vendedores']  = $this->vendedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/vendedores');
        echo view('templates/footer');
    }

    public function historicoCompleto()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('vendas_historico_completo');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE VENDAS - HISTÓRICO COMPLETO',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Vendas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['vendas'] = $this->venda_model
                                ->where('vendas.id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->select('id_venda, data, hora, valor_a_pagar, nome AS nome_do_cliente, id_caixa')
                                ->join('clientes', 'vendas.id_cliente = clientes.id_cliente')
                                ->find();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );

        echo view('templates/header', $data);
        echo view('relatorios/vendas/historico_completo');
        echo view('templates/footer');
    }

    public function porCliente()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('vendas_por_cliente');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.2'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE VENDAS - POR CLIENTE',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Vendas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['id_cliente'])) :
            $dados['id_cliente'] = 1;
        endif;

        $data['id_cliente'] = $dados['id_cliente'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['clientes'] = $this->cliente_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $data['vendas'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_cliente', $dados['id_cliente'])
                                ->find();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/vendas/por_cliente');
        echo view('templates/footer');
    }

    public function porVendedor()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('vendas_por_vendedor');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.3'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE VENDAS - POR VENDEDOR',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Vendas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['id_vendedor'])) :
            $dados['id_vendedor'] = 1;
        endif;

        $data['id_vendedor'] = $dados['id_vendedor'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['vendedores'] = $this->vendedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $data['vendas'] = $this->venda_model
                                ->where('vendas.id_empresa', $this->id_empresa)
                                ->where('id_vendedor', $dados['id_vendedor'])
                                ->select('id_venda, data, hora, valor_a_pagar, nome AS nome_do_cliente, id_caixa')
                                ->join('clientes', 'vendas.id_cliente = clientes.id_cliente')
                                ->findAll();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/vendas/por_vendedor');
        echo view('templates/footer');
    }

    public function produtos()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('estoque_produtos');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.4'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE PRODUTOS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Produtos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['produtos'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/estoque/produtos');
        echo view('templates/footer');
    }

    public function estoqueMinimo()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('estoque_minimo');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.5'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DE PRODUTOS - ESTOQUE MÍNIMO',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório de Produtos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['produtos'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('quantidade <= quantidade_minima')
                                ->findAll();

        echo view('templates/header', $data);
        echo view('relatorios/estoque/quantidade_minima');
        echo view('templates/footer');
    }

    public function validadeDosProdutos()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('estoque_validade_do_produto');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.7'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO VALIDADE DOS PRODUTOS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Validade dos Produtos", 'rota'   => "", 'active' => true]
        ];
        
        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['criterio'])) : // Caso não exista mostra os produtos que vencem hoje
            $dados['criterio'] = 1;
        endif;

        if($dados['criterio'] != 0) : // Zero siginifica que o produto está vencido 
            if($dados['criterio'] == 1) : // Vence hoje
                $aux = date('Y-m-d');
            
            elseif($dados['criterio'] == 2) : // Vence nos próximos 3 dias
                $hoje = date('Y-m-d');
                $aux  = date('Y-m-d', strtotime('+3 days', strtotime(date('Y-m-d'))));
                
                $data['produtos'] = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where("validade >=", $hoje)
                                        ->where("validade <=", $aux)
                                        ->find();

            elseif($dados['criterio'] == 3) : // Vence nos próximos 7 dias
                $hoje = date('Y-m-d');
                $aux  = date('Y-m-d', strtotime('+7 days', strtotime(date('Y-m-d'))));
                
                $data['produtos'] = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where("validade >=", $hoje)
                                        ->where("validade <=", $aux)
                                        ->find();

            elseif($dados['criterio'] == 4) : // Vence nos próximos 15 dias
                $hoje = date('Y-m-d');
                $aux  = date('Y-m-d', strtotime('+15 days', strtotime(date('Y-m-d'))));
                
                $data['produtos'] = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where("validade >=", $hoje)
                                        ->where("validade <=", $aux)
                                        ->find();

            elseif($dados['criterio'] == 5) : // Vence nos próximos 31 dias
                $hoje = date('Y-m-d');
                $aux  = date('Y-m-d', strtotime('+31 days', strtotime(date('Y-m-d'))));
                
                $data['produtos'] = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where("validade >=", $hoje)
                                        ->where("validade <=", $aux)
                                        ->find();
            endif;
        else : // Caso o produto já esteja vencido
            $aux = date('Y-m-d');

            $data['produtos'] = $this->produto_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where("validade <", $aux)
                                    ->find();
        endif;

        $data['criterio'] = $dados['criterio'];
        
        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/estoque/validade_dos_produtos');
        echo view('templates/footer');
    }

    public function entradasSaidasGeral()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_movimentacao_de_entradas_e_saidas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;
        
        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.8'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO ENTRADAS E SAÍDAS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Lançamentos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        // ENTRADAS
        $data['lancamentos'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data >=', $dados['data_inicio'])
                                    ->where('data <=', $dados['data_final'])
                                    ->selectSum('valor')
                                    ->first()['valor'];
        
        $data['vendas'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->selectSum('valor_a_pagar')
                                ->first()['valor_a_pagar'];

        // SAÍDAS
        $data['despesas'] = $this->despesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->selectSum('valor')
                                ->first()['valor'];
        
        $data['saldo'] = ($data['lancamentos'] + $data['vendas']) - $data['despesas'];

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/financeiro/entradas_e_saidas_geral');
        echo view('templates/footer');
    }

    public function faturamentoDiario()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_faturamento_diario');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.9'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO FATURAMENTO',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Faturamento", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $dados = $this->request->getvar();

        if(!empty($dados['mes']) && !empty($dados['ano'])) : // Caso o usuário escolha o mes e ano
            $mes = $dados['mes'];
            $ano = $dados['ano'];
        else : // Caso o usuário ainda não tenha escolhido o mes e ano mostra o atual
            $mes = date('m');
            $ano = date('Y');
        endif;

        $data['mes'] = $mes;
        $data['ano'] = $ano;

        for($i=1; $i<=31; $i++) :
            $fat_vendas = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data', "$ano-$mes-$i")
                                ->selectSum('valor_a_pagar')
                                ->first()['valor_a_pagar'];

            $fat_lancamentos = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data', "$ano-$mes-$i")
                                    ->selectSum('valor')
                                    ->first()['valor'];

            $faturamentos[] = $fat_vendas + $fat_lancamentos;

            $dados_fat[] = [
                'dia'         => $i,
                'vendas'      => $fat_vendas,
                'lancamentos' => $fat_lancamentos
            ];
        endfor;

        $data['faturamentos'] = $faturamentos;
        $data['dados_fat']    = $dados_fat;

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/financeiro/faturamento_diario');
        echo view('templates/footer');
    }

    public function faturamentoDetalhado()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_faturamento_detalhado');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.0'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO FATURAMENTO',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Faturamento", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['vendas']      = $this->venda_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data >=', $dados['data_inicio'])
                                    ->where('data <=', $dados['data_final'])
                                    ->find();

        $data['lancamentos'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data >=', $dados['data_inicio'])
                                    ->where('data <=', $dados['data_final'])
                                    ->find();

        // Somatório de vendas
        $data['total_de_vendas'] = $this->venda_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->selectSum('valor_a_pagar')
                                ->first()['valor_a_pagar'];
        
        // Somatório de lançamentos
        $data['total_de_lancamentos'] = $this->lancamento_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('data >=', $dados['data_inicio'])
                                            ->where('data <=', $dados['data_final'])
                                            ->selectSum('valor')
                                            ->first()['valor'];

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );

        echo view('templates/header', $data);
        echo view('relatorios/financeiro/faturamento_detalhado');
        echo view('templates/footer');
    }

    public function lancamentos()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_lancamentos');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.1'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO LANÇAMENTOS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Lançamentos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['lancamentos'] = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data >=', $dados['data_inicio'])
                                    ->where('data <=', $dados['data_final'])
                                    ->find();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/financeiro/lancamentos');
        echo view('templates/footer');
    }

    public function retiradasDoCaixa()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_retiradas_do_caixa');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.2'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO RETIRADAS DO CAIXA',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Retiradas do Caixa", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['retiradas'] = $this->retirada_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->find();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/financeiro/retiradas_do_caixa');
        echo view('templates/footer');
    }

    public function despesas()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_despesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.3'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO DESPESAS',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Despesas", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request
                    ->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        $data['despesas'] = $this->despesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('data >=', $dados['data_inicio'])
                                ->where('data <=', $dados['data_final'])
                                ->find();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/financeiro/despesas');
        echo view('templates/footer');
    }

    public function contasPagar()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_contas_a_pagar');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.4'
        ];

        $data['titulo'] = [
            'modulo' => 'RELATÓRIO CONTAS À PAGAR',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Contas à Pagar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['status']      = "Todos";
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['status']      = $dados['status'];
        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];


        // Dados da empresa
        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();

        
        if($dados['status'] == "Todos") :
            $data['contas']  = $this->conta_pagar_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data_de_vencimento >=', $dados['data_inicio'])
                                    ->where('data_de_vencimento <=', $dados['data_final'])
                                    ->find();
        else :
            $data['contas']  = $this->conta_pagar_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('status', $dados['status'])
                                    ->where('data_de_vencimento >=', $dados['data_inicio'])
                                    ->where('data_de_vencimento <=', $dados['data_final'])
                                    ->find();
        endif;

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/administrativo/contas_a_pagar');
        echo view('templates/footer');
    }

    public function contasReceber()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('financeiro_contas_a_receber');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '10.x',
            'item' => '10.0',
            'subItem' => '10.1.5'
        ];
        
        $data['titulo'] = [
            'modulo' => 'RELATÓRIO CONTAS À RECEBER',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Relatório Contas à Receber", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $dados = $this->request->getvar();

        if(!isset($dados['data_inicio'])) :
            $dados['status']      = "Todos";
            $dados['data_inicio'] = date('Y-m-01');
            $dados['data_final']  = date('Y-m-31');
        endif;

        $data['status']      = $dados['status'];
        $data['data_inicio'] = $dados['data_inicio'];
        $data['data_final']  = $dados['data_final'];

        $data['empresa']  = $this->empresa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->first();
        
        if($dados['status'] == "Todos") :
            $data['contas']  = $this->conta_receber_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('data_de_vencimento >=', $dados['data_inicio'])
                                    ->where('data_de_vencimento <=', $dados['data_final'])
                                    ->find();
        else :
            $data['contas']  = $this->conta_receber_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('status', $dados['status'])
                                    ->where('data_de_vencimento >=', $dados['data_inicio'])
                                    ->where('data_de_vencimento <=', $dados['data_final'])
                                    ->find();
        endif;

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Relatório gerado com sucesso!'
            ]
        );
        
        echo view('templates/header', $data);
        echo view('relatorios/administrativo/contas_a_receber');
        echo view('templates/footer');
    }
}
