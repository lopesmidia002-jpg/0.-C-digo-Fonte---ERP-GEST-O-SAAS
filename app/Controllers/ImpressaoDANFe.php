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

        // Carrega o pacote Sped-Da
        require_once APPPATH . "ThirdParty/sped-da/vendor/autoload.php";
    }

    public function imprimir($tipo, $id)
    {
        if($tipo == 1) :

            $xml = $this->nfe_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_nfe', $id)
                        ->select('xml')
                        ->first()['xml'];
        else:

            $xml = $this->nfce_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_nfce', $id)
                        ->select('xml')
                        ->first()['xml'];

        endif;

        // $logo = 'data://text/plain;base64,'. base64_encode(file_get_contents(realpath(__DIR__ . '/../images/tulipas.png')));
        //$logo = realpath(__DIR__ . '/../images/tulipas.png');

        try {
            $this->response->setHeader('Content-Type', 'application/pdf');

            if($tipo == 1) :
                $danfe = new Danfe($xml);
            else:
                $danfe = new Danfce($xml);
            endif;

            $danfe->debugMode(false);
            $danfe->creditsIntegratorFooter('WEBNFe Sistemas - http://www.webenf.com.br');
            // Caso queira mudar a configuracao padrao de impressao
            /*  $this->printParameters( $orientacao = '', $papel = 'A4', $margSup = 2, $margEsq = 2 ); */
            //Informe o numero DPEC
            /*  $danfe->depecNumber('123456789'); */
            //Configura a posicao da logo
            /*  $danfe->logoParameters($logo, 'C', false);  */
            //Gera o PDF
            $pdf = $danfe->render($logo);
            // header('Content-Type: application/pdf');
            echo $pdf;
        } catch (InvalidArgumentException $e) {
            echo "Ocorreu um erro durante o processamento :" . $e->getMessage();
        }  
    }
}
