<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class PagamentosFood extends Migration
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

			'valor' => [
				'type' => 'DOUBLE'
			],

			'forma_de_pagamento' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'observacoes' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'id_mesa' => [
				'type' => 'INT'
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

		$this->forge->addKey('id_pagamento', TRUE);
		$this->forge->addForeignKey('id_mesa', 'mesas', 'id_mesa', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('pagamentos_food');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('pagamentos_food');
	}
}
