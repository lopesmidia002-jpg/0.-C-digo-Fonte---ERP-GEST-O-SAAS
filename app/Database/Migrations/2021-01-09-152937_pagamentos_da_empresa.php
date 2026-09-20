<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class PagamentosDaEmpresa extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_pagamento' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'valor' => [
				'type' => 'DOUBLE'
			],

			'observacoes' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'data' => [
				'type' => 'DATE'
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

		$this->forge->addKey('id_pagamento', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('pagamentos_da_empresa');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('pagamentos_da_empresa');
	}
}
