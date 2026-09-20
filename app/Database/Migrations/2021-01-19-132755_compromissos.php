<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Compromissos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_compromisso' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'horario' => [
				'type'       => 'VARCHAR',
				'constraint' => 5
			],

			'data' => [
				'type' => 'DATE'
			],

			'compromisso' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'status' => [
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

		$this->forge->addKey('id_compromisso', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('compromissos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('compromissos');
	}
}
