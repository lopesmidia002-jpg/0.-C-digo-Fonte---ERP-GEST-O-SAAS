<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ConfiguracoesDoPainel extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_configuracao' => [
				'type' => 'INT',
				'constraint' => 9,
				'usigned' => true,
				'auto_increment' => true,
			],

			'tamanho_da_senha' => [
				'type' => 'INT'
			],

			'cor_da_senha' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'tamanho_ultimas_senhas' => [
				'type' => 'INT'
			],

			'tamanho_letreiro' => [
				'type' => 'INT'
			],

			'cor_do_letreiro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'cor_do_fundo_painel' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'texto_do_letreiro' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'id_empresa' => [
				'type' => 'INT'
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

		$this->forge->addKey('id_configuracao', true);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('configuracoes_do_painel');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('configuracoes_do_painel');
	}
}
