<?php

namespace App\Models;

use CodeIgniter\Model;

class CaixaModel extends Model
{
    protected $table = 'caixas';
    protected $primaryKey = 'id_caixa';
    protected $allowedFields = [
        'id_caixa',
        'data_de_abertura',
        'data_de_fechamento',
        'hora_de_abertura',
        'hora_de_fechamento',
        'valor_inicial',
        'valor_total',
        'valor_de_fechamento',
        'observacoes',
        'status',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
