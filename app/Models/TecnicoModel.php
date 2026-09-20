<?php

namespace App\Models;

use CodeIgniter\Model;

class TecnicoModel extends Model
{
    protected $table = 'tecnicos';
    protected $primaryKey = 'id_tecnico';
    protected $allowedFields = [
        'id_tecnico',
        'nome',
        'data_de_nascimento',
        'cpf',
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