<?php

namespace App\Models;

use CodeIgniter\Model;

class ConfiguracaoDoPainelModel extends Model
{
    protected $table = 'configuracoes_do_painel';
    protected $primaryKey = 'id_configuracao';
    protected $allowedFields = [
        'id_configuracao',
        'tamanho_da_senha',
        'cor_da_senha',
        'tamanho_ultimas_senhas',
        'tamanho_letreiro',
        'cor_do_letreiro',
        'cor_do_fundo_painel',
        'texto_do_letreiro',
        'id_contador',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';
}
