<?php

namespace App\Controllers;

use App\Models\ConfiguracaoDoPainelModel;
use App\Models\ControleDeAcessoModel;
use App\Models\ServicoModel;
use App\Models\EntregadorModel;
use App\Models\EntregaModel;
use App\Models\EmpresaModel;
use App\Models\LancamentoModel;
use App\Models\CaixaModel;
use App\Models\PagamentoFoodModel;
use App\Models\FormaDePagamentoModel;
use App\Models\ProvisorioProdutoDaMesaFoodModel;
use App\Models\ProvisorioProdutoFoodModel;
use App\Models\MesaModel;
use App\Models\ProdutoModel;
use CodeIgniter\Controller;

class Food extends Controller
{
    private $link = [
        'li' => '4.x',
        'item' => '4.0',
        'subItem' => '4.1'
    ];

    private $session;
    private $id_empresa;
    private $id_login;

    private $configuracao_do_painel_model;
    private $controle_de_acesso_model;
    private $servico_model;
    private $entregador_model;
    private $entrega_model;
    private $produto_model;
    private $mesa_model;
    private $provisorio_produto_food_model;
    private $provisorio_produto_da_mesa_food_model;
    private $forma_de_pagamento_model;
    private $pagamento_food_model;
    private $caixa_model;
    private $lancamento_model;
    private $empresa_model;

    private $permissao;

    public function __construct()
    {
        $this->helpers = ['app'];

        // Pega os ID da sessão
        $this->session = session();
        $this->id_empresa = $this->session->get('id_empresa');
        $this->id_login   = $this->session->get('id_login');

        $this->configuracao_do_painel_model          = new ConfiguracaoDoPainelModel();
        $this->controle_de_acesso_model              = new ControleDeAcessoModel();
        $this->servico_model                         = new ServicoModel();
        $this->entregador_model                      = new EntregadorModel();
        $this->entrega_model                         = new EntregaModel();
        $this->produto_model                         = new ProdutoModel();
        $this->mesa_model                            = new MesaModel();
        $this->provisorio_produto_food_model         = new ProvisorioProdutoFoodModel();
        $this->provisorio_produto_da_mesa_food_model = new ProvisorioProdutoDaMesaFoodModel();
        $this->forma_de_pagamento_model              = new FormaDePagamentoModel();
        $this->pagamento_food_model                  = new PagamentoFoodModel();
        $this->caixa_model                           = new CaixaModel();
        $this->lancamento_model                      = new LancamentoModel();
        $this->empresa_model                         = new EmpresaModel();
    }

    // ---------- NOVO PEDIDO ------------ //
    public function selecionarMesa()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('novo_pedido');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Selecionar Mesa',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Selecionar Mesa", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['mesas'] = $this->mesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('food/selecionar_mesa');
        echo view('templates/footer');
    }

    public function pedido($id_mesa)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('novo_pedido');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $data['link'] = $this->link;
                
        $data['titulo'] = [
            'modulo' => 'Novo Pedido',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Novo Pedido", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['produtos_do_estoque'] = $this->produto_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        $data['produtos_do_pedido']  = $this->provisorio_produto_food_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_mesa', $id_mesa)
                                            ->findAll();
        
        $data['id_mesa'] = $id_mesa;

        echo view('templates/header', $data);
        echo view('food/novo_pedido');
        echo view('templates/footer');
    }

    public function addProduto()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('novo_pedido');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();
        
        $produto = $this->produto_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_produto', $dados['id_produto'])
                        ->first();

        $this->provisorio_produto_food_model->insert([
            'nome'        => $produto['nome'],
            'quantidade'  => $dados['quantidade'],
            'valor'       => $produto['valor_de_venda'],
            'id_mesa'     => $dados['id_mesa'],
            'id_empresa'  => $this->id_empresa,
        ]);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto adicionado com sucesso!'
            ]
        );

        return redirect()->to("/food/pedido/{$dados['id_mesa']}");
    }

    public function deleteProduto($id_produto_provisorio, $id_mesa)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('novo_pedido');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->provisorio_produto_food_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_provisorio', $id_produto_provisorio)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Produto excluido com sucesso!'
            ]
        );

        return redirect()->to("/food/pedido/$id_mesa");
    }

    public function finalizarPedido()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('novo_pedido');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Pega todos os produtos do pedido
        $produtos_provisorio = $this->provisorio_produto_food_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->where('id_mesa', $dados['id_mesa'])
                                    ->findAll();

        // Percorre os produtos e insere nos produtos provisorios da mesa
        foreach($produtos_provisorio as $produto):
            
            $this->provisorio_produto_da_mesa_food_model->insert([
                'nome'        => $produto['nome'],
                'quantidade'  => $produto['quantidade'],
                'valor'       => $produto['valor'],
                'id_mesa'     => $produto['id_mesa'],
                'id_empresa'  => $this->id_empresa,
            ]);

        endforeach;

        // Altera o status e a quantidade de pessoas da mesa
        $this->mesa_model
            ->set('status', "Ocupada")
            ->set('qtd_de_pessoas', $dados['qtd_de_pessoas'])
            ->where('id_empresa', $this->id_empresa)
            ->where('id_mesa', $dados['id_mesa'])
            ->update();

        // Remove todos os produtos da tabela provisoria do pedido
        $this->provisorio_produto_food_model
            ->where('id_empresa', $this->id_empresa)
            ->delete();
            // ->emptyTable('provisorio_produtos_food');

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Pedido finalizado com sucesso!'
            ]
        );

        return redirect()->to("/food/selecionarMesa");
    }

    // --------- MESAS e MESA ---------- //
    public function mesas()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.2';
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Mesas',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Mesas", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['mesas'] = $this->mesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('food/mesas');
        echo view('templates/footer');
    }

    public function mesa($id_mesa)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.2';
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Mesa',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Mesa", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['mesa'] = $this->mesa_model
                            ->where('id_empresa', $this->id_empresa)
                            ->where('id_mesa', $id_mesa)
                            ->first();

        // $data['empresa'] = $this->config_empresa_model
        //                         ->where('id_config', 1)
        //                         ->first();

        $data['produtos_da_mesa'] = $this->provisorio_produto_da_mesa_food_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->where('id_mesa', $id_mesa)
                                        ->findAll();

        $data['pagamentos_da_mesa'] = $this->pagamento_food_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_mesa', $id_mesa)
                                            ->findAll();

        $data['formas_de_pagamento'] = $this->forma_de_pagamento_model
                                            // ->where('id_empresa', $this->id_empresa)
                                            ->findAll();

        $data['caixas'] = $this->caixa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('status', "Aberto")
                                ->findAll();

        $data['id_mesa'] = $id_mesa;

        // Soma o valor total dos produtos
        $data['valor_total'] = $this->provisorio_produto_da_mesa_food_model
                                    ->selectSum('valor')
                                    ->where('id_empresa', $this->id_empresa)
                                    ->first()['valor'];

        // Soma o valor total dos pagamentos
        $data['valor_pago'] = $this->pagamento_food_model
                                    ->selectSum('valor')
                                    ->where('id_empresa', $this->id_empresa)
                                    ->first()['valor'];

        echo view('templates/header', $data);
        echo view('food/mesa');
        echo view('templates/footer');
    }

    public function adicionarPagamento()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte BRL para USD
        $dados['valor'] = converteMoney($dados['valor']);
        
        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->pagamento_food_model
            ->where('id_empresa', $this->id_empresa)
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Pagamento adicionado com sucesso!'
            ]
        );

        return redirect()->to("/food/mesa/{$dados['id_mesa']}");
    }

    public function adicionarPagamentoDoProduto()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Converte BRL para USD
        $dados['valor'] = converteMoney($dados['valor']);
        
        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        // Insere o Pagamento
        $this->pagamento_food_model
            ->insert($dados);

        // Altera o status do Produto
        $this->provisorio_produto_da_mesa_food_model
            ->set('status', 'Pago')
            ->where('id_empresa', $this->id_empresa)
            ->where('id_produto_provisorio', $dados['id_produto_provisorio'])
            ->update();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Pagamento adicionado com sucesso!'
            ]
        );

        return redirect()->to("/food/mesa/{$dados['id_mesa']}");
    }

    public function deletePagamento($id_pagamento, $id_mesa)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->pagamento_food_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_pagamento', $id_pagamento)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Pagamento excluido com sucesso!'
            ]
        );

        return redirect()->to("/food/mesa/$id_mesa");
    }

    public function finalizarMesa()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('mesas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();
        
        $produtos_da_mesa = $this->provisorio_produto_da_mesa_food_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_mesa', $dados['id_mesa'])
                                ->findAll();

        $pagamentos = $this->pagamento_food_model
                        ->where('id_empresa', $this->id_empresa)
                        ->where('id_mesa', $dados['id_mesa'])
                        ->findAll();

        $valor_total = 0;
        // ---------------------------------------------------- PREPARA LANÇAMENTOS -------------------------------//
        $aux = "::: PRODUTOS :::\n";

        foreach($produtos_da_mesa as $produto):
            $aux .= "Nome: " . $produto['nome'] . " - Quantidade: " . $produto['quantidade'] . " - Valor: " . number_format($produto['valor'], 2, ',', '.') . "\n";
            $valor_total += ($produto['quantidade'] * $produto['valor']);

            // Apaga o produto
            $this->provisorio_produto_da_mesa_food_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_produto_provisorio', $produto['id_produto_provisorio'])
                ->delete();
        endforeach;

        $aux .= "\n\n::: PAGAMENTOS :::\n";

        foreach($pagamentos as $pagamento):
            $aux .= "Valor: " . number_format($pagamento['valor'], 2, ',', '.') . " - Forma de PGTO: " . $pagamento['forma_de_pagamento'] . " - Obs: " . $pagamento['observacoes'] . "\n";
            
            // Apaga o pagamento
            $this->pagamento_food_model
                ->where('id_empresa', $this->id_empresa)
                ->where('id_pagamento', $pagamento['id_pagamento'])
                ->delete();
        endforeach;

        $aux .= "\n\n\n---------------------- INFORMAÇÕES DA MESA ------------------------\n";
        
        $mesa = $this->mesa_model
                    ->where('id_empresa', $this->id_empresa)
                    ->where('id_mesa', $dados['id_mesa'])
                    ->first();


        $valor_total_convertido_para_moeda_real = number_format($valor_total, 2, ',', '.');
        
        $aux .= "Desc.: {$mesa['nome']}\n";
        $aux .= "Qtd. Pessoas na Mesa: {$mesa['qtd_de_pessoas']}\n";
        $aux .= "Valor Total.: {$valor_total_convertido_para_moeda_real}\n";
        $aux .= "Observações: {$dados['observacoes']}\n\n";
        $aux .= "Data Fechamento da Mesa: " . date('d/m/Y') . "\n";
        $aux .= "Hora Fechamento da Mesa: " . date('H:i:s') . "\n";
        // --------------------------------------------------------------------------------------------------------//

        $this->lancamento_model->insert([
            'descricao'   => "Venda Food",
            'valor'       => $valor_total,
            'data'        => date('Y-m-d'),
            'hora'        => date('H:i:s'),
            'observacoes' => $aux,
            'id_caixa'    => $dados['id_caixa'],
            'id_empresa'  => $this->id_empresa,
        ]);

        // // Apaga produtos da mesa
        // $this->provisorio_produto_da_mesa_food_model->where('id_mesa', $dados['id_mesa'])->emptyTable('provisorio_produtos_da_mesa_food');

        // // Apaga pagamentos da mesa
        // $this->pagamento_food_model->where('id_mesa', $dados['id_mesa'])->emptyTable('pagamentos_food');

        // Altera status da mesa
        $this->mesa_model
            ->set('status', "Aberta")
            ->where('id_empresa', $this->id_empresa)
            ->where('id_mesa', $dados['id_mesa'])
            ->update();

        // Prepara retorno
        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Mesa finalizada com sucesso!'
            ]
        );

        return redirect()->to('/food/mesas');
    }

    // --------------------- CONFIGS - Adicionar mesa ------------------------- //
    public function configs()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.4';
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Configs',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Configs", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['mesas'] = $this->mesa_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $data['servicos'] = $this->servico_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        $data['config_painel'] = $this->configuracao_do_painel_model
                                        ->where('id_empresa', $this->id_empresa)
                                        ->first();

        echo view('templates/header', $data);
        echo view('food/configs');
        echo view('templates/footer');
    }

    // MESAS
    
    public function storeMesa()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getvar();

        // Caso a ação seja editar
        if(isset($dados['id_mesa'])) :
            $this->mesa_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Mesa atualizada com sucesso!'
                ]
            );

            return redirect()->to('/food/configs');
        endif;

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        // Adiciona o status padrão de cadastro
        $dados['status'] = "Aberta";

        $this->mesa_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Mesa cadastrada com sucesso!'
            ]
        );

        return redirect()->to('/food/configs');
    }

    public function deleteMesa($id_mesa)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->mesa_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_mesa', $id_mesa)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Mesa excluida com sucesso!'
            ]
        );
            
        return redirect()->to('/food/configs');
    }

    // SERVICOS
    public function storeServico()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getVar();
        
        $session = session();

        // Verifica se a ação é editar
        if(isset($dados['id_servico'])) :
            $this->servico_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

                $this->session->setFlashdata(
                    'alert',
                    [
                        'type'  => 'success',
                        'title' => 'Serviço atualizado com sucesso!'
                    ]
                );

                return redirect()->to('/food/configs');
        endif;

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->servico_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Serviço cadastrado com sucesso!'
            ]
        );
        
        return redirect()->to('/food/configs');
    }

    public function deleteServico($id_servico)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('configs');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->servico_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_servico', $id_servico)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Serviço excluido com sucesso!'
            ]
        );

        return redirect()->to('/food/configs');            
    }

    // ---------- ENTREGAS ---------- //
    public function entregas()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.3';
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Entregas Abertas',
            'icone' => 'fa fa-database',
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregas Abertas", 'rota' => "", 'active' => true],
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entregas'] = $this->entrega_model
                                ->where('entregas.id_empresa', $this->id_empresa)
                                ->where('entregas.status', "Aberta")
                                ->select('entregas.id_entrega, entregas.status, entregas.nome, endereco, entregadores.nome AS nome_do_entregador, observacoes')
                                ->join('entregadores', 'entregas.id_entregador = entregadores.id_entregador')
                                ->findAll();

        echo view('templates/header', $data);
        echo view('food/entregas/index');
        echo view('templates/footer');
    }

    public function novaEntrega()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.3';
        $data['link'] = $this->link;
        
        $data['titulo'] = [
            'modulo' => 'Nova Entrega',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregas", 'rota'   => "/food/entregas", 'active' => false],
            ['titulo' => "Nova", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entregadores'] = $this->entregador_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $data['formas_de_pagamentos'] = $this->forma_de_pagamento_model
                                            ->findAll();

        $data['servicos'] = $this->servico_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('food/entregas/form');
        echo view('templates/footer');
    }

    public function editEntrega($id_entrega)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.3';
        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Editar Entrega',
            'icone'  => 'fa fa-user-plus'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregas", 'rota'   => "/food/entregas", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entrega'] = $this->entrega_model
                                ->where('id_empresa', $this->id_empresa)
                                ->where('id_entrega', $id_entrega)
                                ->first();

        $data['entregadores'] = $this->entregador_model
                                    ->where('id_empresa', $this->id_empresa)
                                    ->findAll();

        $data['formas_de_pagamentos'] = $this->forma_de_pagamento_model
                                            ->findAll();

        $data['servicos'] = $this->servico_model
                                ->where('id_empresa', $this->id_empresa)
                                ->findAll();

        echo view('templates/header', $data);
        echo view('food/entregas/form');
        echo view('templates/footer');
    }

    public function showEntrega($id_entrega)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $this->link['subItem'] = '4.3';
        $data['link'] = $this->link;

        $data['titulo'] = [
            'modulo' => 'Dados da Entrega',
            'icone'  => 'fa fa-list'
        ];

        $data['caminhos'] = [
            ['titulo' => "Início", 'rota' => "/inicio", 'active' => false],
            ['titulo' => "Entregas", 'rota'   => "/food/entregas", 'active' => false],
            ['titulo' => "Editar", 'rota'   => "", 'active' => true]
        ];

        $data['controle_de_acesso'] = $this->controle_de_acesso_model
                                            ->where('id_empresa', $this->id_empresa)
                                            ->where('id_login', $this->id_login)
                                            ->first();

        $data['entrega'] = $this->entrega_model
                                ->where('entregas.id_empresa', $this->id_empresa)
                                ->where('id_entrega', $id_entrega)
                                ->join('entregadores', 'entregas.id_entregador = entregadores.id_entregador')
                                ->select('
                                    entregas.status,
                                    entregas.nome AS nome,
                                    endereco,
                                    troco_para,
                                    forma_de_pagamento,
                                    servico,
                                    data,
                                    hora,
                                    celular_1,
                                    celular_2,
                                    fixo,
                                    entregadores.nome AS nome_do_entregador,
                                    observacoes
                                ')
                                ->first();

        echo view('templates/header', $data);
        echo view('food/entregas/show');
        echo view('templates/footer');
    }

    public function storeEntrega()
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;

        $dados = $this->request->getVar();

        // Converte BRL para USD
        $dados['troco_para'] = converteMoney($dados['troco_para']);

        // Remove Mascaras
        $dados['celular_1'] = removeMascara($dados['celular_1']);
        $dados['celular_2'] = removeMascara($dados['celular_2']);
        $dados['fixo']      = removeMascara($dados['fixo']);

        if(isset($dados['id_entrega'])) :
            $this->entrega_model
                ->where('id_empresa', $this->id_empresa)
                ->save($dados);

            $this->session->setFlashdata(
                'alert',
                [
                    'type'  => 'success',
                    'title' => 'Entrega atualizada com sucesso!'
                ]
            );

            return redirect()->to("/food/editEntrega/{$dados['id_entrega']}");
        endif;

        // Adiciona os IDs ao array
        $dados['id_empresa']  = $this->id_empresa;

        $this->entrega_model
            ->insert($dados);

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Entrega cadastrada com sucesso!'
            ]
        );
        
        return redirect()->to('/food/entregas');
    }

    public function deleteEntrega($id_entrega)
    {
        // Verifica se tem permissão de acesso
        $permissao = $this->controle_de_acesso_model->verificaPermissao('entregas');

        if ($url = $permissao):
            return redirect()->to($url);
        endif;
        
        $this->entrega_model
            ->where('id_empresa', $this->id_empresa)
            ->where('id_entrega', $id_entrega)
            ->delete();

        $this->session->setFlashdata(
            'alert',
            [
                'type'  => 'success',
                'title' => 'Entrega excluida com sucesso!'
            ]
        );
        
        return redirect()->to('/food/entregas');        
    }
}
