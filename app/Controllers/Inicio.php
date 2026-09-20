<?php

namespace App\Controllers;

use App\Models\ClienteModel;
use App\Models\ContaPagarModel;
use App\Models\ContaReceberModel;
use App\Models\ControleDeAcessoModel;
use App\Models\LancamentoModel;
use App\Models\OrcamentoModel;
use App\Models\ProdutoModel;
use App\Models\VendaModel;
use CodeIgniter\Controller;

class Inicio extends Controller
{
    private $session;
    private $id_empresa;
    private $id_login;

    private $cliente_model;
    private $produto_model;
    private $venda_model;
    private $lancamento_model;
    private $orcamento_model;
    private $conta_pagar_model;
    private $conta_receber_model;

    private $controle_de_acesso_model;

    function __construct()
    {
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');
        
        $this->cliente_model = new ClienteModel();
        $this->produto_model = new ProdutoModel();
        $this->venda_model = new VendaModel();
        $this->lancamento_model = new LancamentoModel();
        $this->orcamento_model = new OrcamentoModel();
        $this->conta_pagar_model = new ContaPagarModel();
        $this->conta_receber_model = new ContaReceberModel();

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
    }

    public function index()
    {
        // Revifica se tem uma sessão ativa
        if($this->session->get('tipo') == null):
            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'error',
                    'title' => 'Você não está logado! Acesse sua conta para continuar.'
                ]
            );

            return redirect()->to('/login');
        endif;

        $data['link'] = [
            'item' => '1'
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                                    ->where('id_empresa', $this->id_empresa)
                                                    ->where('id_login', $this->id_login)
                                                    ->first();

        $clientes = $this->cliente_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $produtos = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $vendas = $this->venda_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('data >=', date("Y-m-01"))
                            ->where('data <=', date("Y-m-t"))
                            ->findAll(); 

        $lancamentos = $this->lancamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $faturamento = 0;

        foreach($vendas as $venda)
        {
            $faturamento += $venda['valor_a_pagar'];
        }

        $orcamentos = $this->orcamento_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        // ------------------------ DADOS MONTAGEM GRÁFICO FATURAMENTO DIARIO ------------------------- //
        $faturamento_diario = [];

        $somatorio_fat_diario = 0;
        $qtde_dias_sem_fat = 0;
        $dia_maior_fat = 1;
        $maior_fat_diario = 0;

        for ($i = 1; $i <= 31; $i++)
        {
            $valor = $this->venda_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('data', date("Y-m-$i"))
                            ->selectSum('valor_a_pagar')
                            ->first()['valor_a_pagar'];

            if($valor == null)
            {
                $valor = 0;
                $qtde_dias_sem_fat ++;
            }

            $faturamento_diario[] = $valor;
            $somatorio_fat_diario += $valor;

            if($valor > $maior_fat_diario)
            {
                $dia_maior_fat = $i;
                $maior_fat_diario = $valor;
            }
        }

        // ------------------------ DADOS MONTAGEM GRÁFICOS FATURAMENTO ANUAL ------------------------- //
        $nomes_meses = [
            'Jan',
            'Fev',
            'Mar',
            'Abr',
            'Mai',
            'Jun',
            'Jul',
            'Ago',
            'Set',
            'Out',
            'Nov',
            'Dez',
        ];

        $faturamento_por_meses = [];
        for($i = 1; $i <= 12; $i++)
        {
            $valor = $this->venda_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('data >=', date("Y-$i-01"))
                            ->where('data <=', date("Y-$i-t"))
                            ->selectSum('valor_a_pagar')
                            ->first();

            if($valor['valor_a_pagar'] == null)
            {
                $faturamento_por_meses[] = 0;
            }
            else
            {
                $faturamento_por_meses[] = $valor['valor_a_pagar'];
            }
        }

        // ------------------------ CONTAS A PAGAR E RECEBER DO MES ATUAL ------------------------- //
        $contas_pagar = $this->conta_pagar_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('data_de_vencimento >=', date('Y-m-01'))
                                            ->where('data_de_vencimento <=', date('Y-m-t'))
                                            ->findAll();

        $contas_receber = $this->conta_receber_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('data_de_vencimento >=', date('Y-m-01'))
                                            ->where('data_de_vencimento <=', date('Y-m-t'))
                                            ->findAll();

        // ------------------------------------------------------- //                                    
        $data['qtde_clientes'] = count($clientes);
        $data['qtde_produtos'] = count($produtos);
        $data['qtde_vendas'] = count($vendas);
        $data['qtde_lancamentos'] = count($lancamentos);
        $data['faturamento'] = $faturamento;
        $data['qtde_orcamentos'] = count($orcamentos);

        $data['faturamento_diario'] = $faturamento_diario;
        $data['somatorio_fat_diario'] = $somatorio_fat_diario;
        $data['qtde_dias_sem_fat'] = $qtde_dias_sem_fat;
        $data['dia_maior_fat'] = $dia_maior_fat;
        $data['maior_fat_diario'] = $maior_fat_diario;

        $data['nomes_meses'] = $nomes_meses;
        $data['faturamento_por_meses'] = $faturamento_por_meses;

        $data['contas_pagar'] = $contas_pagar;
        $data['contas_receber'] = $contas_receber;

        echo view('templates/header', $data);
        echo view('dashboard/index');
        echo view('templates/footer');
    }
}
