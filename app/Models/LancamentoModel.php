<?php

namespace App\Models;

use CodeIgniter\Model;

class LancamentoModel extends Model
{
    protected $table = 'lancamentos';
    protected $primaryKey = 'id_lancamento';
    protected $allowedFields = [
        'id_lancamento',
        'descricao',
        'valor',
        'data',
        'hora',
        'observacoes',
        'id_caixa',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
