<?php

namespace App\Controllers;

use App\Models\ConfiguracaoModel;
use App\Models\ControleDeAcessoModel;
use App\Models\HistoricoUltimaSenhaModel;
use App\Models\ConfiguracaoDoPainelModel;
use App\Models\PainelModel;
use CodeIgniter\Controller;

class Painel extends Controller
{
    private $link = [
        'li' => '4.x',
        'item' => '4.0',
        'subItem' => '4.6'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $configuracao_model;
    private $controle_de_acesso_model;
    private $historico_ultima_senha_model;
    private $configuracao_do_painel_model;
    private $painel_model;

    private $permissao;

    function __construct()
    {
        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->configuracao_model            = new ConfiguracaoModel();
        $this->controle_de_acesso_model      = new ControleDeAcessoModel();
        $this->historico_ultima_senha_model  = new HistoricoUltimaSenhaModel();
        $this->configuracao_do_painel_model  = new ConfiguracaoDoPainelModel();
        $this->painel_model                  = new PainelModel();
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('abrir_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['config'] = $this->configuracao_model
                                ->where('id_config', 1)
                                ->first();

        $data['configuracao'] = $this->configuracao_do_painel_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->first();

        $data['senha'] = $this->painel_model
                                ->where('id_empresa', $this->id_empresa)
                                ->select('senha')
                                ->first();

        echo view('food/painel/index', $data);
    }

    public function transmitir()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('transmitir_no_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Transmitir no Painel',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Pedidos", 'rota' => "/pedidos", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $senha = $this->painel_model
                            ->where('id_empresa', $this->id_empresa)
                            ->select('senha')
                            ->first();

        // Verifica se é vazio para não dar erro
        if(!empty($senha)):
            $data['senha'] = $senha['senha'];
        else: // Caso seja vazio então coloca "" no array
            $data['senha'] = "";
        endif;
        // ----------- //

        $data['historico'] = $this->historico_ultima_senha_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->orderBy('id_historico', 'DESC')
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('food/painel/transmitir_no_painel');
        echo view('templates/footer');
    }

    public function storeTransmitir()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('transmitir_no_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $senha = $this->request->getVar('senha');

        $this->painel_model
            ->set('senha', $senha)
            ->where('id_empresa', $this->id_empresa)
            ->update();

        $this->historico_ultima_senha_model
            ->insert([
                'senha'       => $senha,
                'data'        => date('Y-m-d'),
                'hora'        => date('H:i:s'),
                'id_empresa'  => $this->id_empresa,
            ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Senha transmitida com sucesso!'
            ]
        );

        return redirect()->to('/painel/transmitir');
    }

    public function storeConfigsPainel()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getVar();

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->configuracao_do_painel_model
            ->set($dados)
            ->where('id_empresa', $this->id_empresa)
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Configurações do Painel atualizadas sucesso!'
            ]
        );

        return redirect()->to('/food/configs');
    }

    public function limpaHistorico()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('transmitir_no_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->historico_ultima_senha_model
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Histórico de senhas transmitidas excluido com sucesso!'
            ]
        );

        return redirect()->to('/painel/transmitir');
    }

    function atualizaSenha()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('abrir_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $senha = $this->painel_model
                        ->where('id_empresa', $this->id_empresa)
                        ->select('senha')
                        ->first()['senha'];
        
        echo $senha;
    }

    function atualizaQuatroUltimasSenhas()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('abrir_painel');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;
        
        $historico = $this->historico_ultima_senha_model
                        ->where('id_empresa', $this->id_empresa)
                        ->select('senha')
                        ->limit(5)
                        ->orderBy('id_historico', 'DESC')
                        ->find();

        // Remove o primeiro elemento porque esse será mostrado na senha
        unset($historico[0]);
        
        if(!empty($historico)):
            foreach($historico as $aux):
                echo "<tr>";
                    echo "<td>{$aux['senha']}</td>";
                echo "</tr>";
            endforeach;
        else:
            echo "
                <tr>
                    <td>Nenhum registro!</td>
                </tr>
            ";
        endif;
    }
}
