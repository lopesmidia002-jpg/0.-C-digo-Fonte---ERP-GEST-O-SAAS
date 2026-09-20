<?php

namespace App\Models;

use CodeIgniter\Model;

class OrcamentoModel extends Model
{
    protected $table = 'orcamentos';
    protected $primaryKey = 'id_orcamento';
    protected $allowedFields = [
        'id_orcamento',
        'status',
        'valor_a_pagar',
        'desconto',
        'valor_recebido',
        'troco',
        'forma_de_pagamento',
        'data',
        'hora',
        'id_cliente',
        'id_vendedor',
        'id_caixa',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
