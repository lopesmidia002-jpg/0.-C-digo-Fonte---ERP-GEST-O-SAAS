<?php

namespace App\Models;

use CodeIgniter\Model;

class EntregadorModel extends Model
{
    protected $table = 'entregadores';
    protected $primaryKey = 'id_entregador';
    protected $allowedFields = [
        'id_entregador',
        'status',
        'nome',
        'data_inicio_das_atividades',
        'anotacoes',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}