<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdutoDoInventarioModel extends Model
{
    protected $table = 'produtos_do_inventario_do_estoque';
    protected $primaryKey = 'id_produto_do_inventario';
    protected $allowedFields = [
        'id_produto_do_inventario',
        'discriminacao',
        'unidade',
        'quantidade',
        'valor_unitario',
        'id_inventario',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
