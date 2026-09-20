<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Executa a carga inicial de dados (UFs, Municípios, Configurações e Usuário Admin)
        $this->call('AutoInsert');
    }
}
