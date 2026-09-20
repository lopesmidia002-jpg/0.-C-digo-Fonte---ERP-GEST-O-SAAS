<?php

namespace App\Models;

use CodeIgniter\Model;

class PagamentoFoodModel extends Model
{
    protected $table = 'pagamentos_food';
    protected $primaryKey = 'id_pagamento';
    protected $allowedFields = [
        'id_pagamento',
        'valor',
        'forma_de_pagamento',
        'observacoes',
        'id_mesa',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
