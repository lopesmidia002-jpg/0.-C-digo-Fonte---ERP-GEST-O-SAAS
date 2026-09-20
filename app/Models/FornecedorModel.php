<?php

namespace App\Models;

use CodeIgniter\Model;

class FornecedorModel extends Model
{
    protected $table = 'fornecedores';
    protected $primaryKey = 'id_fornecedor';
    protected $allowedFields = [
        'id_fornecedor',
        'nome_do_representante',
        'nome_da_empresa',
        'cnpj',
        'ie',
        'cep',
        'logradouro',
        'numero',
        'complemento',
        'bairro',
        'comercial',
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
