<?php

namespace App\Models;

use CodeIgniter\Model;

class SaidaDeMercadoriaModel extends Model
{
    protected $table = 'saida_de_mercadorias';
    protected $primaryKey = 'id_saida';
    protected $allowedFields = [
        'id_saida',
        'data',
        'hora',
        'quantidade',
        'obervacoes',
        'id_produto',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
