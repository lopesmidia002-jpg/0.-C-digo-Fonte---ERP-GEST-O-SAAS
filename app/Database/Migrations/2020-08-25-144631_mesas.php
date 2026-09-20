<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Mesas extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_mesa' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'status' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'qtd_de_pessoas' => [
				'type' => 'INT'
			],

			'nome' => [
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
				'type' => 'DATETIME'
			],

			'updated_at' => [
				'type' => 'DATETIME'
			],

			'deleted_at' => [
				'type' => 'DATETIME'
			]
		]);

		$this->forge->addKey('id_mesa', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('mesas');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('mesas');
	}
}
