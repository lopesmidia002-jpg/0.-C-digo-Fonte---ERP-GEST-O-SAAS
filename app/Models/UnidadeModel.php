<?php

namespace App\Models;

use CodeIgniter\Model;

class UnidadeModel extends Model
{
    protected $table = 'unidades';
    protected $primaryKey = 'id_unidade';
    protected $allowedFields = [
        'id_unidade',
        'unidade',
        'descricao'
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
?>