<?php

namespace App\Models;

use CodeIgniter\Model;

class VendaModel extends Model
{
    protected $table = 'vendas';
    protected $primaryKey = 'id_venda';
    protected $allowedFields = [
        'id_venda',
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
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
