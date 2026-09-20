<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Entregadores extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_entregador' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'status' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'nome' => [
				'type' => 'VARCHAR',
				'constraint' => 512,
			],

			'data_inicio_das_atividades' => [
				'type' => 'DATE',
			],

			'anotacoes' => [
				'type' => 'VARCHAR',
				'constraint' => 512,
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

		$this->forge->addKey('id_entregador', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('entregadores');

	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('entregadores');
	}
}
