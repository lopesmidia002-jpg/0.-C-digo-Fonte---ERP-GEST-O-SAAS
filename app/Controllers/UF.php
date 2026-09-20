<?php

namespace App\Controllers;

use App\Models\MunicipioModel;
use CodeIgniter\Controller;

class UF extends Controller
{
    private $municipio_model;

    public function __construct()
    {
        $this->municipio_model = new MunicipioModel();
    }

    public function preparaMunicipios()
    {
        $id_uf = $this->request->getvar('id_uf');

        $municipios = $this->municipio_model
            ->where('id_uf', $id_uf)
            ->findAll();

        echo "<option value=\"\">Selecione</option>";

        foreach ($municipios as $municipio):
            echo "<option value=\"{$municipio['id_municipio']}\">{$municipio['municipio']}</option>";
        endforeach;
    }
}