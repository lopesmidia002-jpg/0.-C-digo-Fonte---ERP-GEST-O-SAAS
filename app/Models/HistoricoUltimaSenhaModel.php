<?php

namespace App\Models;

use CodeIgniter\Model;

class HistoricoUltimaSenhaModel extends Model
{
    protected $table = 'historico_de_senhas';
    protected $primaryKey = 'id_historico';
    protected $allowedFields = [
        'id_historico',
        'senha',
        'data',
        'hora',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
