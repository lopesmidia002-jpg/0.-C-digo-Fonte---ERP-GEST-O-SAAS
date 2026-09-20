<?php

namespace App\Models;

use CodeIgniter\Model;

class ConfiguracoesApiBoletoModel extends Model
{
    protected $table = 'configuracoes_api_boletos';
    protected $primaryKey = 'id_config';
    protected $allowedFields = [
        'id_config',
        'clientId',
        'clientSecret',
        'token_privado',
        'authorization_server',
        'api_integration',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}