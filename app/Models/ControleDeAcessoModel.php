<?php

namespace App\Models;

use CodeIgniter\Model;

class ControleDeAcessoModel extends Model
{
    protected $table = 'controle_de_acesso';
    protected $primaryKey = 'id_controle_de_acesso';
    protected $allowedFields = [
        'id_controle_de_acesso',

        'venda_rapida',
        'pdv',
        'pesquisa_produto',
        'historico_de_vendas',
        'orcamentos',
        'pedidos',

        'ordem_de_servico',
        
        'novo_pedido',
        'mesas',
        'entregas',
        'configs',
        'abrir_painel',
        'transmitir_no_painel',
        
        'clientes',
        'fornecedores',
        'funcionarios',
        'vendedores',
        'entregadores',
        'tecnicos',
        'servico_mao_de_obra',
        'transportadoras',
        
        'produtos',
        'reposicoes',
        'saida_de_mercadorias',
        'inventario_do_estoque',
        'categoria_dos_produtos',
        
        'caixas',
        'lancamentos',
        'retiradas_do_caixa',
        'despesas',
        'contas_a_pagar',
        'contas_a_receber',
        'relatorio_dre',
        
        'nfe',
        'nfce',
        
        'vendas_historico_completo',
        'vendas_por_cliente',
        'vendas_por_vendedor',
        'estoque_produtos',
        'estoque_minimo',
        'estoque_inventario',
        'estoque_validade_do_produto',
        'financeiro_movimentacao_de_entradas_e_saidas',
        'financeiro_faturamento_diario',
        'financeiro_faturamento_detalhado',
        'financeiro_lancamentos',
        'financeiro_retiradas_do_caixa',
        'financeiro_despesas',
        'financeiro_contas_a_pagar',
        'financeiro_contas_a_receber',
        'financeiro_dre',
        'geral_clientes',
        'geral_fornecedores',
        'geral_funcionarios',
        'geral_vendedores',
        
        'agenda',
        
        'usuarios',
        'config_da_conta',
        'config_da_empresa',
        'config_nfe_e_nfce',

        'widget_clientes',
        'widget_produtos',
        'widget_vendas',
        'widget_lancamentos',
        'widget_faturamento',
        'widget_os',
        'grafico_faturamento_linha',
        'grafico_faturamento_barras',
        'tabela_contas_a_pagar',
        'tabela_contas_a_receber',
        
        'id_empresa',
        'id_login',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';

    public function verificaPermissao($funcionalidade)
    {
        $session = session();

        // Verifica se existe sessão
        if($session->get('tipo') != null):

            $controle_de_acesso = $this
                                    ->where('id_empresa', $session->get('id_empresa'))
                                    ->where('id_login', $session->get('id_login'))
                                    ->first();

            // Vefifica se tem permissão para acessar o módulo. 1=permitido
            if($controle_de_acesso[$funcionalidade] != 0):
                
                // Retorna False para não entrar no IF
                return FALSE;

            endif;

            // Caso chegue aqui então não tem permissão
            // Emite um alerta e retorna a URL
            $session->setFlashdata('alert', [
                    'type' => 'error',
                    'title' => 'Acesso Negado! Você não tem permissão para acessar essa funcionalidade.',
                ]
            );

            return $session->get('_ci_previous_url');

        endif;

        // Caso chegue aqui então não tem sessão
        // Emite um alerta e retorna a URL
        $session->setFlashdata('alert', [
                'type' => 'error',
                'title' => 'Você não está logado! Acesse sua conta para continuar.',
            ]
        );
        
        return '/login';
    }
}
