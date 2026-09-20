<?php

namespace App\Models;

use CodeIgniter\Model;

class ProvisorioAddProdutoPorXmlModel extends Model
{
    protected $table = 'provisorio_add_produto_por_xml';
    protected $primaryKey = 'id_produto';
    protected $allowedFields = [
        'id_produto_provisorio',
        'nome',
        'unidade',
        'codigo_de_barras',
        'localizacao',
        'quantidade',
        'quantidade_minima',
        'valor_de_custo',
        'margem_de_lucro',
        'valor_de_venda',
        'lucro',
        'NCM',
        'CSOSN',
        'CFOP_NFe',
        'CFOP_NFCe',
        'CFOP_Externo',
        'arquivo',
        'tipo_da_comissao',
        'porcentagem_comissao',
        'valor_comissao',
        'id_categoria',
        'id_fornecedor',
        'id_empresa',
        'validade',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
