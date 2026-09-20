<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ProdutosDoOrcamento extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_produto_do_orcamento' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'unidade' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'codigo_de_barras' => [
				'type'       => 'VARCHAR',
				'constraint' => 13
			],

			'quantidade' => [
				'type' => 'INT'
			],

			'valor_unitario' => [
				'type' => 'DOUBLE'
			],

			'subtotal' => [
				'type' => 'DOUBLE'
			],

			'desconto' => [
				'type' => 'DOUBLE'
			],

			'valor_final' => [
				'type' => 'DOUBLE'
			],

			'tipo_da_comissao' => [
				'type' => 'INT'
			],

			'porcentagem_comissao' => [
				'type' => 'DOUBLE'
			],
			
			'valor_comissao' => [
				'type' => 'DOUBLE'
			],

			'NCM' => [
				'type'       => 'VARCHAR',
				'constraint' => 8
			],

			'CSOSN' => [
				'type'       => 'VARCHAR',
				'constraint' => 3
			],

			'CFOP' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'id_orcamento' => [
				'type' => 'INT'
			],

			'id_produto' => [
				'type' => 'INT'
			],

			'id_empresa' => [
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

		$this->forge->addKey('id_produto_do_orcamento', TRUE);
		$this->forge->addForeignKey('id_orcamento', 'orcamentos', 'id_orcamento', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('produtos_do_orcamento');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('produtos_do_orcamento');
	}
}
