<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Entregas extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_entrega' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'status' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'nome' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'endereco' => [
				'type' => 'VARCHAR',
				'constraint' => 512,
			],

			'troco_para' => [
				'type' => 'DOUBLE',
			],

			'forma_de_pagamento' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'servico' => [
				'type' => 'VARCHAR',
				'constraint' => 128,
			],

			'data' => [
				'type' => 'DATE'
			],

			'hora' => [
				'type' => 'TIME'
			],

			'fixo' => [
				'type' => 'VARCHAR',
				'constraint' => 15,
			],

			'celular_1' => [
				'type' => 'VARCHAR',
				'constraint' => 15,
			],

			'celular_2' => [
				'type' => 'VARCHAR',
				'constraint' => 15,
			],

			'data_inicio_das_atividades' => [
				'type' => 'DATE',
			],

			'observacoes' => [
				'type' => 'VARCHAR',
				'constraint' => 512,
			],

			'id_entregador' => [
				'type' => 'INT',
			],

			'id_empresa' => [
				'type' => 'INT',
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

		$this->forge->addKey('id_entrega', true);
		$this->forge->addForeignKey('id_entregador', 'entregadores', 'id_entregador', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('entregas');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('entregas');
	}
}
