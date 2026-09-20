<?php

namespace App\Models;

use CodeIgniter\Model;

class EmpresaModel extends Model
{
    protected $table = 'empresas';
    protected $primaryKey = 'id_empresa';
    protected $allowedFields = [
        'id_empresa',
        'status',
        'CNPJ',
        'xNome',
        'xFant',
        'IE',
        'dia_do_pagamento',
        'logomarca',
        'CRT',
        'CEP',
        'xLgr',
        'nro',
        'xCpl',
        'xBairro',
        'fone',
        'id_uf',
        'id_municipio',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
