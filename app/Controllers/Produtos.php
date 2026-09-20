<?php

namespace App\Controllers;

use App\Models\UfModel;
use App\Models\MunicipioModel;
use App\Models\ControleDeAcessoModel;
use App\Models\ReposicaoModel;
use App\Models\ProvisorioReposicaoProdutosPorXmlModel;
use App\Models\ProvisorioAddProdutoPorXmlModel;
use App\Models\CategoriasDosProdutosModel;
use App\Models\ProdutoModel;
use App\Models\FornecedorModel;

use CodeIgniter\Controller;

class Produtos extends Controller
{
    private $modulo = 'produtos';

    private $link = [
        'li' => '6.x',
        'item' => '6.0',
        'subItem' => '6.1'
    ];

    private $session;

    private $id_empresa;
    private $id_login;

    private $uf_model;
    private $municipio_model;
    private $controle_de_acesso_model;
    private $reposicao_model;
    private $provisorio_reposicao_produtos_por_xml_model;
    private $provisorio_add_produto_por_xml_model;
    private $produto_model;
    private $categoria_model;
    private $fornecedor_model;

    function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->uf_model                                    = new UfModel();
        $this->municipio_model                             = new MunicipioModel();
        $this->controle_de_acesso_model                    = new ControleDeAcessoModel();
        $this->reposicao_model                             = new ReposicaoModel();
        $this->provisorio_reposicao_produtos_por_xml_model = new ProvisorioReposicaoProdutosPorXmlModel();
        $this->provisorio_add_produto_por_xml_model        = new ProvisorioAddProdutoPorXmlModel();
        $this->produto_model                               = new ProdutoModel();
        $this->categoria_model                             = new CategoriasDosProdutosModel();
        $this->fornecedor_model                            = new FornecedorModel();

        $this->permissao = $this->controle_de_acesso_model->verificaPermissao('clientes');
    }

    public function index()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Produtos',
            'icone'  => 'fa fa-box-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Produtos", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produtos'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('produtos/index');
        echo view('templates/footer');
    }

    public function pesquisar()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = [
            'li' => '2.x',
            'item' => '2.0',
            'subItem' => '2.2'
        ];

        $data['titulo'] = [
            'modulo' => 'Pesquisar Produto',
            'icone'  => 'fa fa-box-open'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Pesq. Produto", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produtos'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        // Para pesquisa feito pelo nome
        $id_produto = $this->request->getvar('id_produto');
        
        if(isset($id_produto)) :
            $data['produto_pesq'] = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto', $id_produto)
                                        ->first();

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Produto Localizado!'
                ]    
            );

        endif;
        
        // Para pesquisa feito pelo codigo de barras
        $codigo_de_barras = $this->request->getvar('codigo_de_barras');
        
        if (isset($codigo_de_barras)) :
            $produto = $this->produto_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('codigo_de_barras', $codigo_de_barras)
                            ->first();
            
            if(isset($produto['id_produto'])) :
                $data['produto_pesq'] = $produto;
                $this->session->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Produto localizado!'
                    ]    
                );
            else :
                $this->session->setFlashdata(
                    'alert',
                    [
                        'type'  => 'warning',
                        'title' => 'Produto não localizado! Verifique o código de barras.'
                    ]    
                );
            endif;
        endif;

        echo view('templates/header', $data);
        echo view('produtos/pesquisar');
        echo view('templates/footer');
    }

    public function show($id_produto)
    {
        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados do Produto',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Produtos", 'rota' => "/produtos", 'active' => false],
            ['titulo' => "Dados", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produto'] = $this->produto_model
            ->select('
                produtos.nome AS nome_do_produto,
                categorias_dos_produtos.nome AS nome_da_categoria_do_produto,
                fornecedores.nome_do_representante AS nome_do_representante,
                fornecedores.nome_da_empresa AS nome_da_empresa,
                unidade, codigo_de_barras,
                localizacao,
                quantidade,
                quantidade_minima,
                margem_de_lucro,
                valor_de_custo,
                valor_de_venda,
                lucro, arquivo,
                NCM,
                CSOSN,
                CFOP_NFe,
                CFOP_NFCe,
                CFOP_Externo,
                validade,
                tipo_da_comissao,
                porcentagem_comissao,
                valor_comissao
            ')
            ->join('categorias_dos_produtos', 'categorias_dos_produtos.id_categoria = produtos.id_categoria')
            ->join('fornecedores', 'fornecedores.id_fornecedor = produtos.id_fornecedor')
            ->where('produtos.id_produto', $id_produto)
            ->first();

        echo view('templates/header', $data);
        echo view('produtos/show');
        echo view('templates/footer');
    }

    public function create()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Novo Produto',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Produtos", 'rota' => "/produtos", 'active' => false],
            ['titulo' => "Novo", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['categorias'] = $this->categoria_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $data['fornecedores'] = $this->fornecedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('produtos/form');
        echo view('templates/footer');
    }

    public function edit($id_produto)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Editar Produto',
            'icone'  => 'fa fa-edit'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Produtos", 'rota' => "/produtos", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produto'] = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_produto', $id_produto)
                                ->first();

        $data['categorias'] = $this->categoria_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $data['fornecedores'] = $this->fornecedor_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        echo view('templates/header', $data);
        echo view('produtos/form');
        echo view('templates/footer');
    }

    public function store()
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $file = $this->request->getFile('arquivo');
        $dados = $this->request->getvar();

        // Converte valores de BRL para USD
        $dados['margem_de_lucro']      = converteMoney($dados['margem_de_lucro']);
        $dados['valor_de_custo']       = converteMoney($dados['valor_de_custo']);
        $dados['valor_de_venda']       = converteMoney($dados['valor_de_venda']);
        $dados['lucro']                = converteMoney($dados['lucro']);
        $dados['porcentagem_comissao'] = converteMoney($dados['porcentagem_comissao']);
        $dados['valor_comissao']       = converteMoney($dados['valor_comissao']);

        // Verifica código de barras
        if(!isset($dados['codigo_de_barras'])):
            $dados['codigo_de_barras'] = "SEM GTIN";
        endif;

        // Verifica se foi selecionado uma imagem, e atribui ao array o nome do arquivo depois de movido para a pasta.
        if ($file->isValid()) :

            // Se a ação for editar, e se foi selecionado uma foto para trocar, então remove a que já existe e cadastra a nova
            if(isset($dados['id_produto'])) :
            
                $produto = $this->produto_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_produto', $dados['id_produto'])
                                ->first();

                if($produto['arquivo'] != "") :
                    
                    unlink("assets/img/produtos/{$produto['arquivo']}");
                
                endif;
            
            endif;

            $name = $file->getRandomName();
            $file->store('../../public/assets/img/produtos/', $name);

            $dados['arquivo'] = $name;

        endif;

        // Caso a ação seja editar
        if(isset($dados['id_produto'])) :
            $this->produto_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto', $dados['id_produto'])
                ->set($dados)
                ->update();

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Produto atualizado com sucesso!',
                ]
            );

            return redirect()->to("/produtos/edit/{$dados['id_produto']}");
        endif;

        // Caso a ação seja cadastrar
        $dados['id_empresa'] = $this->id_empresa;

        $this->produto_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto cadastrado com sucesso!',
            ]
        );

        return redirect()->to('/produtos');
    }

    // -------------------------- CADASTRO DE PRODUTOS POR XML ------------------------------------ //

    public function add_por_xml()
    {
        // Remove todos os registros da tabela só para ter certeza que ela estará vazia
        $this->provisorio_add_produto_por_xml_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->delete();

        $file = $this->request->getFile('xml');
        $xml  = simplexml_load_file($file);

        $emitente_da_xml = $xml->NFe->infNFe->emit;

        $fornecedor = $this->fornecedor_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('cnpj', $emitente_da_xml->CNPJ)
                                ->join('ufs', 'fornecedores.id_uf = ufs.id_uf')
                                ->join('municipios', 'fornecedores.id_municipio = municipios.id_municipio')
                                ->first();

        if(empty($fornecedor)) // Verifica se o fornecedor existe, se não existir ele será cadastrado provisoriamente e espera a ação do usuário.
        {
            $municipio = $this->municipio_model
                            ->where('codigo', $emitente_da_xml->enderEmit->cMun)
                            ->first();

            $uf = $this->uf_model
                        ->where('id_uf', $municipio['id_uf'])
                        ->first();

            $id_fornecedor = $this->fornecedor_model->insert([
                'nome_do_representante' => $emitente_da_xml->xNome,
                'nome_da_empresa'       => $emitente_da_xml->xFant,
                'cnpj'                  => $emitente_da_xml->CNPJ,
                'ie'                    => $emitente_da_xml->IE,
                'cep'                   => $emitente_da_xml->enderEmit->CEP,
                'logradouro'            => $emitente_da_xml->enderEmit->xLgr,
                'numero'                => $emitente_da_xml->enderEmit->nro,
                'complemento'           => $emitente_da_xml->enderEmit->xCpl,
                'bairro'                => $emitente_da_xml->enderEmit->xBairro,
                'municipio'             => $emitente_da_xml->enderEmit->xMun,
                'comercial'             => $emitente_da_xml->enderEmit->fone,
                'anotacoes'             => "Fornecedor cadastrado por XML",
                'id_uf'                 => $uf['id_uf'],
                'id_municipio'          => $municipio['id_municipio'],
                'id_empresa'            => $this->id_empresa
            ]);

            // Pega os dados do fornecedor cadastrado
            $fornecedor = $this->fornecedor_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_fornecedor', $id_fornecedor)
                                ->join('ufs', 'fornecedores.id_uf = ufs.id_uf')
                                ->join('municipios', 'fornecedores.id_municipio = municipios.id_municipio')
                                ->first();

            // Informa com a variável que foi cadastrado o fornecedor
            $acao_cad_fornecedor = TRUE;
        }

        foreach($xml->NFe->infNFe->det as $item)
        {
            $this->provisorio_add_produto_por_xml_model->insert([
                'nome'              => $item->prod->xProd,
                'unidade'           => $item->prod->uCom,
                'codigo_de_barras'  => $item->prod->cEAN,
                'quantidade'        => $item->prod->qCom,
                'quantidade_minima' => 1,
                'valor_de_custo'    => $item->prod->vUnCom,
                'NCM'               => $item->prod->NCM,
                'CSOSN'             => $item->prod->CSOSN,
                'CFOP_NFe'          => $item->prod->CFOP,
                'CFOP_NFCe'         => $item->prod->CFOP,
                'CFOP_Externo'      => $item->prod->CFOP,
                'id_categoria'      => 1,
                'id_fornecedor'     => $fornecedor['id_fornecedor'],
                'id_empresa'        => $this->id_empresa
            ]);
        }

        if(isset($acao_cad_fornecedor)) // Se foi cadastrado motra para o usuário se ele quer cadastrar esse fornecedor, se não ele remove e altera o id_funcionario
        {
            $data['link'] = $this->link;

            $data['titulo'] = [
                'modulo' => 'Editar Produto',
                'icone'  => 'fa fa-edit'
            ];

            $data['caminhos'] = [
                ['titulo' => "Dashboard", 'rota' => "/dashboard", 'active' => false],
                ['titulo' => "Produtos", 'rota' => "/produtos", 'active' => false],
                ['titulo' => "Editar", 'rota'   => "", 'active' => true]
            ];

            $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

            $data['fornecedor'] = $fornecedor;

            echo View('templates/header', $data);
            echo View('produtos/acao_add_fornecedor_por_xml');
            echo View('templates/footer');
        }
        else
        {
            return redirect()->to("/produtos/provisorio_add_produtos_por_xml");
        }
    }

    public function remove_fornecedor_cadastrado_por_xml($id_fornecedor)
    {
        // Pega todos os produtos da xml que foram cadastrados na tabela provisoria
        $produtos = $this->provisorio_add_produto_por_xml_model
                                                        ->where('id_empresa', $this->id_empresa)
                                                        ->findAll();

        $fornecedor = $this->fornecedor_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('nome_do_representante', 'GERAL')
                            ->first();

        // Caso não exita um fornecedor chamado de GERAL por algum motivo então cadastra ele 
        if(empty($fornecedor)):
            $this->fornecedor_model
                ->insert([
                    'nome_do_representante' => 'GERAL',
                    'nome_da_empresa'       => 'Não possui',
                    'cnpj'                  => 'Não possui',
                    'id_uf'                 => 17,
                    'id_municipio'          => 399,
                    'id_empresa'            => $this->id_empresa
                ]);
        endif;
        // ------------------ //

        // Altera todas os id_fornecedor para fornecedor GERAL
        foreach($produtos as $produto)
        {
            $this->provisorio_add_produto_por_xml_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto_provisorio', $produto['id_produto_provisorio'])
                ->set('id_fornecedor', $fornecedor['id_fornecedor'])
                ->update();
        }

        // Remove o fornecedor
        $this->fornecedor_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_fornecedor', $id_fornecedor)
            ->delete();

        return redirect()->to('/produtos/provisorio_add_produtos_por_xml');
    }

    public function provisorio_add_produtos_por_xml()
    {
        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Finalize as informações dos produtos',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Produtos", 'rota' => "/produtos", 'active' => false],
            ['titulo' => "Cad. por XML", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produtos'] = $this->provisorio_add_produto_por_xml_model
                                                                ->where('id_empresa', $this->id_empresa)
                                                                ->findAll();

        $data['categorias'] = $this->categoria_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        echo View('templates/header', $data);
        echo View('produtos/provisorio_add_produtos_por_xml');
        echo View('templates/footer');
    }

    public function altera_dados_do_produto_provisorio_cad_por_xml()
    {
        $dados = $this->request->getvar();

        // Converte de BRL para USD
        $dados['valor_de_custo'] = converteMoney($dados['valor_de_custo']);
        $dados['valor_de_venda'] = converteMoney($dados['valor_de_venda']);
        $dados['lucro']          = converteMoney($dados['lucro']);

        // Porcentagem
        if($dados['tipo_da_comissao'] == 1):
            $dados['valor_comissao'] = 0;
        else:
            $dados['porcentagem_comissao'] = 0;
        endif;
        
        $this->provisorio_add_produto_por_xml_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_provisorio', $dados['id_produto_provisorio'])
            ->set($dados)
            ->update();

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => "Dados do Produto atualizados com sucesso!"
                ]
            );

        return redirect()->to("/produtos/provisorio_add_produtos_por_xml/#prod_{$dados['id_produto_provisorio']}");
    }

    public function finalizar_e_cadastrar_produtos_por_xml()
    {
        // Pega todos os produtos da tabela provisorio_add_produto_por_xml_model e insere na tabela de produtos
        $produtos_provisorio = $this->provisorio_add_produto_por_xml_model
                                                                    ->where('id_empresa', $this->id_empresa)
                                                                    ->findAll();

        foreach($produtos_provisorio as $produto)
        {
            $this->produto_model
                ->insert($produto);
        }

        // Remove todos os registros da tabela provisorio_add_produto_por_xml_model
        $this->provisorio_add_produto_por_xml_model
            ->where('id_empresa', $this->id_empresa)
            ->delete();

        // Cria uma mensagem de alerta
        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Produtos do XML cadastrados com sucesso!'
                ]
            );

        // Redireciona para a página de produtos
        return redirect()->to('/produtos');
    }

    // -------------------------- REPOSIÇÃO DE PRODUTOS POR XML ------------------------------------ //

    public function reposicao_por_xml()
    {
        // Remove todos os registros da tabela só para ter certeza que ela estará vazia
        $this->provisorio_reposicao_produtos_por_xml_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->delete();

        $file = $this->request->getFile('xml');
        $xml  = simplexml_load_file($file);

        foreach($xml->NFe->infNFe->det as $item)
        {
            // Verifica se possui código de barras
            if($item->prod->cEAN != "SEM GTIN"):
                $produto = $this->produto_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('codigo_de_barras', $item->prod->cEAN)
                            ->first();
            else:
                $produto = [];
            endif;

            if(!empty($produto)) // Se o produto existir coloca o nome dele para repor
            {
                $this->provisorio_reposicao_produtos_por_xml_model
                    ->insert([
                        'nome'                    => $produto['nome'],
                        'quantidade_da_reposicao' => $item->prod->qCom,
                        'id_produto'              => $produto['id_produto'],
                        'id_empresa'              => $this->id_empresa
                    ]);
            }
            else // Caso não exista, o usuário terá que escolher o produto para repor
            {
                $this->provisorio_reposicao_produtos_por_xml_model
                    ->insert([
                        'nome'                    => $item->prod->xProd,
                        'quantidade_da_reposicao' => $item->prod->qCom,
                        'id_produto'              => 0, // Zero para informar que o produto não foi localizado
                        'id_empresa'              => $this->id_empresa
                    ]);
            }
        }

        return redirect()->to('/produtos/provisorio_reposicao_produtos_por_xml');
    }

    public function provisorio_reposicao_produtos_por_xml()
    {
        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Produtos da Reposição',
            'icone'  => 'fa fa-plus-circle'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Reposições", 'rota' => "/reposicoes", 'active' => false],
            ['titulo' => "Reposição por XML", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                                ->where('id_empresa', $this->id_empresa)
                                                ->where('id_login', $this->id_login)
                                                ->first();

        $data['produtos_do_estoque'] = $this->produto_model
                                                    ->where('id_empresa', $this->id_empresa)
                                                    ->findAll();

        $data['produtos'] = $this->provisorio_reposicao_produtos_por_xml_model
                                                                        ->where('id_empresa', $this->id_empresa)
                                                                        ->findAll();

        echo View('templates/header', $data);
        echo View('produtos/provisorio_reposicao_produtos_por_xml');
        echo View('templates/footer');
    }

    public function altera_dados_do_produto_provisorio_reposicao_por_xml()
    {
        $dados = $this->request
                        ->getvar();
        
        $this->provisorio_reposicao_produtos_por_xml_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_produto_provisorio', $dados['id_produto_provisorio'])
                                ->set($dados)
                                ->update();

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Quantidade alterada com sucesso!'
                ]
            );

        return redirect()->to("/produtos/provisorio_reposicao_produtos_por_xml/#prod_{$dados['id_produto_provisorio']}");
    }

    public function finalizar_e_repoe_produtos_por_xml()
    {
        $produtos_provisorio = $this->provisorio_reposicao_produtos_por_xml_model
                                                                            ->where('id_empresa', $this->id_empresa)
                                                                            ->findAll();

        foreach($produtos_provisorio as $prod_prov)
        {
            $id_produto = $prod_prov['id_produto']; // Id_produto

            $produto_do_estoque = $this->produto_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_produto', $id_produto)
                                        ->first(); // Pega o produto do estoque

            $quantidade = $produto_do_estoque['quantidade'] + $prod_prov['quantidade_da_reposicao']; // Soma a quantidade do produto do estoque com o da reposição

            $this->produto_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto', $id_produto)
                ->set('quantidade', $quantidade)
                ->update();

            $dados_da_reposicao = [
                'data'        => date('Y-m-d'),
                'hora'        => date('H:i:s'),
                'quantidade'  => $prod_prov['quantidade_da_reposicao'],
                'observacoes' => "Reposição do produto feita por XML",
                'id_produto'  => $id_produto,
                'id_empresa'  => $this->id_empresa
            ];

            $this->reposicao_model
                    ->insert($dados_da_reposicao);
        }

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Reposição cadastrada com sucesso!'
                ]
            );

        return redirect()->to("/reposicoes");
    }

    public function remove_produto_reposicao_por_xml($id_produto_provisorio)
    {
        $this->provisorio_reposicao_produtos_por_xml_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_provisorio', $id_produto_provisorio)
            ->delete();

        // --------------------- //
        // Verifica se todos os produtos da reposição com xml foram excluidos
        // se sim, cria um alerta e redireciona.
        $produtos_provisorio = $this->provisorio_reposicao_produtos_por_xml_model
                                                            ->where('id_empresa', $this->id_empresa)
                                                            ->find();

        if(empty($produtos_provisorio)):

            $this->session
                ->setFlashdata(
                    'alert',
                    [
                        'type' => 'success',
                        'title' => 'Todos os produtos da reposição com XML foi excluidos, faça o processo novamente!'
                    ]
                );

            return redirect()->to('/reposicoes');

        endif;
        // -------------------- //

        $this->session
            ->setFlashdata(
                'alert',
                [
                    'type' => 'success',
                    'title' => 'Produto excluido com sucesso!'
                ]
            );

        $id_aux = $id_produto_provisorio +1;

        return redirect()->to("/produtos/provisorio_reposicao_produtos_por_xml/#prod_$id_aux");
    }

    // --------------------------------------------------------------------------------------------- //

    public function delete($id_produto)
    {
        // Verifica se tem permissão de acesso
        if ($url = $this->permissao):
            return redirect()->to($url);
        endif;

        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $id_produto)
                        ->first();

        // Caso o produto tenha imagem, exclui ela.
        if($produto['arquivo'] != "") :
            unlink("assets/img/produtos/{$produto['arquivo']}");
        endif;

        $this->produto_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto', $id_produto)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto excluido com sucesso!',
            ]
        );

        return redirect()->to('/produtos');
    }

    // public function removerImagem($id_produto)
    // {
    //     $produto = $this->produto_model->where('id_produto', $id_produto)->first();
    //     $foto = $produto['arquivo'];

    //     $session = session();
    //     if(unlink("assets/img/produtos/$foto"))
    //     {
    //         $this->produto_model->set('arquivo', "")->where('id_produto', $id_produto)->update();

    //         $session->setFlashdata('alert', 'success_remove_image');
    //         return redirect()->to("/produtos/edit/$id_produto");
    //     }

    //     $session->setFlashdata('alert', 'error_remove_image');

    //     return redirect()->to("/produtos/edit/$id_produto");
    // }
}
