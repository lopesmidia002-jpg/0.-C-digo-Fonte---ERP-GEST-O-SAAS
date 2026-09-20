<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class InventarioDoEstoque extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_inventario' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'descricao' => [
				'type'       => 'VARCHAR',
				'constraint' => 62
			],

			'data' => [
				'type' => 'DATE'
			],

			'observacoes' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
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

		$this->forge->addKey('id_inventario', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('inventarios_do_estoque');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('inventarios_do_estoque');
	}
}
