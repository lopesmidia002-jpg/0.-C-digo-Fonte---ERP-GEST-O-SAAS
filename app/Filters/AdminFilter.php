<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class AdminFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $session = session();
        
        if (!$session->has('id_login') || $session->get('tipo') != 1) {
            $session->setFlashdata('alert', [
                'type'  => 'error',
                'title' => 'Acesso negado! Área restrita para administradores do sistema.',
            ]);

            return redirect()->to('/login');
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Nada a executar após a requisição
    }
}
