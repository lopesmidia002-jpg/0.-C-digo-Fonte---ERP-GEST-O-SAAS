<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Tecnicos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_tecnico' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'data_de_nascimento' => [
				'type' => 'DATE'
			],

			'cpf' => [
				'type'       => 'VARCHAR',
				'constraint' => 11
			],

			'cep' => [
				'type'       => 'VARCHAR',
				'constraint' => 12
			],

			'logradouro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'numero' => [
				'type'       => 'VARCHAR',
				'constraint' => 9
			],

			'complemento' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'bairro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'fixo' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'celular_1' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'celular_2' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'email' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'id_uf' => [
				'type' => 'INT'
			],

			'id_municipio' => [
				'type' => 'INT',
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

		$this->forge->addKey('id_tecnico', TRUE);
		$this->forge->addForeignKey('id_uf', 'ufs', 'id_uf', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_municipio', 'municipios', 'id_municipio', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('tecnicos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('tecnicos');
	}
}
