<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ProdutosDoPdv extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_produto_pdv' => [
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

			'NCM' => [
				'type'       => 'VARCHAR',
				'constraint' => 8
			],

			'CSOSN' => [
				'type'       => 'VARCHAR',
				'constraint' => 3
			],

			'CFOP_NFe' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'CFOP_NFCe' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'id_produto' => [
				'type' => 'INT'
			],

			'id_empresa' => [
				'type' => 'INT'
			],
		]);

		$this->forge->addKey('id_produto_pdv', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('produtos_do_pdv');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('produtos_do_pdv');
	}
}
