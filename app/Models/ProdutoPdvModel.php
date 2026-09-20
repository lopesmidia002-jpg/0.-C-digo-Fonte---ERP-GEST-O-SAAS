<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdutoPdvModel extends Model
{
    protected $table = 'produtos_do_pdv';
    protected $primaryKey = 'id_produto_pdv';
    protected $allowedFields = [
        'id_produto_pdv',
        'nome',
        'unidade',
        'codigo_de_barras',
        'quantidade',
        'valor_unitario',
        'subtotal',
        'desconto',
        'valor_final',
        'NCM',
        'CSOSN',
        'CFOP_NFe',
        'CFOP_NFCe',
        'id_produto',
        'id_empresa'
    ];
    // protected $useTimestamps = true;
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';
    // protected $deletedField  = 'deleted_at';
}
