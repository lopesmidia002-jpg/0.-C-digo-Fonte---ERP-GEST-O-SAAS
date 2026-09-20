<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ConfiguracoesApiBoletos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_config' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'clientId' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'clientSecret' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'token_privado' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'authorization_server' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
			],

			'api_integration' => [
				'type'       => 'VARCHAR',
				'constraint' => 129
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

		$this->forge->addKey('id_config', TRUE);
		$this->forge->createTable('configuracoes_api_boletos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('configuracoes_api_boletos');
	}
}
