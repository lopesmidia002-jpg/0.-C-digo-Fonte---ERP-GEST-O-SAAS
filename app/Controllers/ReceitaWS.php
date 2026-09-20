<?php

namespace App\Controllers;

use CodeIgniter\Controller;

class ReceitaWS extends Controller
{
    public function pegaDadosDoCNPJ()
    {
        $session = session();
        if (!$session->has('id_login')) {
            return $this->response->setStatusCode(401)->setJSON(['status' => 'ERROR', 'message' => 'Não autorizado']);
        }

        //Capturar CNPJ
        $cnpj = $this->request->getVar('cnpj');

        //Garantir que seja lido sem problemas
        header("Content-Type: text/plain");

        //Criando Comunicação cURL
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://www.receitaws.com.br/v1/cnpj/$cnpj");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $retorno = curl_exec($ch);
        curl_close($ch);

        echo $retorno;
    }
}