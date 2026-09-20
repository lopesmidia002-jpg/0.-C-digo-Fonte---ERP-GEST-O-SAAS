<?php

namespace App\Models;

use CodeIgniter\Model;

class ParcelasDoPagamentoOsModel extends Model
{
    protected $table = 'parcelas_do_pagamento_os';
    protected $primaryKey = 'id_parcela';
    protected $allowedFields = [
        'id_parcela',
        'data_de_vencimento',
        'valor_da_parcela',
        'forma_de_pagamento',
        'observacoes',
        'id_pagamento',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}