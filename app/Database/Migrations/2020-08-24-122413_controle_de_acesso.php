<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ControleDeAcesso extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_controle_de_acesso' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			// ----- VENDAS ------ //

			'venda_rapida' => [
				'type' => 'INT'
			],

			'pdv' => [
				'type' => 'INT'
			],

			'pesquisa_produto' => [
				'type' => 'INT'
			],

			'historico_de_vendas' => [
				'type' => 'INT'
			],

			'orcamentos' => [
				'type' => 'INT'
			],

			'pedidos' => [
				'type' => 'INT'
			],

			// ----- ORDEM DE SERVIÇO ------ //

			'ordem_de_servico' => [
				'type' => 'INT'
			],

			// ----- FOOD ----- //

			'novo_pedido' => [
				'type' => 'INT'
			],

			'mesas' => [
				'type' => 'INT'
			],

			'entregas' => [
				'type' => 'INT'
			],

			'abrir_painel' => [
				'type' => 'INT'
			],

			'transmitir_no_painel' => [
				'type' => 'INT'
			],

			'configs' => [
				'type' => 'INT'
			],

			// ----- CONTROLE GERAL ----- //

			'clientes' => [
				'type' => 'INT'
			],

			'fornecedores' => [
				'type' => 'INT'
			],

			'funcionarios' => [
				'type' => 'INT'
			],

			'vendedores' => [
				'type' => 'INT'
			],

			'entregadores' => [
				'type' => 'INT'
			],

			'tecnicos' => [
				'type' => 'INT'
			],

			'servico_mao_de_obra' => [
				'type' => 'INT'
			],

			'transportadoras' => [
				'type' => 'INT'
			],

			// ----- ESTOQUE ----- //

			'produtos' => [
				'type' => 'INT'
			],

			'reposicoes' => [
				'type' => 'INT'
			],

			'saida_de_mercadorias' => [
				'type' => 'INT'
			],

			'inventario_do_estoque' => [
				'type' => 'INT'
			],

			'categoria_dos_produtos' => [
				'type' => 'INT'
			],

			// ----- FINANCEIRO ----- //

			'caixas' => [
				'type' => 'INT'
			],

			'lancamentos' => [
				'type' => 'INT'
			],

			'retiradas_do_caixa' => [
				'type' => 'INT'
			],

			'despesas' => [
				'type' => 'INT'
			],

			'contas_a_pagar' => [
				'type' => 'INT'
			],

			'contas_a_receber' => [
				'type' => 'INT'
			],

			'relatorio_dre' => [
				'type' => 'INT'
			],

			// ----- CONTROLE FISCAL ----- //

			'nfe' => [
				'type' => 'INT'
			],

			'nfce' => [
				'type' => 'INT'
			],

			// ----- RELATÓRIOS ----- //

			'vendas_historico_completo' => [
				'type' => 'INT'
			],

			'vendas_por_cliente' => [
				'type' => 'INT'
			],

			'vendas_por_vendedor' => [
				'type' => 'INT'
			],

			'estoque_produtos' => [
				'type' => 'INT'
			],

			'estoque_minimo' => [
				'type' => 'INT'
			],

			'estoque_inventario' => [
				'type' => 'INT'
			],

			'estoque_validade_do_produto' => [
				'type' => 'INT'
			],

			'financeiro_movimentacao_de_entradas_e_saidas' => [
				'type' => 'INT'
			],

			'financeiro_faturamento_diario' => [
				'type' => 'INT'
			],

			'financeiro_faturamento_detalhado' => [
				'type' => 'INT'
			],

			'financeiro_lancamentos' => [
				'type' => 'INT'
			],

			'financeiro_retiradas_do_caixa' => [
				'type' => 'INT'
			],

			'financeiro_despesas' => [
				'type' => 'INT'
			],

			'financeiro_contas_a_pagar' => [
				'type' => 'INT'
			],

			'financeiro_contas_a_receber' => [
				'type' => 'INT'
			],

			'financeiro_dre' => [
				'type' => 'INT'
			],

			'geral_clientes' => [
				'type' => 'INT'
			],

			'geral_fornecedores' => [
				'type' => 'INT'
			],

			'geral_funcionarios' => [
				'type' => 'INT'
			],

			'geral_vendedores' => [
				'type' => 'INT'
			],

			// ------ AGENDA ------ //
			'agenda' => [
				'type' => 'INT'
			],

			// ------ CONFIGURAÇÕES ------ //
			'usuarios' => [
				'type' => 'INT'
			],

			'config_da_conta' => [
				'type' => 'INT'
			],

			'config_da_empresa' => [
				'type' => 'INT'
			],

			'config_nfe_e_nfce' => [
				'type' => 'INT'
			],

			// ---------------------------- //
			'widget_clientes' => [
				'type' => 'INT'
			],

			'widget_produtos' => [
				'type' => 'INT'
			],

			'widget_vendas' => [
				'type' => 'INT'
			],

			'widget_lancamentos' => [
				'type' => 'INT'
			],

			'widget_faturamento' => [
				'type' => 'INT'
			],

			'widget_os' => [
				'type' => 'INT'
			],

			'grafico_faturamento_linha' => [
				'type' => 'INT'
			],

			'grafico_faturamento_barras' => [
				'type' => 'INT'
			],

			'tabela_contas_a_pagar' => [
				'type' => 'INT'
			],

			'tabela_contas_a_receber' => [
				'type' => 'INT'
			],

			// ---------------------------- //

			'id_empresa' => [
				'type' => 'INT'
			],

			'id_login' => [
				'type' => 'INT'
			],

			'created_at' => [
				'type' => 'DATETIME'
			],

			'updated_at' => [
				'type' => 'DATETIME'
			],

			'deleted_at' => [
				'type' => 'DATETIME'
			]
		]);

		$this->forge->addKey('id_controle_de_acesso', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_login', 'login', 'id_login', 'CASCADE', 'CASCADE');
		$this->forge->createTable('controle_de_acesso');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('controle_de_acesso');
	}
}
