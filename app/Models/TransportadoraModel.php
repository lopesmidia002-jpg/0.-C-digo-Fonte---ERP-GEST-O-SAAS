<?php

namespace App\Models;

use CodeIgniter\Model;

class TransportadoraModel extends Model
{
    protected $table = 'transportadoras';
    protected $primaryKey = 'id_transportadora';
    protected $allowedFields = [
        'id_transportadora',
        'CNPJ',
        'xNome',
        'isento',
        'IE',
        'xEnder',
        'id_uf',
        'id_municipio',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}







