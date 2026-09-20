<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Configuracoes extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_config'       => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => true,
				'auto_increment' => true,
			],

			'nome_do_app' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'tema' => [
				'type' => 'INT'
			],

			'xNome' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'xFant' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'CNPJ' => [
				'type'       => 'VARCHAR',
				'constraint' => 14
			],

			'telefone' => [
				'type'       => 'VARCHAR',
				'constraint' => 11
			],

			'endereco' => [
				'type'       => 'VARCHAR',
				'constraint' => 256
			],

			'arquivo-imagem-de-fundo-login' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'logomarca' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'created_at' => [
				'type'   => 'DATETIME'
			],

			'updated_at' => [
				'type'   => 'DATETIME'
			],

			'deleted_at' => [
				'type'   => 'DATETIME'
			]
		]);

		$this->forge->addKey('id_config', true);
		$this->forge->createTable('configuracoes');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('configuracoes');
	}
}
