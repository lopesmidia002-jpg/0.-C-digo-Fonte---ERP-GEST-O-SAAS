<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Ufs extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_uf' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'codigo_uf' => [
				'type' => 'INT'
			],

			'estado' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],
			
			'uf' => [
				'type'       => 'VARCHAR',
				'constraint' => 2
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

		$this->forge->addKey('id_uf', TRUE);
		$this->forge->createTable('ufs');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('ufs');
	}
}
