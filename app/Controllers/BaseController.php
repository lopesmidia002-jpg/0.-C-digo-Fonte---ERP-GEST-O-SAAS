<?php

namespace App\Controllers;

use App\Models\ControleDeAcessoModel;
use CodeIgniter\Controller;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;

/**
 * Class BaseController
 *
 * BaseController centraliza dependências, helpers, sessão,
 * controle de acesso, dados básicos da empresa e renderização de templates.
 */
class BaseController extends Controller
{
    /**
     * Helpers carregados automaticamente em todos os controllers
     */
    protected $helpers = ['url', 'form', 'app'];

    /**
     * Instância da requisição HTTP
     *
     * @var \CodeIgniter\HTTP\IncomingRequest
     */
    protected $request;

    /**
     * Instância da Sessão ativa
     *
     * @var \CodeIgniter\Session\Session
     */
    protected $session;

    /**
     * ID da Empresa ativa na sessão do usuário
     *
     * @var int|null
     */
    protected $id_empresa;

    /**
     * ID do Login do usuário ativo na sessão
     *
     * @var int|null
     */
    protected $id_login;

    /**
     * Tipo de usuário (1 = Admin SaaS, 2 = Empresa Cliente)
     *
     * @var int|null
     */
    protected $tipo_usuario;

    /**
     * Model de Controle de Acesso
     *
     * @var ControleDeAcessoModel
     */
    protected $controle_de_acesso_model;

    /**
     * Construtor e inicializador padrão do CodeIgniter 4
     */
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);

        $this->session = \Config\Services::session();
        $this->id_empresa   = $this->session->get('id_empresa');
        $this->id_login     = $this->session->get('id_login');
        $this->tipo_usuario = $this->session->get('tipo');

        $this->controle_de_acesso_model = new ControleDeAcessoModel();
    }

    /**
     * Valida se o usuário tem permissão para acessar determinado módulo
     *
     * @param string $modulo
     * @return string|false Retorna a URL de redirecionamento ou false se permitido
     */
    protected function verificaPermissao(string $modulo)
    {
        return $this->controle_de_acesso_model->verificaPermissao($modulo);
    }

    /**
     * Monta o array padrão de dados da página para passar às views
     *
     * @param array $link Links de menu ativo
     * @param array $titulo Título e ícone do módulo
     * @param array $caminhos Breadcrumbs de navegação
     * @return array
     */
    protected function preparaDadosBase(array $link = [], array $titulo = [], array $caminhos = []): array
    {
        $controleDeAcesso = null;
        if ($this->id_empresa && $this->id_login) {
            $controleDeAcesso = $this->controle_de_acesso_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_login', $this->id_login)
                ->first();
        }

        return [
            'link'               => $link,
            'titulo'             => $titulo,
            'caminhos'           => $caminhos,
            'controle_de_acesso' => $controleDeAcesso,
        ];
    }

    /**
     * Renderiza a view com cabeçalho e rodapé padrão
     *
     * @param string $view
     * @param array $data
     * @return string
     */
    protected function renderTemplate(string $view, array $data = []): string
    {
        return view('templates/header', $data)
             . view($view, $data)
             . view('templates/footer', $data);
    }

    /**
     * Define mensagem de alerta de sucesso
     *
     * @param string $title
     * @return void
     */
    protected function alertSuccess(string $title)
    {
        $this->session->setFlashdata('alert', [
            'type'  => 'success',
            'title' => $title,
        ]);
    }

    /**
     * Define mensagem de alerta de erro
     *
     * @param string $title
     * @return void
     */
    protected function alertError(string $title)
    {
        $this->session->setFlashdata('alert', [
            'type'  => 'error',
            'title' => $title,
        ]);
    }
}
