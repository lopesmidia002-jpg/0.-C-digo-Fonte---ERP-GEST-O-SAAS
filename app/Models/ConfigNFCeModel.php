<?php

namespace App\Models;

use CodeIgniter\Model;

class ConfigNFCeModel extends Model
{
    protected $table = 'config_nfce';
    protected $primaryKey = 'id_config';
    protected $allowedFields = [
        'id_config',
        'cUF',
        'natOp',
        'serie',
        'nNF',
        'cMunFG',
        'tpAmb',
        'verProc',
        'CNPJ',
        'xNome',
        'xFant',
        'IE',
        'CRT',
        'CEP',
        'xLgr',
        'nro',
        'xCpl',
        'xBairro',
        'cMun',
        'xMun',
        'UF',
        'cPais',
        'xPais',
        'fone',
        'CNPJ_responsavel_tecnico',
        'xContato',
        'email_responsavel_tecnico',
        'fone_responsavel_tecnico',
        'certificado',
        'senha',
        'CSC',
        'CSCid'
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
