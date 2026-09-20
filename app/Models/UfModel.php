<?php

namespace App\Models;

use CodeIgniter\Model;

class UfModel extends Model
{
    protected $table = 'ufs';
    protected $primaryKey = 'id_uf';
    protected $allowedFields = [
        'id_uf',
        'codigo_uf',
        'estado',
        'uf',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
