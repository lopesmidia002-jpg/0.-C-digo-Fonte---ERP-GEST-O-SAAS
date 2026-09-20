<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Fornecedores extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_fornecedor' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome_do_representante' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'nome_da_empresa' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'cnpj' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'ie' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'cep' => [
				'type'       => 'VARCHAR',
				'constraint' => 9
			],

			'logradouro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'numero' => [
				'type'       => 'VARCHAR',
				'constraint' => 5
			],

			'complemento' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'bairro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'comercial' => [
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

		$this->forge->addKey('id_fornecedor', TRUE);
		$this->forge->addForeignKey('id_uf', 'ufs', 'id_uf', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_municipio', 'municipios', 'id_municipio', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('fornecedores');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('fornecedores');
	}
}
