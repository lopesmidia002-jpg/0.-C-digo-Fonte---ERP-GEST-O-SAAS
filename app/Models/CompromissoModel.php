<?php

namespace App\Models;

use CodeIgniter\Model;

class CompromissoModel extends Model
{
    protected $table = 'compromissos';
    protected $primaryKey = 'id_compromisso';
    protected $allowedFields = [
        'id_compromisso',
        'horario',
        'data',
        'compromisso',
        'status',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
