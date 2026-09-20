<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ProvisorioProdutosFood extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_produto_provisorio' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'quantidade' => [
				'type' => 'INT'
			],

			'valor' => [
				'type' => 'DOUBLE'
			],

			'id_mesa' => [
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

		$this->forge->addKey('id_produto_provisorio', TRUE);
		$this->forge->addForeignKey('id_mesa', 'mesas', 'id_mesa', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('provisorio_produtos_food');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('provisorio_produtos_food');
	}
}
