<!-- Modal Adicionar Pagamento -->
<div class="modal fade" id="modal-adicionar-pagamento">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Adicionar Pagamento</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/adicionarPagamento" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Valor</label>
                                <input type="text" class="form-control money" id="valor_pgto" name="valor" required>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Forma de Pagamento</label>
                                    <select class="select2" name="forma_de_pagamento" style="width: 100%" required>
                                        <?php foreach($formas_de_pagamento as $forma): ?>
                                            <option value="<?= $forma['nome'] ?>"><?= $forma['nome'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Obs</label>
                                <input type="text" class="form-control" name="observacoes">
                            </div>
                        </div>

                        <input type="hidden" name="id_mesa" value="<?= $id_mesa ?>">
                                            
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Continuar</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Adicionar Pagamento do Produto -->
<div class="modal fade" id="modal-adiciona-pagamento-do-produto">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Adicionar Pagamento do Produto</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/adicionarPagamentoDoProduto" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Valor</label>
                                <input type="text" class="form-control money" id="valor_do_produto" name="valor" required>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Forma de Pagamento</label>
                                <select class="select2" name="forma_de_pagamento" style="width: 100%" required>
                                    <?php foreach($formas_de_pagamento as $forma): ?>
                                        <option value="<?= $forma['nome'] ?>"><?= $forma['nome'] ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Obs</label>
                                <input type="text" class="form-control" id="obs_do_produto" name="observacoes">
                            </div>
                        </div>

                        <input type="hidden" name="id_mesa" value="<?= $id_mesa ?>">
                        <input type="hidden" id="id_produto_provisorio" name="id_produto_provisorio" value="">
                                            
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Continuar</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Finalizar Mesa -->
<div class="modal fade" id="modal-finalizar-mesa">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Finalizar Mesa</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/finalizarMesa" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Caixa</label>
                                    <select class="select2" name="id_caixa" style="width: 100%" required>
                                        <?php foreach($caixas as $caixa): ?>
                                            <option value="<?= $caixa['id_caixa'] ?>">Data Abert.: <?= date('d/m/Y', strtotime($caixa['data_de_abertura'])) ?> Hora Abert.: <?= $caixa['hora_de_abertura'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Obs</label>
                                <input type="text" class="form-control" name="observacoes">
                            </div>
                        </div>

                        <input type="hidden" name="id_mesa" value="<?= $id_mesa ?>">
                                            
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Continuar</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal CALCULADORA -->
<div class="modal fade" id="modal-calculadora">
    <div class="modal-dialog modal-md" style="width: 300px"> <!-- 300px = 80mm -->
        <div class="modal-content">
            <!-- <div class="modal-header no-print">
                <h4 class="modal-title">Comanda da Mesa <button type="button" class="btn btn-info style-action" onclick="print()"><i class="fas fa-print"></i></button></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div> -->
            <div class="modal-body">
                <div id="calculadora">
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <input type="text" id="tela" class="form-control" maxlength="30" readonly="readonly" />
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px">
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-warning form-control" id="apagarAnterior" value="<-" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-danger form-control" id="limparTela" value="C" />
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px">
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num7" value="7" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num8" value="8" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num9" value="9" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="divisao" value="/" />
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px">
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num4" value="4" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num5" value="5" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num6" value="6" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="multiplicacao" value="*" />
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px">
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num1" value="1" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num2" value="2" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num3" value="3" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="subtracao" value="-" />
                        </div>
                    </div>

                    <div class="row" style="margin-top: 15px">
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="num0" value="0" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="ponto" value="." />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="resultado" value="=" />
                        </div>
                        <div class="col-lg-3">
                            <input type="button" class="btn btn-info form-control" id="soma" value="+" />
                        </div>
                    </div>

				</div>

            </div>
            <div class="modal-footer justify-content-between no-print">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <!-- <button type="button" class="btn btn-info" onclick="print()"><i class="fas fa-print"></i> Imprimir Comanda</button> -->
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal COMANDA -->
<div class="modal fade" id="modal-cupom-nao-fiscal">
    <div class="modal-dialog modal-md" style="width: 300px"> <!-- 300px = 80mm -->
        <div class="modal-content">
            <div class="modal-header no-print">
                <h4 class="modal-title">Comanda da Mesa <button type="button" class="btn btn-info style-action" onclick="print()"><i class="fas fa-print"></i></button></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="cupom-nao-fiscal">
                    <p style="text-align: center">
                        <b>Nx Sistemas</b>
                    </p>

                    <hr>

                    <p>
                        Desc.: <?= $mesa['nome'] ?><br>
                        Data Imp.: <?= date('d/m/Y') ?><br>
                        Hora Imp.: <?= date('H:i:s') ?>
                    </p>

                    <hr>

                    <table width='100%'>
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>Qtd.</th>
                                <th>Valor</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($produtos_da_mesa)): ?>
                                <?php $valor_total = 0;?>
                                <?php foreach ($produtos_da_mesa as $produto): ?>
                                    <tr>
                                        <td><?= $produto['nome'] ?></td>
                                        <td><?= $produto['quantidade'] ?></td>
                                        <td><?= number_format($produto['valor'], 2, ',', '.') ?></td>
                                        <td><?= number_format(($produto['quantidade'] * $produto['valor']), 2, ',', '.') ?></td>
                                    </tr>

                                    <?php $valor_total += ($produto['quantidade'] * $produto['valor']) ?>
                                <?php endforeach;?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="6">Nenhum registro!</td>
                                </tr>
                            <?php endif;?>
                        </tbody>
                    </table>
                    <br>
                    <p>
                        VALOR TOTAL: <?= number_format($valor_total, 2, ',', '.') ?><br>
                        DIVISÃO PARA <?= $mesa['qtd_de_pessoas'] ?> PESSOAS: R$ <?= number_format(($valor_total / $mesa['qtd_de_pessoas']), 2, ',', '.') ?>
                    </p>
                </div>
            </div>
            <div class="modal-footer justify-content-between no-print">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-info" onclick="print()"><i class="fas fa-print"></i> Imprimir Comanda</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper no-print">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 15px">
                <div class="col-sm-6">
                    <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                </div><!-- /.col -->
                <div class="col-sm-6 no-print">
                    <ol class="breadcrumb float-sm-right">
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

            <div class="row">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <button class="btn btn-info" data-toggle="modal" data-target="#modal-adicionar-pagamento">Efetuar Pagamento</button>
                                    <button class="btn btn-success" data-toggle="modal" data-target="#modal-finalizar-mesa">Finalizar Mesa</button>
                                </div>
                                <div class="col-lg-6">
                                    <button class="btn btn-default" onclick="preparaImpressao()" data-toggle="modal" data-target="#modal-calculadora">Calculadora</button>
                                    <button class="btn btn-default" onclick="preparaImpressao()" data-toggle="modal" data-target="#modal-cupom-nao-fiscal">Comanda da Mesa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>

                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-lg-12">
                                <h5>Valor Total: <?= (isset($valor_total)) ? number_format($valor_total, 2, ',', '.') : "R$ 0,00" ?></h5>
                                <h5>Valor Pago: <?= (isset($valor_pago)) ? number_format($valor_pago, 2, ',', '.') : "R$ 0,00" ?></h5>
                                <?php if(isset($valor_total) && isset($valor_pago)): ?>
                                    <h5>Restante: <?= number_format(($valor_total - $valor_pago), 2, ',', '.')?></h5>
                                <?php endif; ?>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Produtos</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0" style="height: 300px;">
                            <table class="table table-head-fixed text-nowrap table-striped">
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Qtd</th>
                                        <th>Valor</th>
                                        <th>Subtotal</th>
                                        <th>Status</th>
                                        <th>Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($produtos_da_mesa)) : ?>
                                        <?php foreach ($produtos_da_mesa as $produto) : ?>
                                            <tr>
                                                <td><?= $produto['nome'] ?></td>
                                                <td><?= $produto['quantidade'] ?></td>
                                                <td><?= number_format($produto['valor'], 2, ',', '.') ?></td>
                                                <td><?= number_format(($produto['quantidade'] * $produto['valor']), 2, ',', '.') ?></td>
                                                <td><?= $produto['status'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-info style-action" onclick="pegaDadosDoProduto(<?= $produto['id_produto_provisorio'] ?>, <?= $produto['quantidade'] * $produto['valor'] ?>, 'PGTO do Prod. <?= $produto['nome'] ?>')" data-toggle="modal" data-target="#modal-adiciona-pagamento-do-produto"><i class="fas fa-check-square" aria-hidden="true"></i></a>
                                                </td>
                                            </tr>

                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="6">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Pagamentos</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body table-responsive p-0" style="height: 300px;">
                            <table class="table table-head-fixed text-nowrap table-striped">
                                <thead>
                                    <tr>
                                        <th>Valor</th>
                                        <th>Forma de PGTO</th>
                                        <th>Obs</th>
                                        <th>Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($pagamentos_da_mesa)) : ?>
                                        <?php foreach ($pagamentos_da_mesa as $pagamento) : ?>
                                            <tr>
                                                <td><?= number_format($pagamento['valor'], 2, ',', '.') ?></td>
                                                <td><?= $pagamento['forma_de_pagamento'] ?></td>
                                                <td><?= $pagamento['observacoes'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse pagamento?', '/food/deletePagamento/<?= $pagamento['id_pagamento'] ?>/<?= $id_mesa ?>')"><i class="fa fa-trash"></i></button>
                                                </td>
                                            </tr>

                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="4">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    function pegaDadosDoProduto(id_produto_provisorio, valor_do_produto, observacoes)
    {
        document.getElementById('id_produto_provisorio').value = id_produto_provisorio;
        document.getElementById('valor_do_produto').value = converteMoneyBRL(valor_do_produto);
        document.getElementById('obs_do_produto').value = observacoes;
    }

    function preparaImpressao()
    {
        document.getElementById('footer').className += " no-print";
    }
</script>

<script src="<?= base_url('assets/js/calculadora.js') ?>"></script>