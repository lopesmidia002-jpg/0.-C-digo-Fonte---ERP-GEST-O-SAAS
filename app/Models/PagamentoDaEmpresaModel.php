<?php

namespace App\Models;

use CodeIgniter\Model;

class PagamentoDaEmpresaModel extends Model
{
    protected $table = 'pagamentos_da_empresa';
    protected $primaryKey = 'id_pagamento';
    protected $allowedFields = [
        'id_pagamento',
        'valor',
        'data',
        'observacoes',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}