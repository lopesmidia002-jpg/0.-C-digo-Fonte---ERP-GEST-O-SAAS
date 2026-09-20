<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Painel extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_painel' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'senha' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'id_empresa' => [
				'type' => 'INT'
			],

			'created_at' => [
				'type' => 'DATETIME',
			],

			'updated_at' => [
				'type' => 'DATETIME',
			],

			'deleted_at' => [
				'type' => 'DATETIME',
			],
		]);

		$this->forge->addKey('id_painel', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('painel');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('painel');
	}
}
