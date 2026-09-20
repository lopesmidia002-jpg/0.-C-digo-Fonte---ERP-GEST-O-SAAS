<?php

namespace App\Models;

use CodeIgniter\Model;

class ReposicaoModel extends Model
{
    protected $table = 'reposicoes';
    protected $primaryKey = 'id_reposicao';
    protected $allowedFields = [
        'id_reposicao',
        'data',
        'hora',
        'quantidade',
        'observacoes',
        'id_produto',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
