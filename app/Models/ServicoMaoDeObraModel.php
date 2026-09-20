<?php

namespace App\Models;

use CodeIgniter\Model;

class ServicoMaoDeObraModel extends Model
{
    protected $table = 'servicos_mao_de_obra';
    protected $primaryKey = 'id_servico';
    protected $allowedFields = [
        'id_servico',
        'nome',
        'descricao',
        'valor',
        'observacoes',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}