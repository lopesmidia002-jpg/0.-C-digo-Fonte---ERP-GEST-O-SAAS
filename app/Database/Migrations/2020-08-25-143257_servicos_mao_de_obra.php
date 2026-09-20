<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ServicosMaoDeObra extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_servico' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'descricao' => [
				'type'       => 'VARCHAR',
				'constraint' => 1024
			],

			'valor' => [
				'type' => 'DOUBLE'
			],

			'observacoes' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
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

		$this->forge->addKey('id_servico', TRUE);
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('servicos_mao_de_obra');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('servicos_mao_de_obra');
	}
}
