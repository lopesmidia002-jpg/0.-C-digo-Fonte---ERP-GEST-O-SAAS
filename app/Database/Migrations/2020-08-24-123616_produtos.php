<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Produtos extends Migration
{
	public function up()
	{
		$this->forge->addField([
			'id_produto' => [
				'type'           => 'INT',
				'constraint'     => 9,
				'usigned'        => TRUE,
				'auto_increment' => TRUE
			],

			'nome' => [
				'type'       => 'VARCHAR',
				'constraint' => 512
			],

			'unidade' => [
				'type'       => 'VARCHAR',
				'constraint' => 16
			],

			'codigo_de_barras' => [
				'type'       => 'VARCHAR',
				'constraint' => 13
			],

			'localizacao' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'quantidade' => [
				'type' => 'INT'
			],

			'quantidade_minima' => [
				'type' => 'INT'
			],

			'valor_de_custo' => [
				'type' => 'DOUBLE'
			],

			'margem_de_lucro' => [
				'type' => 'DOUBLE'
			],

			'valor_de_venda' => [
				'type' => 'DOUBLE'
			],

			'lucro' => [
				'type' => 'DOUBLE'
			],

			'NCM' => [
				'type'       => 'VARCHAR',
				'constraint' => 8
			],

			'CSOSN' => [
				'type'       => 'VARCHAR',
				'constraint' => 3
			],

			'CFOP_NFe' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'CFOP_NFCe' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'CFOP_Externo' => [
				'type'       => 'VARCHAR',
				'constraint' => 4
			],

			'arquivo' => [
				'type'       => 'VARCHAR',
				'constraint' => 128
			],

			'tipo_da_comissao' => [
				'type' => 'INT'
			],

			'porcentagem_comissao' => [
				'type' => 'DOUBLE'
			],
			
			'valor_comissao' => [
				'type' => 'DOUBLE'
			],

			'id_categoria' => [
				'type' => 'INT'
			],

			'id_fornecedor' => [
				'type' => 'INT'
			],

			'validade' => [
				'type' => 'DATE'
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

		$this->forge->addKey('id_produto', TRUE);
		$this->forge->addForeignKey('id_categoria', 'categorias_dos_produtos', 'id_categoria', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_fornecedor', 'fornecedores', 'id_fornecedor', 'CASCADE', 'CASCADE');
		$this->forge->addForeignKey('id_empresa', 'empresas', 'id_empresa', 'CASCADE', 'CASCADE');
		$this->forge->createTable('produtos');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('produtos');
	}
}
