<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class HistoricoDeSenhas extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_historico' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'senha' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'data' => [
				'type' => 'DATE'
			],

			'hora' => [
				'type' => 'TIME'
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

		$this->forge->addKey('id_historico', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('historico_de_senhas');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('historico_de_senhas');
	}
}
