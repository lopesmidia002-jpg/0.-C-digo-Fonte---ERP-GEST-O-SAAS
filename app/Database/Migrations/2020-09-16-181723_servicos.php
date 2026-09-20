<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Servicos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_servico' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'nome' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'id_empresa' => [
				'type' => 'INT',
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

		$this->forge->addKey('id_servico', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('servicos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('servicos');
	}
}
