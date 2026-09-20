<?php

namespace App\Models;

use CodeIgniter\Model;

class ProvisorioProdutoDaMesaFoodModel extends Model
{
    protected $table = 'provisorio_produtos_da_mesa_food';
    protected $primaryKey = 'id_produto_provisorio';
    protected $allowedFields = [
        'id_produto_provisorio',
        'nome',
        'quantidade',
        'valor',
        'status',
        'id_mesa',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
