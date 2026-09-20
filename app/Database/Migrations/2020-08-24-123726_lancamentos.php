<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Lancamentos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_lancamento' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'descricao' => [
				'type' => 'VARCHAR',
				'constraint' => 128
			],

			'valor' => [
				'type' => 'DOUBLE'
			],

			'data' => [
				'type' => 'DATE'
			],

			'hora' => [
				'type' => 'TIME'
			],

			'observacoes' => [
				'type' => 'TEXT'
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

		$this->forge->addKey('id_lancamento', TRUE);
		$this->forge->addForeignKey('id_caixa', 'caixas', 'id_caixa', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('lancamentos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('lancamentos');
	}
}
