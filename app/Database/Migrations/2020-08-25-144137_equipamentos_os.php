<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class EquipamentosOs extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_equipamento' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'equipamento' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'marca' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'modelo' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'serie' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'condicoes' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'defeitos' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'acessorios' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'solucao' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'laudo_tecnico' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'termos_de_garantia' => [
				'type'       => 'VARCHAR',
				'constraint' => 2048
			],

			'id_ordem' => [
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

		$this->forge->addKey('id_equipamento', TRUE);
		$this->forge->addForeignKey('id_ordem', 'ordens_de_servicos', 'id_ordem', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('equipamentos_os');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('equipamentos_os');
	}
}
