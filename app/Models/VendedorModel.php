<?php

namespace App\Models;

use CodeIgniter\Model;

class VendedorModel extends Model
{
    protected $table = 'vendedores';
    protected $primaryKey = 'id_vendedor';
    protected $allowedFields = [
        'id_vendedor',
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