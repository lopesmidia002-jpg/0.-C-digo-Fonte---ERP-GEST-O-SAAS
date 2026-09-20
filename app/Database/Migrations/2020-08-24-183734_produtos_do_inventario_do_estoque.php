<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class ProdutosDoInventarioDoEstoque extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_produto_do_inventario' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'discriminacao' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'unidade' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'quantidade' => [
				'type' => 'INT'
			],

			'valor_unitario' => [
				'type' => 'DOUBLE'
			],

			'id_inventario' => [
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

		$this->forge->addKey('id_produto_do_inventario', TRUE);
		$this->forge->addForeignKey('id_inventario', 'inventarios_do_estoque', 'id_inventario', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('produtos_do_inventario_do_estoque');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('produtos_do_inventario_do_estoque');
	}
}
