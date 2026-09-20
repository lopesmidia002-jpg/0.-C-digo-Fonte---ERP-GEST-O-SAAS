<?php

namespace App\Models;

use CodeIgniter\Model;

class BoletoModel extends Model
{
    protected $table = 'boletos';
    protected $primaryKey = 'id_boleto';
    protected $allowedFields = [
        'id_boleto',
        'id',
        'code',
        'reference',
        'dueDate',
        'link',
        'checkoutUrl',
        'installmentLink',
        'payNumber',
        'amount',
        'status',
        'json',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
}
