<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class AuthFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $session = session();
        
        if (!$session->has('id_login') || empty($session->get('tipo'))) {
            $session->setFlashdata('alert', [
                'type'  => 'error',
                'title' => 'Você não está logado! Acesse sua conta para continuar.',
            ]);

            return redirect()->to('/login');
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Nada a executar após a requisição
    }
}
