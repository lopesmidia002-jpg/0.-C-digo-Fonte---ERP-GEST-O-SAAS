<?php

namespace App\Models;

use CodeIgniter\Model;

class FuncionarioModel extends Model
{
    protected $table = 'funcionarios';
    protected $primaryKey = 'id_funcionario';
    protected $allowedFields = [
        'id_funcionario',
        'status',
        'nome',
        'data_de_nascimento',
        'cpf',
        'cep',
        'logradouro',
        'numero',
        'complemento',
        'bairro',
        'municipio',
        'fixo',
        'celular_1',
        'celular_2',
        'email',
        'cargo',
        'data_de_contratacao',
        'data_inicio_das_atividades',
        'salario',
        'detalhes_da_atividade',
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
