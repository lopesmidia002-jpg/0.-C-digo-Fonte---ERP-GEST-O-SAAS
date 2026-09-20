<?php

namespace App\Models;

use CodeIgniter\Model;

class MesaModel extends Model
{
    protected $table = 'mesas';
    protected $primaryKey = 'id_mesa';
    protected $allowedFields = [
        'id_mesa',
        'status',
        'qtd_de_pessoas',
        'nome',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
