<?php

namespace App\Models;

use CodeIgniter\Model;

class EquipamentoOsModel extends Model
{
    protected $table = 'equipamentos_os';
    protected $primaryKey = 'id_equipamento';
    protected $allowedFields = [
        'id_equipamento',
        'equipamento',
        'marca',
        'modelo',
        'serie',
        'condicoes',
        'defeitos',
        'acessorios',
        'solucao',
        'laudo_tecnico',
        'termos_de_garantia',
        'id_ordem',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}