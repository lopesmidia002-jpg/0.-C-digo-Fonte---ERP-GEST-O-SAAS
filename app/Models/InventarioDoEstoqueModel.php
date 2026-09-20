<?php

namespace App\Models;

use CodeIgniter\Model;

class InventarioDoEstoqueModel extends Model
{
    protected $table = 'inventarios_do_estoque';
    protected $primaryKey = 'id_inventario';
    protected $allowedFields = [
        'id_inventario',
        'descricao',
        'data',
        'observacoes',
        'id_contador',
        'id_empresa',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
