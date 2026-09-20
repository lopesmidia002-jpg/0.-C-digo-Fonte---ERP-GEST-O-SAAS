<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Municipios extends Migration
{
	public function up()
	{
		$this->forge->addField([
            'id_municipio' => [
                'type' => 'INT',
                'constraint' => 9,
                'usigned' => true,
                'auto_increment' => true,
			],
			
			'codigo' => [
                'type' => 'VARCHAR',
                'constraint' => 7,
            ],

            'municipio' => [
                'type' => 'VARCHAR',
                'constraint' => 128,
            ],

            'id_uf' => [
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

        $this->forge->addKey('id_municipio', true);
        $this->forge->addForeignKey('id_uf', 'ufs', 'id_uf', 'CASCADE', 'CASCADE');
        $this->forge->createTable('municipios');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('municipios');
	}
}
