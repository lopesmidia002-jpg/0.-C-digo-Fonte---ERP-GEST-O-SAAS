<?php

namespace App\Models;

use CodeIgniter\Model;

class ContaPagarModel extends Model
{
    protected $table = 'contas_a_pagar';
    protected $primaryKey = 'id_conta';
    protected $allowedFields = [
        'id_conta',
        'status',
        'nome',
        'data_de_vencimento',
        'valor',
        'observacoes',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
