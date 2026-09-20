<?php

namespace App\Models;

use CodeIgniter\Model;

class ClienteModel extends Model
{
    protected $table = 'clientes';
    protected $primaryKey = 'id_cliente';
    protected $allowedFields = [
        'id_cliente',
        'tipo',
        'nome',
        'cpf',
        'razao_social',
        'cnpj',
        'isento',
        'ie',
        'cep',
        'logradouro',
        'numero',
        'complemento',
        'bairro',
        'fixo',
        'celular_1',
        'celular_2',
        'email',
        'id_uf',
        'id_municipio',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
