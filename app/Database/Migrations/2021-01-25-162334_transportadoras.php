<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Transportadoras extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_transportadora' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'CNPJ' => [
				'type'       => 'VARCHAR',
				'constraint' => 14
			],

			'xNome' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'isento' => [
				'type' => 'INT'
			],

			'IE' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xEnder' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
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

		$this->forge->addKey('id_transportadora', TRUE);
		$this->forge->addForeignKey('id_uf', 'ufs', 'id_uf', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_municipio', 'municipios', 'id_municipio', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('transportadoras');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('transportadoras');
	}
}
