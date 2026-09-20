<?php

namespace App\Models;

use CodeIgniter\Model;

class LoginModel extends Model
{
    protected $table = 'login';
    protected $primaryKey = 'id_login';
    protected $allowedFields = [
        'id_login',
        'usuario',
        'senha',
        'tipo',
        'esse_usuario_e_admin',
        'id_empresa',
    ];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $beforeInsert = ['hashPassword'];
    protected $beforeUpdate = ['hashPassword'];

    protected function hashPassword(array $data)
    {
        if (isset($data['data']['senha']) && !empty($data['data']['senha'])) {
            $info = password_get_info($data['data']['senha']);
            if ($info['algo'] === 0) {
                $data['data']['senha'] = password_hash($data['data']['senha'], PASSWORD_DEFAULT);
            }
        }

        return $data;
    }
}
