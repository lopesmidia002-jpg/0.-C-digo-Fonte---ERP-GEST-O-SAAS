<?php

namespace App\Controllers;

use App\Models\ClienteModel;
use App\Models\FornecedorModel;
use App\Models\VendedorModel;
use App\Models\TecnicoModel;
use App\Models\ServicoModel;
use App\Models\ConfiguracaoDoPainelModel;
use App\Models\CategoriasDosProdutosModel;
use App\Models\EntregadorModel;

use App\Models\ControleDeAcessoModel;
use App\Models\LoginModel;
use App\Models\UfModel;
use App\Models\MunicipioModel;
use App\Models\EmpresaModel;
use CodeIgniter\Controller;

class Empresas extends Controller
{
    private $link = [
        'item' => '2'
    ];

    private $tipo = 1;

    private $session;
    private $id_empresa;

    private $controle_de_acesso_model;
    private $login_model;
    private $uf_model;
    private $municipio_model;
    private $empresa_model;

    private $cliente_model;
    private $fornecedor_model;
    private $vendedor_model;
    private $tecnico_model;
    private $servico_model;
    private $configuracao_do_painel_model;
    private $categoria_dos_produtos_model;
    private $entregador_model;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        
        $this->controle_de_acesso_model = new ControleDeAcessoModel();
        $this->login_model              = new LoginModel();
        $this->uf_model                 = new UfModel();
        $this->municipio_model          = new MunicipioModel();
        $this->empresa_model            = new EmpresaModel();

        $this->cliente_model                = new ClienteModel();
        $this->fornecedor_model             = new FornecedorModel();
        $this->vendedor_model               = new VendedorModel();
        $this->tecnico_model                = new TecnicoModel();
        $this->servico_model                = new ServicoModel();
        $this->configuracao_do_painel_model = new ConfiguracaoDoPainelModel();
        $this->categoria_dos_produtos_model = new CategoriasDosProdutosModel();
        $this->entregador_model             = new EntregadorModel();
    }

    public function index()
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Empresas',
            'icone'  => 'fa fa-user-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio/contador", 'active' => false],
            ['titulo' => "Empresas", 'rota'   => "", 'active' => true]
        ];

        $dados = $this->request->getvar();

        if(isset($dados['cnpj'])) :
            
            $cnpj = removeMascara($dados['cnpj']);

            $data['empresas'] = $this->empresa_model
                                        ->where('CNPJ', $cnpj)
                                        ->findAll();

            $data['cnpj'] = $cnpj;

        else:

            $data['empresas'] = $this->empresa_model
                                            ->findAll();

        endif;

        echo view('templates/header', $data);
        echo view('empresas/index');
        echo view('templates/footer');
    }

    public function create()
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Nova Empresa',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Nova Empresa", 'rota'   => "", 'active' => true]
        ];

        $data['ufs'] = $this->uf_model
                            ->findAll();

        $data['municipios'] = $this->municipio_model
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('empresas/form');
        echo view('templates/footer');
    }

    public function show($id_empresa)
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados da Empresa',
            'icone'  => 'fa fa-database'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Nova Empresa", 'rota'   => "", 'active' => true]
        ];

        $data['empresa'] = $this->empresa_model
                                ->where('empresas.id_empresa', $id_empresa)
                                ->join('ufs', 'empresas.id_uf = ufs.id_uf')
                                ->join('municipios', 'empresas.id_municipio = municipios.id_municipio')
                                ->join('login', 'empresas.id_empresa = login.id_empresa')
                                ->first();

        echo view('templates/header', $data);
        echo view('empresas/show');
        echo view('templates/footer');
    }

    public function edit($id_empresa)
    {
        if($this->session->get('tipo') != $this->tipo) :
            $this->session->setFlashdata(
                'alert', 
                [
                    'type' => 'error',
                    'title' => 'Acesso negado, você não tem permissão para fazer esse acesso!'
                ]
            );
            return redirect()->to('/login');
        endif;
        // -------------------------------------------------------------------- //

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Editar Empresa',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio/contador", 'active' => false],
            ['titulo' => "Empresas", 'rota' => "/empresas", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $empresa = $this->empresa_model
                        ->where('id_empresa', $id_empresa)
                        ->first();

        $login = $this->login_model
                    ->where('id_empresa', $empresa['id_empresa'])
                    ->first();

        $ufs = $this->uf_model
                    ->findAll();

        $municipios = $this->municipio_model
                            ->where('id_uf', $empresa['id_uf'])
                            ->find();

        $data['empresa']    = $empresa;
        $data['login']      = $login;
        $data['ufs']        = $ufs;
        $data['municipios'] = $municipios;

        echo view('templates/header', $data);
        echo view('empresas/form');
        echo view('templates/footer');
    }

    public function store()
    {        
        $dados = $this->request->getVar();

        // ---------- REMOVE AS MASCARAS ------------ //
        $dados['CNPJ'] = removeMascara($dados['CNPJ']);
        $dados['CEP']  = removeMascara($dados['CEP']);
        
        if(isset($dados['nro'])): // Caso exista o campo então o usuário digitou um número
            if($dados['nro'] == "" || $dados['nro'] == "0") : // Valida
                $dados['nro'] = "S/N";
            endif;
        else: // Caso não exista então é sem número
            $dados['nro'] = "S/N";
        endif;

        // Caso ação seja editar
        if(isset($dados['id_login'])) :
            
            $this->login_model
                        ->save($dados);
            
            $this->empresa_model
                        ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => 'Empresa atualizada com sucesso!'
                ]
            );
            
            return redirect()->to("/empresas/edit/{$dados['id_empresa']}");
        
        endif;
        
        // Caso a ação seja cadastrar

        $dados['tipo'] = 2; // Informa o tipo. 2=empresa

        $dados['esse_usuario_e_admin'] = 1; // 1=SIM
        
        // Dados necessários NFe/NFCe
        $dados['tpAmb_NFe'] = 2;
        $dados['nNF_homologacao'] = 1;
        $dados['nNF_producao'] = 1;
        
        $dados['tpAmb_NFCe'] = 2;
        $dados['nNFC_homologacao'] = 1;
        $dados['nNFC_producao'] = 1;
        
        $dados['natOp'] = "VENDA DE MERCADORIAS";

        // Cadastra EMPRESA
        $id_empresa = $this->empresa_model
                                ->insert($dados);

        $dados['id_empresa'] = $id_empresa;

        // Cadastra LOGIN
        $id_login = $this->login_model
                            ->insert($dados);

        // Cadastra os registros necessários
        $this->cliente_model
            ->insert([
                'tipo'         => 1,
                'nome'         => 'CONSUMIDOR FINAL',
                'cpf'          => 'S/N',
                'id_uf'        => 17,
                'id_municipio' => 1,
                'id_empresa'   => $id_empresa
            ]);

        $this->fornecedor_model
            ->insert([
                'nome_do_representante' => 'GERAL',
                'noma_da_empresa'       => 'Não possui',
                'id_uf'                 => 17,
                'id_municipio'          => 1,
                'id_empresa'            => $id_empresa
            ]);

        $this->vendedor_model
            ->insert([
                'nome'       => 'GERAL',
                'status'     => 'Ativo',
                'id_empresa' => $id_empresa
            ]);

        $this->tecnico_model
            ->insert([
                'nome'         => 'GERAL',
                'id_uf'        => 17,
                'id_municipio' => 1,
                'id_empresa'   => $id_empresa
            ]);

        // Serviços FOOD
        $this->servico_model
            ->insert([
                'nome'       => 'Normal',
                'id_empresa' => $id_empresa
            ]);
        
        $this->servico_model
            ->insert([
                'nome'       => 'Ifood',
                'id_empresa' => $id_empresa
            ]);

        $this->servico_model
            ->insert([
                'nome'       => 'To no lucro',
                'id_empresa' => $id_empresa
            ]);

        $this->servico_model
            ->insert([
                'nome'       => 'Chefinho delivery',
                'id_empresa' => $id_empresa
            ]);
        // -------------- //

        $this->configuracao_do_painel_model
            ->insert([
                'tamanho_da_senha'       => 350,
                'cor_da_senha'           => 'red',
                'tamanho_ultimas_senhas' => 50,
                'tamanho_letreiro'       => 120,
                'cor_do_letreiro'        => 'blue',
                'cor_do_fundo_painel'    => 'white',
                'texto_do_letreiro'      => 'Adicione um texto para passar no letreiro.',
                'id_empresa'             => $id_empresa
            ]);

        $this->categoria_dos_produtos_model
            ->insert([
                'nome'       => 'Nenhum',
                'descricao'  => 'Categoria padrão para produtos sem categoria.',
                'id_empresa' => $id_empresa
            ]);

        $this->entregador_model
            ->insert([
                'status'     => "Ativo",
                'nome'       => 'GERAL',
                'id_empresa' => $id_empresa
            ]);

        // Cadastra controle de acesso 
		$this->controle_de_acesso_model->insert([
            'venda_rapida' => 1,
            'pdv' => 1,
            'pesquisa_produto' => 1,
            'historico_de_vendas' => 1,
            'orcamentos' => 1,
            'pedidos' => 1,
            'ordem_de_servico' => 1,
            'novo_pedido' => 1,
            'mesas' => 1,
            'entregas' => 1,
            'abrir_painel' => 1,
            'transmitir_no_painel' => 1,
            'configs' => 1,
            'clientes' => 1,
            'fornecedores' => 1,
            'funcionarios' => 1,
            'vendedores' => 1,
            'entregadores' => 1,
            'tecnicos' => 1,
            'servico_mao_de_obra' => 1,
            'transportadoras' => 1,
            'produtos' => 1,
            'reposicoes' => 1,
            'saida_de_mercadorias' => 1,
            'inventario_do_estoque' => 1,
            'categoria_dos_produtos' => 1,
            'caixas' => 1,
            'lancamentos' => 1,
            'retiradas_do_caixa' => 1,
            'despesas' => 1,
            'contas_a_pagar' => 1,
            'contas_a_receber' => 1,
            'relatorio_dre' => 1,
            'nfe' => 1,
            'nfce' => 1,
            'vendas_historico_completo' => 1,
            'vendas_por_cliente' => 1,
            'vendas_por_vendedor' => 1,
            'estoque_produtos' => 1,
            'estoque_minimo' => 1,
            'estoque_inventario' => 1,
            'estoque_validade_do_produto' => 1,
            'financeiro_movimentacao_de_entradas_e_saidas' => 1,
            'financeiro_faturamento_diario' => 1,
            'financeiro_faturamento_detalhado' => 1,
            'financeiro_lancamentos' => 1,
            'financeiro_retiradas_do_caixa' => 1,
            'financeiro_despesas' => 1,
            'financeiro_contas_a_pagar' => 1,
            'financeiro_contas_a_receber' => 1,
            'financeiro_dre' => 1,
            'geral_clientes' => 1,
            'geral_fornecedores' => 1,
            'geral_funcionarios' => 1,
            'geral_vendedores' => 1,
            'agenda' => 1,
            'usuarios' => 1,
            'config_da_conta' => 1,
            'config_da_empresa' => 1,
            'config_nfe_e_nfce' => 1,
            'widget_clientes' => 1,
            'widget_produtos' => 1,
            'widget_vendas' => 1,
            'widget_lancamentos' => 1,
            'widget_faturamento' => 1,
            'widget_os' => 1,
            'grafico_faturamento_linha' => 1,
            'grafico_faturamento_barras' => 1,
            'tabela_contas_a_pagar' => 1,
            'tabela_contas_a_receber' => 1,
            'id_empresa' => $id_empresa,
            'id_login' => $id_login,
        ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type' => 'success',
                'title' => 'Empresa cadastrada com sucesso!'
            ]
        );
        
        return redirect()->to('/empresas');    
    }

    public function delete($id_empresa)
    {
        // Apaga primeiro a empresa
        $this->empresa_model
            ->where('id_empresa', $id_empresa)
            ->delete();

        // Depois apaga todos os usuários cadastrados para essa empresa
        $this->login_model
            ->where('id_empresa', $id_empresa)
            ->delete();
        
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Empresa excluida com sucesso!'
            ]
        );

        return redirect()->to('/empresas');
    }
}