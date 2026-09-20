<?php

namespace App\Controllers;

use App\Models\ConfiguracaoModel;
use App\Models\ControleDeAcessoModel;
use App\Models\ContadorModel;
use App\Models\EmpresaModel;
use App\Models\LoginModel;
use CodeIgniter\Controller;

class Login extends Controller
{
    private $link = [
        'li' => '12.x',
        'item' => '12.0',
        'subItem' => '12.1'
    ];
    
    private $session;
    private $id_empresa;
    private $id_login;

    private $configuracao_model;
    private $controle_de_acesso_model;
    private $empresa_model;
    private $login_model;

    function __construct()
    {
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->configuracao_model                 = new ConfiguracaoModel();
        $this->controle_de_acesso_model           = new ControleDeAcessoModel();
        $this->empresa_model                      = new EmpresaModel();
        $this->login_model                        = new LoginModel();
    }

    public function index()
    {
        $data['configuracao'] = $this->configuracao_model
                                                ->where('id_config', 1)
                                                ->first();
        echo view('login/index', $data);
    }

    public function autenticar()
    {
        $dados = $this->request->getVar();

        $usuario = $this->login_model
                    ->where('usuario', $dados['usuario'])
                    ->first();

        $senhaValida = false;

        if (!empty($usuario)) {
            // Verifica hash seguro
            if (password_verify($dados['senha'], $usuario['senha'])) {
                $senhaValida = true;
            } elseif ($usuario['senha'] === $dados['senha']) {
                // Compatibilidade com senhas legadas em texto puro: atualiza para hash seguro
                $senhaValida = true;
                $this->login_model->update($usuario['id_login'], ['senha' => $dados['senha']]);
            }
        }

        // Caso o usuário exista e a senha seja válida
        if($senhaValida) :
            $login = $usuario;

            $configuracao = $this->configuracao_model
                                            ->where('id_config', 1)
                                            ->first();
                                            
            $this->session->set('xApp', $configuracao['nome_do_app'] ?? 'ERP');
            $this->session->set('tema', $configuracao['tema'] ?? 'default');
            $this->session->set('tipo', $login['tipo']);

            $this->session->set('id_login', $login['id_login']);
            $this->session->set('usuario', $login['usuario']);

            $this->session
                ->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Usuário logado com sucesso!'
                    ]
                );

            if($login['tipo'] == 1) :

                $this->session->set('xFant', "Painel Administrativo");
                $this->session->set('logomarca', $configuracao['logomarca'] ?? '');

                return redirect()->to('/admin/inicio');

            elseif($login['tipo'] == 2) :

                $empresa = $this->empresa_model
                                ->where('id_empresa', $login['id_empresa'])
                                ->select('xFant, logomarca')
                                ->first();
                
                $this->session->set('xFant', $empresa['xFant'] ?? '');
                $this->session->set('logomarca', $empresa['logomarca'] ?? '');

                $this->session->set('id_empresa', $login['id_empresa']);
                $this->session->set('id_login', $login['id_login']);

                return redirect()->to('/inicio');

            endif;

        else:

            // Informa que os dados estão errados
            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'error',
                    'title' => 'Usuário ou senha incorretos!'
                ]
            );

            // Retorna para o login
            return redirect()->to('/login');
        
        endif;
    }

    public function logout()
    {
        $this->session->destroy();

        return redirect()->to('/login');
    }

    // --------- USUÁRIOS ----------- //
    public function usuarios()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('usuarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Usuários',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Usuários", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['usuarios'] = $this->login_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('login/usuarios');
        echo view('templates/footer');
    }

    public function create()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('usuarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Usuários',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Usuários", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        echo view('templates/header', $data);
        echo view('login/form');
        echo view('templates/footer');
    }

    public function edit($id_login)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('usuarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Usuários',
            'icone'  => 'fa fa-users'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Usuários", 'rota'   => "", 'active' => true]
        ];

        $data['usuario'] = $this->login_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_login', $id_login)
                                ->first();

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_login', $this->id_login)
                                        ->first();

        $data['controle_de_acesso_do_usuario_selecionado'] = $this->controle_de_acesso_model
                                                                ->where('id_empresa', $this->id_empresa)
                                                                ->where('id_login', $id_login)
                                                                ->first();

        echo view('templates/header', $data);
        echo view('login/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('usuarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        // Pega os dados com as pessoas de acesso
        $dados = $this->request->getVar();

        

        // ------------- AÇÃO EDITAR ---------------- //
        if(isset($dados['id_login'])):
            
            // Atualiza os dados do Usuário
            $this->login_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_login', $dados['id_login'])
                ->set('usuario', $dados['usuario'])
                ->set('senha', $dados['senha'])
                ->update();

            // ----- Atualiza os dados do controle de acesso
            // Seta todos os módulos como 0 (Sem premissão) para que depois venha dar as permissões
            $aux = [
                'venda_rapida' => 0,
                'pdv' => 0,
                'pesquisa_produto' => 0,
                'historico_de_vendas' => 0,
                'orcamentos' => 0,
                'pedidos' => 0,
                'ordem_de_servico' => 0,
                'novo_pedido' => 0,
                'mesas' => 0,
                'entregas' => 0,
                'abrir_painel' => 0,
                'transmitir_no_painel' => 0,
                'configs' => 0,
                'clientes' => 0,
                'fornecedores' => 0,
                'funcionarios' => 0,
                'vendedores' => 0,
                'entregadores' => 0,
                'tecnicos' => 0,
                'servico_mao_de_obra' => 0,
                'produtos' => 0,
                'reposicoes' => 0,
                'saida_de_mercadorias' => 0,
                'inventario_do_estoque' => 0,
                'categoria_dos_produtos' => 0,
                'caixas' => 0,
                'lancamentos' => 0,
                'retiradas_do_caixa' => 0,
                'despesas' => 0,
                'contas_a_pagar' => 0,
                'contas_a_receber' => 0,
                'relatorio_dre' => 0,
                'nfe' => 0,
                'nfce' => 0,
                'vendas_historico_completo' => 0,
                'vendas_por_cliente' => 0,
                'vendas_por_vendedor' => 0,
                'estoque_produtos' => 0,
                'estoque_minimo' => 0,
                'estoque_inventario' => 0,
                'estoque_validade_do_produto' => 0,
                'financeiro_movimentacao_de_entradas_e_saidas' => 0,
                'financeiro_faturamento_diario' => 0,
                'financeiro_faturamento_detalhado' => 0,
                'financeiro_lancamentos' => 0,
                'financeiro_retiradas_do_caixa' => 0,
                'financeiro_despesas' => 0,
                'financeiro_contas_a_pagar' => 0,
                'financeiro_contas_a_receber' => 0,
                'financeiro_dre' => 0,
                'geral_clientes' => 0,
                'geral_fornecedores' => 0,
                'geral_funcionarios' => 0,
                'geral_vendedores' => 0,
                'agenda' => 0,
                'usuarios' => 0,
                'config_da_conta' => 0,
                'config_da_empresa' => 0,
                'config_nfe_e_nfce' => 0,
                'widget_clientes' => 0,
                'widget_produtos' => 0,
                'widget_vendas' => 0,
                'widget_lancamentos' => 0,
                'widget_faturamento' => 0,
                'widget_os' => 0,
                'grafico_faturamento_linha' => 0,
                'grafico_faturamento_barras' => 0,
                'tabela_contas_a_pagar' => 0,
                'tabela_contas_a_receber' => 0,
            ];

            $this->controle_de_acesso_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_login', $dados['id_login'])
                ->where('id_controle_de_acesso', $dados['id_controle_de_acesso'])
                ->set($aux)
                ->update();
            // ------------- //

            // Atualiza com as novas permissões
            $this->controle_de_acesso_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_login', $dados['id_login'])
                ->where('id_controle_de_acesso', $dados['id_controle_de_acesso'])
                ->set($dados)
                ->update();

            // Cria um alerta e retorna
            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Usuário atualizado com sucesso!'
                ]
            );

            return redirect()->to("/login/edit/{$dados['id_login']}");

        endif;

        // ------------- AÇÃO CREATE ---------------- //

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        // Pega o usuário e senha do request
        $usuario = $this->request->getVar('usuario');
        $senha   = $this->request->getVar('senha');

        // Cadastra o usuário e retorna o ID
        $id_login = $this->login_model->insert([
            'usuario'             => $usuario,
            'senha'               => $senha,
            'tipo'                => 2, // 3=EMPRESA
            'esse_usuario_e_amdm' => 0, // 0=NÃO
            'id_empresa'          => $this->id_empresa,
        ]);

        // Adiciona o ID do novo usuário
        $dados['id_login'] = $id_login;

        // Cadastra a permissão de acesso do novo usuário
        $this->controle_de_acesso_model
            ->insert($dados);

        // Retorna com o alerta
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Usuário cadastrado com sucesso!'
            ]
        );
        return redirect()->to('/login/usuarios');
    }

    public function delete($id_login)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('usuarios');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;
        
        $this->login_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_login', $id_login)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Login excluido com sucesso!'
            ]
        );

        return redirect()->to('/login/usuarios');
    }

    public function verificaNomeDeUsuario()
    {
        $usuario = $this->request->getVar('usuario');
        
        $ret = $this->login_model
                    ->where('usuario', $usuario)
                    ->findAll();

        if(!empty($ret)):
            echo "1";
        else:
            echo "0";
        endif;
    }
}