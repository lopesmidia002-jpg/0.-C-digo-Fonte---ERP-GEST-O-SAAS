<?php

namespace App\Controllers;

use NFePHP\DA\NFe\Danfe;
use NFePHP\DA\NFe\Danfce;

use App\Models\NFeModel;
use App\Models\NFCeModel;
use CodeIgniter\Controller;

class ImpressaoDANFe extends Controller
{
    private $id_empresa;

    private $session;

    private $nfe_model;
    private $nfCe_model;

    public function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');

        $this->nfe_model = new NFeModel();
        $this->nfce_model = new NFCeModel();

        // Carrega o pacote Sped-Da caso esteja na pasta ThirdParty ou via Composer global
        if (file_exists(APPPATH . "ThirdParty/sped-da/vendor/autoload.php")) {
            require_once APPPATH . "ThirdParty/sped-da/vendor/autoload.php";
        } elseif (file_exists(ROOTPATH . "vendor/autoload.php")) {
            require_once ROOTPATH . "vendor/autoload.php";
        }
    }

    public function imprimir($tipo, $id)
    {
        if (!class_exists('NFePHP\DA\NFe\Danfe')) {
            $this->session->setFlashdata('alert', [
                'type'  => 'error',
                'title' => 'Biblioteca Sped-DA não encontrada. Execute `composer install` para instalar as dependências de impressão.',
            ]);

            return redirect()->to('/inicio');
        }

        if($tipo == 1) :

            $registro = $this->nfe_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_nfe', $id)
                        ->select('xml')
                        ->first();
        else:

            $registro = $this->nfce_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_nfce', $id)
                        ->select('xml')
                        ->first();

        endif;

        if (empty($registro) || empty($registro['xml'])) {
            $this->session->setFlashdata('alert', [
                'type'  => 'error',
                'title' => 'XML da nota não encontrado ou inválido.',
            ]);

            return redirect()->to('/inicio');
        }

        $xml = $registro['xml'];
        $logo = null;

        try {
            if($tipo == 1) :
                $danfe = new Danfe($xml);
            else:
                $danfe = new Danfce($xml);
            endif;

            $danfe->debugMode(false);
            $danfe->creditsIntegratorFooter('WEBNFe Sistemas - http://www.webenf.com.br');
            
            $pdf = $danfe->render($logo);

            return $this->response
                ->setHeader('Content-Type', 'application/pdf')
                ->setHeader('Content-Disposition', 'inline; filename="danfe_' . $id . '.pdf"')
                ->setBody($pdf);

        } catch (\Exception $e) {
            $this->session->setFlashdata('alert', [
                'type'  => 'error',
                'title' => 'Erro ao processar DANFE: ' . $e->getMessage(),
            ]);

            return redirect()->to('/inicio');
        }  
    }
}
