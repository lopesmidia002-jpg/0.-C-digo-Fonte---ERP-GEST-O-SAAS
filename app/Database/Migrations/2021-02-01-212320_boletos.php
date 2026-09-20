<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Boletos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_boleto' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'id' => [
				'type' => 'TEXT'
			],

			'code' => [
				'type' => 'INT'
			],

			'reference' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'dueDate' => [
				'type' => 'DATE'
			],

			'link' => [
				'type' => 'TEXT'
			],

			'checkoutUrl' => [
				'type' => 'TEXT'
			],

			'installmentLink' => [
				'type' => 'TEXT'
			],

			'payNumber' => [
				'type' => 'TEXT'
			],

			'amount' => [
				'type' => 'DOUBLE'
			],

			'status' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'json' => [
				'type' => 'TEXT'
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

		$this->forge->addKey('id_boleto', TRUE);
		$this->forge->createTable('boletos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('boletos');
	}
}
