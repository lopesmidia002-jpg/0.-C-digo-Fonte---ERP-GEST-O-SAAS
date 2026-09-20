<?php

namespace App\Models;

use CodeIgniter\Model;

class PainelModel extends Model
{
    protected $table = 'painel';
    protected $primaryKey = 'id_painel';
    protected $allowedFields = [
        'id_painel',
        'senha',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
