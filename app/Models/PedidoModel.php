<?php

namespace App\Models;

use CodeIgniter\Model;

class PedidoModel extends Model
{
    protected $table = 'pedidos';
    protected $primaryKey = 'id_pedido';
    protected $allowedFields = [
        'id_pedido',
        'valor_a_pagar',
        'desconto',
        'valor_recebido',
        'troco',
        'forma_de_pagamento',
        'data',
        'hora',
        'situacao',
        'prazo_de_entrega',
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
