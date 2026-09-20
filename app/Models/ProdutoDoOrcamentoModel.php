<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdutoDoOrcamentoModel extends Model
{
    protected $table = 'produtos_do_orcamento';
    protected $primaryKey = 'id_produto_do_orcamento';
    protected $allowedFields = [
        'id_produto_do_orcamento',
        'nome',
        'unidade',
        'codigo_de_barras',
        'quantidade',
        'valor_unitario',
        'subtotal',
        'desconto',
        'valor_final',
        
        'tipo_da_comissao',
        'porcentagem_comissao',
        'valor_comissao',
        
        'NCM',
        'CSOSN',
        'CFOP',
        'id_orcamento',
        'id_produto',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
