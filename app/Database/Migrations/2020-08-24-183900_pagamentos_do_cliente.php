<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class PagamentosDoCliente extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_pagamento' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'descricao' => [
				'type' => 'VARCHAR',
				'constraint' => 128
			],

			'valor' => [
				'type' => 'DOUBLE'
			],

			'data' => [
				'type' => 'DATE'
			],

			'hora' => [
				'type' => 'TIME'
			],

			'observacoes' => [
				'type' => 'VARCHAR',
				'constraint' => 512
			],

			'id_cliente' => [
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

		$this->forge->addKey('id_pagamento', TRUE);
		$this->forge->addForeignKey('id_cliente', 'clientes', 'id_cliente', 'CASCADE', 'CASCADE');
		$this->forge->createTable('pagamentos_do_cliente');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('pagamentos_do_cliente');
	}
}
