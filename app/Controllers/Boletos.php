<?php

namespace App\Controllers;

use App\Models\ConfiguracoesApiBoletoModel;
use App\Models\BoletoModel;
use App\Models\ControleDeAcessoModel;

use CodeIgniter\Controller;

class Boletos extends Controller
{
    private $link = [
        'item' => '3'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $configuracoes_api_boleto_model;
    private $boleto_model;
    private $controle_de_acesso_model;

    function __construct()
    {
        $this->helpers = ['app'];

        $this->session = session();
        $this->id_empresa  = $this->session->get('id_empresa');
        $this->id_login    = $this->session->get('id_login');

        $this->configuracoes_api_boleto_model = new ConfiguracoesApiBoletoModel();
        $this->boleto_model                   = new BoletoModel();
        $this->controle_de_acesso_model       = new ControleDeAcessoModel();
    }

    public function index()
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Boletos',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Boletos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['boletos'] = $this->boleto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->findAll();

        echo view('templates/header', $data);
        echo view('admin/boletos/index');
        echo view('templates/footer');
    }

    public function create()
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Gerar Boleto',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Gerar Boleto", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('admin/boletos/create');
        echo view('templates/footer');
    }

    public function mostraErro($erro)
    {
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Ops, ouve um erro ao gerar o Boleto.',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Gerar Boleto", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['erro'] = $erro;

        echo view('templates/header', $data);
        echo view('admin/boletos/erro');
        echo view('templates/footer');
    }

    public function store()
    {
        $dados = $this->request->getVar();

        // Converte de BRL para USD
        $dados['amount'] = converteMoney($dados['amount']);

        // Remove Mascara
        $dados['document'] = removeMascara($dados['document']);

        $clientId = "ksfk492wQzySNRQE";
        $clientSecret = "S(0lGMiu^D<rw<c|*=AhK)hXBJ6hHh,C";

        $base64 = base64_encode("{$clientId}:{$clientSecret}");

        $ch = curl_init("https://sandbox.boletobancario.com/authorization-server/oauth/token");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, "grant_type=client_credentials");
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Content-Type: application/x-www-form-urlencoded",
            "Authorization: Basic {$base64}"
        ]);

        $resultado = json_decode(curl_exec($ch));

        // Pega o access_token do request
        $access_token = $resultado->access_token;
        
        // Json de emissão 
        $json = '
            {
                "charge": {
                    "description": "'. $dados['description'] .'",
                    "references": ["'. $dados['references'] .'"],
                    "amount": "'. $dados['amount'] .'",
                    "dueDate": "'. $dados['dueDate'] .'",
                    "installments": 1,
                    "maxOverdueDays": 0,
                    "fine": "0.00",
                    "interest": "0.00",
                    "discountAmount": "0.00",
                    "discountDays": -1,
                    "paymentAdvance": false,
                    "paymentTypes": [
                        "BOLETO"
                    ]
                },
                "billing": {
                    "name": "'. $dados['name'] .'",
                    "document": "'. $dados['document'] .'",
                    "email": "",
                    "secondaryEmail": "",
                    "phone": "",
                    "birthDate": "",
                    "notify": false
                }
            }
        ';
        
        $authorization = "Authorization: Bearer ".$access_token; // Prepare the authorisation token
        $versao_da_api = "X-API-Version: 2";
        $token_privado = "X-Resource-Token: "."79E027C7065F33EE91666B3AE8F6172E60D1A6DC3B5B79F7698D96E7446F8F75";
        $aux = "Content-Type: application/json";

        $ch = curl_init("https://sandbox.boletobancario.com/api-integration/charges");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array($authorization, $versao_da_api, $token_privado, $aux)); // Inject the token into the header
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        
        // Retorno com Json Resposta da API Juno
        $retorno = curl_exec($ch);
        
        // Converte o Json em StdClass
        $dados_da_fatura = json_decode($retorno);

        // Caso tenha dado erro
        if(isset($dados_da_fatura->error)):
            $this->mostraErro($dados_da_fatura->details[0]->message);
            exit();
        endif;
        
        // Salva os dados da fatura no banco de dados
        $this->boleto_model
            ->insert([
                'id'              => $dados_da_fatura->_embedded->charges[0]->id,
                'code'            => $dados_da_fatura->_embedded->charges[0]->code,
                'reference'       => $dados_da_fatura->_embedded->charges[0]->reference,
                'dueDate'         => $dados_da_fatura->_embedded->charges[0]->dueDate,
                'link'            => $dados_da_fatura->_embedded->charges[0]->link,
                'checkoutUrl'     => $dados_da_fatura->_embedded->charges[0]->checkoutUrl,
                'installmentLink' => $dados_da_fatura->_embedded->charges[0]->installmentLink,
                'payNumber'       => $dados_da_fatura->_embedded->charges[0]->payNumber,
                'amount'          => $dados_da_fatura->_embedded->charges[0]->amount,
                'status'          => $dados_da_fatura->_embedded->charges[0]->status,
                'json'            => $retorno,
                'id_empresa'      => $this->id_empresa
            ]);
        
        // Redireciona para o PDF do boleto
        return redirect()->to($dados_da_fatura->_embedded->charges[0]->link);
    }

    public function delete($id_boleto)
    {
        $this->boleto_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_boleto', $id_boleto)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Boleto excluido com sucesso!'
            ]
        );

        return redirect()->to('/boletos');
    }

    public function configuracoesAPI()
    {
        $data['link'] = [
            'li' => '5.x',
            'item' => '5.0',
            'subItem' => '5.3'
        ];
        
        $data['titulo'] = [
            'modulo' => 'Configurações API Juno',
            'icone'  => 'fa fa-book-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "COnfig. API Juno", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['configuracao'] = $this->configuracoes_api_boleto_model
                                                            ->where('id_config', 1)
                                                            ->first();

        echo view('templates/header', $data);
        echo view('admin/boletos/configuracoes_api');
        echo view('templates/footer');
    }

    public function storeConfiguracoesAPI()
    {
        $dados = $this->request->getVar();

        $this->configuracoes_api_boleto_model
            ->where('id_config', 1)
            ->set($dados)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Dados da API atualizados com sucesso!'
            ]
        );

        return redirect()->to('/boletos/configuracoesAPI');
    }
}

?>