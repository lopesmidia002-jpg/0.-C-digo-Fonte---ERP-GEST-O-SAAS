<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/login/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/login/usuarios" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
                                    <?php foreach ($caminhos as $caminho) : ?>
                                        <?php if (!$caminho['active']) : ?>
                                            <li class="breadcrumb-item"><a href="<?= $caminho['rota'] ?>"><?= $caminho['titulo'] ?></a></li>
                                        <?php else : ?>
                                            <li class="breadcrumb-item active"><?= $caminho['titulo'] ?></li>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                </ol>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Usuário</label>
                                    <input type="text" class="form-control" id="usuario" name="usuario" onfocusout="verificaNomeDeUsuario()" value="<?= (isset($usuario)) ? $usuario['usuario'] : "" ?>" autofocus required>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Senha</label>
                                    <input type="password" class="form-control" id="senha" name="senha" value="<?= (isset($usuario)) ? $usuario['senha'] : "" ?>" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Permissões no Sistema</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">								
                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">VENDAS</label>
                                <input type="checkbox" id="modulo_vendas" name="modulo_vendas" checked onclick="desabilitaModuloVendas()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Venda Rápida</label>
                                        <select class="form-control select2" id="venda_rapida" name="venda_rapida" style="width: 100%">
                                            <?php if(isset($controle_de_acesso_do_usuario_selecionado)): ?>
                                                <?php if ($controle_de_acesso_do_usuario_selecionado['venda_rapida'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>
                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Pesq. Produto</label>
                                        <select class="form-control select2" id="pesquisa_produto" name="pesquisa_produto" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['pesquisa_produto'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Hist. de Vendas</label>
                                        <select class="form-control select2" id="historico_de_vendas" name="historico_de_vendas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['historico_de_vendas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Orçamentos</label>
                                        <select class="form-control select2" id="orcamentos" name="orcamentos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['orcamentos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Pedidos</label>
                                        <select class="form-control select2" id="pedidos" name="pedidos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['pedidos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">ORDEM DE SERVIÇO</label>
                                <input type="checkbox" id="modulo_ordem_de_servico" name="modulo_ordem_de_servico" checked onclick="desabilitaModuloOrdemDeServico()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Ordem de Serviço</label>
                                        <select class="form-control select2" id="ordem_de_servico" name="ordem_de_servico" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['ordem_de_servico'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">FOOD</label>
                                <input type="checkbox" id="modulo_food" name="modulo_food" checked onclick="desabilitaModuloFood()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Novo Pedido</label>
                                        <select class="form-control select2" id="novo_pedido" name="novo_pedido" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['novo_pedido'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Mesas</label>
                                        <select class="form-control select2" id="mesas" name="mesas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['mesas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Entregas</label>
                                        <select class="form-control select2" id="entregas" name="entregas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['entregas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Abrir Painel</label>
                                        <select class="form-control select2" id="abrir_painel" name="abrir_painel" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['abrir_painel'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Transmitir no Painel</label>
                                        <select class="form-control select2" id="transmitir_no_painel" name="transmitir_no_painel" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['transmitir_no_painel'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Configs</label>
                                        <select class="form-control select2" id="configs" name="configs" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['configs'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">CONTROLE GERAL</label>
                                <input type="checkbox" id="modulo_controle_geral" name="modulo_controle_geral" checked onclick="DesabilitaModuloControleGeral()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Clientes</label>
                                        <select class="form-control select2" id="clientes" name="clientes" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['clientes'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Fornecedores</label>
                                        <select class="form-control select2" id="fornecedores" name="fornecedores" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['fornecedores'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Funcionários</label>
                                        <select class="form-control select2" id="funcionarios" name="funcionarios" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['funcionarios'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Vendedores</label>
                                        <select class="form-control select2" id="vendedores" name="vendedores" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['vendedores'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Entregadores</label>
                                        <select class="form-control select2" id="entregadores" name="entregadores" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['entregadores'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Técnicos</label>
                                        <select class="form-control select2" id="tecnicos" name="tecnicos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['tecnicos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Serviço/Mão de Obra</label>
                                        <select class="form-control select2" id="servico_mao_de_obra" name="servico_mao_de_obra" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['servico_mao_de_obra'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">ESTOQUE</label>
                                <input type="checkbox" id="modulo_estoque" name="modulo_estoque" checked onclick="DesabilitaModuloEstoque()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Produtos</label>
                                        <select class="form-control select2" id="produtos" name="produtos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['produtos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Reposições</label>
                                        <select class="form-control select2" id="reposicoes" name="reposicoes" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['reposicoes'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Saída de Mercadorias</label>
                                        <select class="form-control select2" id="saida_de_mercadorias" name="saida_de_mercadorias" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['saida_de_mercadorias'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Inventário do Estoque</label>
                                        <select class="form-control select2" id="inventario_do_estoque" name="inventario_do_estoque" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['inventario_do_estoque'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Categorias do Produto</label>
                                        <select class="form-control select2" id="categoria_dos_produtos" name="categoria_dos_produtos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['categoria_dos_produtos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">FINANCEIRO</label>
                                <input type="checkbox" id="modulo_financeiro" name="modulo_financeiro" checked onclick="DesabilitaModuloFinanceiro()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Caixas</label>
                                        <select class="form-control select2" id="caixas" name="caixas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['caixas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Lançamentos</label>
                                        <select class="form-control select2" id="lancamentos" name="lancamentos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['lancamentos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Retiradas do Caixa</label>
                                        <select class="form-control select2" id="retiradas_do_caixa" name="retiradas_do_caixa" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['retiradas_do_caixa'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Despesas</label>
                                        <select class="form-control select2" id="despesas" name="despesas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['despesas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Contas à Pagar</label>
                                        <select class="form-control select2" id="contas_a_pagar" name="contas_a_pagar" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['contas_a_pagar'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Contas á Receber</label>
                                        <select class="form-control select2" id="contas_a_receber" name="contas_a_receber" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['contas_a_receber'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Relatório DRE</label>
                                        <select class="form-control select2" id="relatorio_dre" name="relatorio_dre" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['relatorio_dre'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">CONTROLE FISCAL</label>
                                <input type="checkbox" id="modulo_controle_fiscal" name="modulo_controle_fiscal" checked onclick="DesabilitaModuloControleFiscal()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">NFe</label>
                                        <select class="form-control select2" id="nfe" name="nfe" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['nfe'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">NFCe</label>
                                        <select class="form-control select2" id="nfce" name="nfce" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['nfce'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">RELATÓRIOS</label>
                                <input type="checkbox" id="modulo_relatorios" name="modulo_relatorios" checked onclick="DesabilitaModuloRelatorios()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <h6 style="text-align: center"> >> <b>VENDAS</b> << </h6>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Histórico Completo</label>
                                        <select class="form-control select2" id="vendas_historico_completo" name="vendas_historico_completo" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['vendas_historico_completo'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Por Cliente</label>
                                        <select class="form-control select2" id="vendas_por_cliente" name="vendas_por_cliente" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['vendas_por_cliente'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Por Vendedor</label>
                                        <select class="form-control select2" id="vendas_por_vendedor" name="vendas_por_vendedor" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['vendas_por_vendedor'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <h6 style="text-align: center"> >> <b>ESTOQUE</b> << </h6>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Produtos</label>
                                        <select class="form-control select2" id="estoque_produtos" name="estoque_produtos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['estoque_produtos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Estoque Mínimo</label>
                                        <select class="form-control select2" id="estoque_minimo" name="estoque_minimo" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['estoque_minimo'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Inventário do Estoque</label>
                                        <select class="form-control select2" id="estoque_inventario" name="estoque_inventario" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['estoque_inventario'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Validade do Produto</label>
                                        <select class="form-control select2" id="estoque_validade_do_produto" name="estoque_validade_do_produto" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['estoque_validade_do_produto'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <h6 style="text-align: center"> >> <b>FINANCEIRO</b> << </h6>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Mov. Entradas e Saídas</label>
                                        <select class="form-control select2" id="financeiro_movimentacao_de_entradas_e_saidas" name="financeiro_movimentacao_de_entradas_e_saidas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_movimentacao_de_entradas_e_saidas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Faturamento Diário</label>
                                        <select class="form-control select2" id="financeiro_faturamento_diario" name="financeiro_faturamento_diario" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_faturamento_diario'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Faturamento Detalhado</label>
                                        <select class="form-control select2" id="financeiro_faturamento_detalhado" name="financeiro_faturamento_detalhado" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_faturamento_detalhado'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Lançamentos</label>
                                        <select class="form-control select2" id="financeiro_lancamentos" name="financeiro_lancamentos" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_lancamentos'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Retiradas do Caixa</label>
                                        <select class="form-control select2" id="financeiro_retiradas_do_caixa" name="financeiro_retiradas_do_caixa" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_retiradas_do_caixa'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Despesas</label>
                                        <select class="form-control select2" id="financeiro_despesas" name="financeiro_despesas" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_despesas'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Contas a Pagar</label>
                                        <select class="form-control select2" id="financeiro_contas_a_pagar" name="financeiro_contas_a_pagar" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_contas_a_pagar'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Contas a Receber</label>
                                        <select class="form-control select2" id="financeiro_contas_a_receber" name="financeiro_contas_a_receber" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_contas_a_receber'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">DRE</label>
                                        <select class="form-control select2" id="financeiro_dre" name="financeiro_dre" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['financeiro_dre'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <h6 style="text-align: center"> >> <b>GERAL</b> << </h6>
                                        <hr>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Clientes</label>
                                        <select class="form-control select2" id="geral_clientes" name="geral_clientes" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['geral_clientes'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Fornecedores</label>
                                        <select class="form-control select2" id="geral_fornecedores" name="geral_fornecedores" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['geral_fornecedores'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Funcionários</label>
                                        <select class="form-control select2" id="geral_funcionarios" name="geral_funcionarios" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['geral_funcionarios'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Vendedores</label>
                                        <select class="form-control select2" id="geral_vendedores" name="geral_vendedores" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['geral_vendedores'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">AGENDA</label>
                                <input type="checkbox" id="modulo_agenda" name="modulo_agenda" checked onclick="DesabilitaModuloAgenda()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Agenda</label>
                                        <select class="form-control select2" id="agenda" name="agenda" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['agenda'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-3" style="border: 1px solid lightgrey;">
                                <label style="margin-top: 10px">CONFIGURAÇÕES</label>
                                <input type="checkbox" id="modulo_configuracoes" name="modulo_configuracoes" checked onclick="DesabilitaModuloConfiguracoes()">

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Usuários</label>
                                        <select class="form-control select2" id="usuarios" name="usuarios" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['usuarios'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Config. da Conta</label>
                                        <select class="form-control select2" id="config_da_conta" name="config_da_conta" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['config_da_conta'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Config. da Empresa</label>
                                        <select class="form-control select2" id="config_da_empresa" name="config_da_empresa" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['config_da_empresa'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="">Config. NFe e NFCe</label>
                                        <select class="form-control select2" id="config_nfe_e_nfce" name="config_nfe_e_nfce" style="width: 100%">
                                            <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                <?php if ($controle_de_acesso_do_usuario_selecionado['config_nfe_e_nfce'] == 1): ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php else: ?>
                                                    <option value="1">Sim</option>
                                                    <option value="0" selected>Não</option>
                                                <?php endif;?>

                                            <?php else: ?>
                                                <option value="1" selected>Sim</option>
                                                <option value="0">Não</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>

                            </div>

                            <div class="col-lg-6" style="border: 1px solid lightgrey; background: lightgrey">
                                <label style="margin-top: 10px">RESUMO DA DASHBOARD/INÍCIO</label>
                                <input type="checkbox" id="resumo_dashboard_inicio" name="resumo_dashboard_inicio" checked onclick="DesabilitaResumoDashbaordInicio()">
                                
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget Clientes</label>
                                            <select class="form-control select2" id="widget_clientes" name="widget_clientes" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_clientes'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget Produtos</label>
                                            <select class="form-control select2" id="widget_produtos" name="widget_produtos" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_produtos'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget Vendas</label>
                                            <select class="form-control select2" id="widget_vendas" name="widget_vendas" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_vendas'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget Lançamentos</label>
                                            <select class="form-control select2" id="widget_lancamentos" name="widget_lancamentos" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_lancamentos'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget Faturamento</label>
                                            <select class="form-control select2" id="widget_faturamento" name="widget_faturamento" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_faturamento'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Widget O.S.</label>
                                            <select class="form-control select2" id="widget_os" name="widget_os" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['widget_os'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Gráfico Faturamento Linha</label>
                                            <select class="form-control select2" id="grafico_faturamento_linha" name="grafico_faturamento_linha" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['grafico_faturamento_linha'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Gráfico Faturamento Barra</label>
                                            <select class="form-control select2" id="grafico_faturamento_barras" name="grafico_faturamento_barras" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['grafico_faturamento_barras'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Tabela Contas a Pagar</label>
                                            <select class="form-control select2" id="tabela_contas_a_pagar" name="tabela_contas_a_pagar" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['tabela_contas_a_pagar'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Tabela Contas a Receber</label>
                                            <select class="form-control select2" id="tabela_contas_a_receber" name="tabela_contas_a_receber" style="width: 100%">
                                                <?php if (isset($controle_de_acesso_do_usuario_selecionado)): ?>

                                                    <?php if ($controle_de_acesso_do_usuario_selecionado['tabela_contas_a_receber'] == 1): ?>
                                                        <option value="1" selected>Sim</option>
                                                        <option value="0">Não</option>
                                                    <?php else: ?>
                                                        <option value="1">Sim</option>
                                                        <option value="0" selected>Não</option>
                                                    <?php endif;?>

                                                <?php else: ?>
                                                    <option value="1" selected>Sim</option>
                                                    <option value="0">Não</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <?php if (isset($usuario) && isset($controle_de_acesso_do_usuario_selecionado)): ?>
                        <input type="hidden" name="id_login" value="<?=$usuario['id_login']?>">
                        <input type="hidden" name="id_controle_de_acesso" value="<?=$controle_de_acesso_do_usuario_selecionado['id_controle_de_acesso']?>">
                    <?php endif;?>

                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($usuario)) ? "Atualizar" : "Cadastrar" ?></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card -->

            </form>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    function desabilitaModuloVendas()
    {
        if(document.getElementById('modulo_vendas').checked)
        {
            document.getElementById('venda_rapida').disabled            = false;
            document.getElementById('pesquisa_produto').disabled        = false;
            document.getElementById('historico_de_vendas').disabled     = false;
            document.getElementById('orcamentos').disabled              = false;
            document.getElementById('pedidos').disabled                 = false;
            
        }
        else
        {
            document.getElementById('venda_rapida').disabled            = true;
            document.getElementById('pesquisa_produto').disabled        = true;
            document.getElementById('historico_de_vendas').disabled     = true;
            document.getElementById('orcamentos').disabled              = true;
            document.getElementById('pedidos').disabled                 = true;
        }
    }

    function desabilitaModuloOrdemDeServico()
    {
        if(document.getElementById('modulo_ordem_de_servico').checked)
        {
            document.getElementById('ordem_de_servico').disabled = false;
            
        }
        else
        {
            document.getElementById('ordem_de_servico').disabled = true;
        }
    }

    function desabilitaModuloFood()
    {
        if(document.getElementById('modulo_food').checked)
        {
            document.getElementById('novo_pedido').disabled          = false;
            document.getElementById('mesas').disabled                = false;
            document.getElementById('entregas').disabled             = false;
            document.getElementById('abrir_painel').disabled         = false;
            document.getElementById('transmitir_no_painel').disabled = false;
            document.getElementById('configs').disabled              = false;
            
        }
        else
        {
            document.getElementById('novo_pedido').disabled          = true;
            document.getElementById('mesas').disabled                = true;
            document.getElementById('entregas').disabled             = true;
            document.getElementById('abrir_painel').disabled         = true;
            document.getElementById('transmitir_no_painel').disabled = true;
            document.getElementById('configs').disabled              = true;
        }
    }

    function DesabilitaModuloControleGeral()
    {
        if(document.getElementById('modulo_controle_geral').checked)
        {
            document.getElementById('clientes').disabled            = false;
            document.getElementById('fornecedores').disabled        = false;
            document.getElementById('funcionarios').disabled        = false;
            document.getElementById('vendedores').disabled          = false;
            document.getElementById('entregadores').disabled        = false;
            document.getElementById('tecnicos').disabled            = false;
            document.getElementById('servico_mao_de_obra').disabled = false;
            
        }
        else
        {
            document.getElementById('clientes').disabled            = true;
            document.getElementById('fornecedores').disabled        = true;
            document.getElementById('funcionarios').disabled        = true;
            document.getElementById('vendedores').disabled          = true;
            document.getElementById('entregadores').disabled        = true;
            document.getElementById('tecnicos').disabled            = true;
            document.getElementById('servico_mao_de_obra').disabled = true;
        }
    }

    function DesabilitaModuloEstoque()
    {
        if(document.getElementById('modulo_estoque').checked)
        {
            document.getElementById('produtos').disabled               = false;
            document.getElementById('reposicoes').disabled             = false;
            document.getElementById('saida_de_mercadorias').disabled   = false;
            document.getElementById('inventario_do_estoque').disabled  = false;
            document.getElementById('categoria_dos_produtos').disabled = false;
            
        }
        else
        {
            document.getElementById('produtos').disabled               = true;
            document.getElementById('reposicoes').disabled             = true;
            document.getElementById('saida_de_mercadorias').disabled   = true;
            document.getElementById('inventario_do_estoque').disabled  = true;
            document.getElementById('categoria_dos_produtos').disabled = true;
        }
    }

    function DesabilitaModuloFinanceiro()
    {
        if(document.getElementById('modulo_financeiro').checked)
        {
            document.getElementById('caixas').disabled             = false;
            document.getElementById('lancamentos').disabled        = false;
            document.getElementById('retiradas_do_caixa').disabled = false;
            document.getElementById('despesas').disabled           = false;
            document.getElementById('contas_a_pagar').disabled     = false;
            document.getElementById('contas_a_receber').disabled   = false;
            document.getElementById('relatorio_dre').disabled      = false;
            
        }
        else
        {
            document.getElementById('caixas').disabled             = true;
            document.getElementById('lancamentos').disabled        = true;
            document.getElementById('retiradas_do_caixa').disabled = true;
            document.getElementById('despesas').disabled           = true;
            document.getElementById('contas_a_pagar').disabled     = true;
            document.getElementById('contas_a_receber').disabled   = true;
            document.getElementById('relatorio_dre').disabled      = true;
        }
    }

    function DesabilitaModuloControleFiscal()
    {
        if(document.getElementById('modulo_controle_fiscal').checked)
        {
            document.getElementById('nfe').disabled  = false;
            document.getElementById('nfce').disabled = false;
            
        }
        else
        {
            document.getElementById('nfe').disabled  = true;
            document.getElementById('nfce').disabled = true;
        }
    }

    function DesabilitaModuloRelatorios()
    {
        if(document.getElementById('modulo_relatorios').checked)
        {
            document.getElementById('vendas_historico_completo').disabled                     = false;
            document.getElementById('vendas_por_cliente').disabled                            = false;
            document.getElementById('vendas_por_vendedor').disabled                           = false;
            document.getElementById('estoque_produtos').disabled                              = false;
            document.getElementById('estoque_minimo').disabled                                = false;
            document.getElementById('estoque_inventario').disabled                            = false;
            document.getElementById('estoque_validade_do_produto').disabled                   = false;
            document.getElementById('financeiro_movimentacao_de_entradas_e_saidas').disabled  = false;
            document.getElementById('financeiro_faturamento_diario').disabled                 = false;
            document.getElementById('financeiro_faturamento_detalhado').disabled              = false;
            document.getElementById('financeiro_lancamentos').disabled                        = false;
            document.getElementById('financeiro_retiradas_do_caixa').disabled                 = false;
            document.getElementById('financeiro_despesas').disabled                           = false;
            document.getElementById('financeiro_contas_a_pagar').disabled                     = false;
            document.getElementById('financeiro_contas_a_receber').disabled                   = false;
            document.getElementById('financeiro_dre').disabled                                = false;
            document.getElementById('geral_clientes').disabled                                = false;
            document.getElementById('geral_fornecedores').disabled                            = false;
            document.getElementById('geral_funcionarios').disabled                            = false;
            document.getElementById('geral_vendedores').disabled                              = false;
            
        }
        else
        {
            document.getElementById('vendas_historico_completo').disabled                     = true;
            document.getElementById('vendas_por_cliente').disabled                            = true;
            document.getElementById('vendas_por_vendedor').disabled                           = true;
            document.getElementById('estoque_produtos').disabled                              = true;
            document.getElementById('estoque_minimo').disabled                                = true;
            document.getElementById('estoque_inventario').disabled                            = true;
            document.getElementById('estoque_validade_do_produto').disabled                   = true;
            document.getElementById('financeiro_movimentacao_de_entradas_e_saidas').disabled  = true;
            document.getElementById('financeiro_faturamento_diario').disabled                 = true;
            document.getElementById('financeiro_faturamento_detalhado').disabled              = true;
            document.getElementById('financeiro_lancamentos').disabled                        = true;
            document.getElementById('financeiro_retiradas_do_caixa').disabled                 = true;
            document.getElementById('financeiro_despesas').disabled                           = true;
            document.getElementById('financeiro_contas_a_pagar').disabled                     = true;
            document.getElementById('financeiro_contas_a_receber').disabled                   = true;
            document.getElementById('financeiro_dre').disabled                                = true;
            document.getElementById('geral_clientes').disabled                                = true;
            document.getElementById('geral_fornecedores').disabled                            = true;
            document.getElementById('geral_funcionarios').disabled                            = true;
            document.getElementById('geral_vendedores').disabled                              = true;
        }
    }

    function DesabilitaModuloAgenda()
    {
        if(document.getElementById('modulo_agenda').checked)
        {
            document.getElementById('agenda').disabled  = false;
            
        }
        else
        {
            document.getElementById('agenda').disabled  = true;
        }
    }

    function DesabilitaModuloConfiguracoes()
    {
        if(document.getElementById('modulo_configuracoes').checked)
        {
            document.getElementById('usuarios').disabled          = false;
            document.getElementById('config_da_conta').disabled   = false;
            document.getElementById('config_da_empresa').disabled = false;
            document.getElementById('config_nfe_e_nfce').disabled = false;
            
        }
        else
        {
            document.getElementById('usuarios').disabled          = true;
            document.getElementById('config_da_conta').disabled   = true;
            document.getElementById('config_da_empresa').disabled = true;
            document.getElementById('config_nfe_e_nfce').disabled = true;
        }
    }

    function DesabilitaResumoDashbaordInicio()
    {
        if(document.getElementById('resumo_dashboard_inicio').checked)
        {
            document.getElementById('widget_clientes').disabled            = false;
            document.getElementById('widget_produtos').disabled            = false;
            document.getElementById('widget_vendas').disabled              = false;
            document.getElementById('widget_lancamentos').disabled         = false;
            document.getElementById('widget_faturamento').disabled         = false;
            document.getElementById('widget_os').disabled                  = false;
            document.getElementById('grafico_faturamento_linha').disabled  = false;
            document.getElementById('grafico_faturamento_barras').disabled = false;
            document.getElementById('tabela_contas_a_pagar').disabled      = false;
            document.getElementById('tabela_contas_a_receber').disabled    = false;
            
        }
        else
        {
            document.getElementById('widget_clientes').disabled            = true;
            document.getElementById('widget_produtos').disabled            = true;
            document.getElementById('widget_vendas').disabled              = true;
            document.getElementById('widget_lancamentos').disabled         = true;
            document.getElementById('widget_faturamento').disabled         = true;
            document.getElementById('widget_os').disabled                  = true;
            document.getElementById('grafico_faturamento_linha').disabled  = true;
            document.getElementById('grafico_faturamento_barras').disabled = true;
            document.getElementById('tabela_contas_a_pagar').disabled      = true;
            document.getElementById('tabela_contas_a_receber').disabled    = true;
        }
    }

    <?php if(isset($controle_de_acesso_do_usuario_selecionado)): ?>
        
        // MODULO VENDAS
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['venda_rapida'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['pdv'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['pesquisa_produto'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['historico_de_vendas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['orcamentos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['pedidos'] == 0
        ): ?>
            document.getElementById('modulo_vendas').checked = false;
            desabilitaModuloVendas();
        <?php endif; ?>

        // MODULO ORDEM DE SERVIÇO
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['ordem_de_servico'] == 0
        ): ?>
            document.getElementById('modulo_ordem_de_servico').checked = false;
            desabilitaModuloOrdemDeServico();
        <?php endif; ?>

        // MODULO FOOD
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['novo_pedido'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['mesas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['entregas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['abrir_painel'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['transmitir_no_painel'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['configs'] == 0
        ): ?>
            document.getElementById('modulo_food').checked = false;
            desabilitaModuloFood();
        <?php endif; ?>

        // MODULO CONTROLE GERAL
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['clientes'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['fornecedores'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['funcionarios'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['vendedores'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['entregadores'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['tecnicos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['servico_mao_de_obra'] == 0
        ): ?>
            document.getElementById('modulo_controle_geral').checked = false;
            DesabilitaModuloControleGeral();
        <?php endif; ?>

        // MODULO ESTOQUE
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['produtos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['reposicoes'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['saida_de_mercadorias'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['inventario_do_estoque'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['categoria_dos_produtos'] == 0
        ): ?>
            document.getElementById('modulo_estoque').checked = false;
            DesabilitaModuloEstoque();
        <?php endif; ?>

        // MODULO FINANCEIRO
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['caixas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['lancamentos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['retiradas_do_caixa'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['despesas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['contas_a_pagar'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['contas_a_receber'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['relatorio_dre'] == 0
        ): ?>
            document.getElementById('modulo_financeiro').checked = false;
            DesabilitaModuloFinanceiro();
        <?php endif; ?>

        // MODULO CONTROLE FISCAL
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['nfe'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['nfce'] == 0
        ): ?>
            document.getElementById('modulo_controle_fiscal').checked = false;
            DesabilitaModuloControleFiscal();
        <?php endif; ?>

        // MODULO RELATÓRIOS
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['vendas_historico_completo'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['vendas_por_cliente'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['vendas_por_vendedor'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['estoque_produtos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['estoque_minimo'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['estoque_inventario'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['estoque_validade_do_produto'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_movimentacao_de_entradas_e_saidas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_faturamento_diario'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_faturamento_detalhado'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_lancamentos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_retiradas_do_caixa'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_despesas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_contas_a_pagar'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_contas_a_receber'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['financeiro_dre'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['geral_clientes'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['geral_fornecedores'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['geral_funcionarios'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['geral_vendedores'] == 0
        ): ?>
            document.getElementById('modulo_relatorios').checked = false;
            DesabilitaModuloRelatorios();
        <?php endif; ?>

        // MODULO AGENDA
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['agenda'] == 0
        ): ?>
            document.getElementById('modulo_agenda').checked = false;
            DesabilitaModuloAgenda();
        <?php endif; ?>

        // MODULO CONFIGURAÇÕES
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['usuarios'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['config_da_conta'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['config_da_empresa'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['config_nfe_e_nfce'] == 0
        ): ?>
            document.getElementById('modulo_configuracoes').checked = false;
            DesabilitaModuloConfiguracoes();
        <?php endif; ?>

        // RESUMO DASHBOARD/INICIO
        <?php if(
            $controle_de_acesso_do_usuario_selecionado['widget_clientes'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['widget_produtos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['widget_vendas'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['widget_lancamentos'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['widget_faturamento'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['widget_os'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['grafico_faturamento_linha'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['grafico_faturamento_barras'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['tabela_contas_a_pagar'] == 0 &&
            $controle_de_acesso_do_usuario_selecionado['tabela_contas_a_receber'] == 0
        ): ?>
            document.getElementById('modulo_resumo_dashboard_inicio').checked = false;
            DesabilitaModuloConfiguracoes();
        <?php endif; ?>
    <?php endif; ?>

    function verificaNomeDeUsuario()
	{
		var doc, usuario;

		doc = document.getElementById('usuario');
		usuario = doc.value;
		
		// Regra de validação para form create/edit
		if(usuario != "<?= (isset($usuario)) ? $usuario['usuario'] : '' ?>")
		{
			$.post(
				"/login/verificaNomeDeUsuario", {
					usuario: usuario
				},
				function(data, status) {
					if (status == "success") {
						if(data == "1")
						{
							alert('Esse usuário não pode ser cadastrado. Por favor, escolha outro.');
							doc.value = "";
							doc.focus();
						}
					}
				}
			);
		}

	}
</script>