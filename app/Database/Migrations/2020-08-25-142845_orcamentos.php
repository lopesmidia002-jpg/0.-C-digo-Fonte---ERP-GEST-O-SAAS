<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Orcamentos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_orcamento' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'status' => [
				'type' => 'VARCHAR',
				'constraint' => 16
			],

			'valor_a_pagar' => [
				'type' => 'DOUBLE'
			],

			'desconto' => [
				'type' => 'DOUBLE'
			],

			'valor_recebido' => [
				'type' => 'DOUBLE'
			],

			'troco' => [
				'type' => 'DOUBLE'
			],

			'forma_de_pagamento' => [
				'type' => 'VARCHAR',
				'constraint' => 64
			],

			'data' => [
				'type' => 'DATE'
			],

			'hora' => [
				'type' => 'TIME'
			],

			'id_cliente' => [
				'type' => 'INT'
			],

			'id_vendedor' => [
				'type' => 'INT'
			],

			'id_caixa' => [
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

		$this->forge->addKey('id_orcamento', TRUE);
		$this->forge->addForeignKey('id_cliente', 'clientes', 'id_cliente', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_vendedor', 'vendedores', 'id_vendedor', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_caixa', 'caixas', 'id_caixa', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('orcamentos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('orcamentos');
	}
}
