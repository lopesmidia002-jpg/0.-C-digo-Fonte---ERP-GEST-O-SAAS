<?php namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Unidades extends Migration
{
	public function up()
	{
		$this->forge->addField([
            'id_unidade' => [
                'type' => 'INT',
                'constraint' => 9,
                'usigned' => true,
                'auto_increment' => true,
            ],

            'unidade' => [
                'type' => 'VARCHAR',
                'constraint' => 128,
			],
			
            'descricao' => [
                'type' => 'VARCHAR',
                'constraint' => 128,
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

        $this->forge->addKey('id_unidade', true);
        $this->forge->createTable('unidades');
	}

	//--------------------------------------------------------------------

	public function down()
	{
		$this->forge->dropTable('unidades');
	}
}
