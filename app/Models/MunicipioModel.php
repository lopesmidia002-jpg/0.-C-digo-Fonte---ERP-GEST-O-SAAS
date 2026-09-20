<?php

namespace App\Models;

use CodeIgniter\Model;

class MunicipioModel extends Model
{
    protected $table = 'municipios';
    protected $primaryKey = 'id_municipio';
    protected $allowedFields = [
        'id_municipio',
        'codigo',
        'municipio',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
