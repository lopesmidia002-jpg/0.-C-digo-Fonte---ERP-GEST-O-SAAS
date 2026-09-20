<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Empresas extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_empresa' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'status' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'CNPJ' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],
			
			'xNome' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xFant' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'IE' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'dia_do_pagamento' => [
				'type' => 'INT'
			],

			'logomarca' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'CEP' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xLgr' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'nro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xCpl' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xBairro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'fone' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'id_uf' => [
				'type' => 'INT'
			],

			'id_municipio' => [
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

		$this->forge->addKey('id_empresa', TRUE);
		$this->forge->addForeignKey('id_uf', 'ufs', 'id_uf', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_municipio', 'municipios', 'id_municipio', 'CASCADE', 'CASCADE');
		$this->forge->createTable('empresas');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('empresas');
	}
}
