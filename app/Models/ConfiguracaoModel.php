<?php

namespace App\Models;

use CodeIgniter\Model;

class ConfiguracaoModel extends Model
{
    protected $table = 'configuracoes';
    protected $primaryKey = 'id_config';
    protected $allowedFields = [
        'id_config',
        'nome_do_app',
        'tema',
        'xNome',
        'xFant',
        'telefone',
        'CNPJ',
        'endereco',
        'arquivo-imagem-de-fundo-login',
        'logomarca'
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}