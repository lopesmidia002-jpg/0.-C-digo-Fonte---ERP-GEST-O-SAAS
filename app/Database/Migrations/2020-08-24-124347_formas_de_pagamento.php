<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class FormasDePagamento extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_forma' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
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

		$this->forge->addKey('id_forma', TRUE);
		$this->forge->createTable('formas_de_pagamento');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('formas_de_pagamento');
	}
}
