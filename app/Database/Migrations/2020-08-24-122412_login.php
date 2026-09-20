<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Login extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_login' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'usuario' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'senha' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'tipo' => [
				'type' => 'INT'
			],

			'esse_usuario_e_admin' => [
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

		$this->forge->addKey('id_login', TRUE);
		// $this->forge->addForeignKey('id_login', 'logins', 'id_login', 'CASCADE', 'CASCADE');
		$this->forge->createTable('login');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('login');
	}
}
