<?php

namespace App\Models;

use CodeIgniter\Model;

class PagamentoOsModel extends Model
{
    protected $table = 'pagamentos_os';
    protected $primaryKey = 'id_pagamento';
    protected $allowedFields = [
        'id_pagamento',
        'tipo',
        'id_ordem',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}