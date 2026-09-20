<?php

namespace App\Models;

use CodeIgniter\Model;

class EntregaModel extends Model
{
    protected $table = 'entregas';
    protected $primaryKey = 'id_entrega';
    protected $allowedFields = [
        'id_entrega',
        'status',
        'nome',
        'endereco',
        'troco_para',
        'forma_de_pagamento',
        'servico',
        'data',
        'hora',
        'fixo',
        'celular_1',
        'celular_2',
        'data_inicio_das_atividades',
        'observacoes',
        'id_entregador',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}