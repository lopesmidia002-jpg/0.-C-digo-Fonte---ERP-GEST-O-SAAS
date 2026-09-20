<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 15px">
                <div class="col-sm-6">
                    <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                </div><!-- /.col -->
                <div class="col-sm-6 no-print">
                    <ol class="breadcrumb float-sm-right">
                        <a href="/pedidos" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
            <div class="card no-print">
                <div class="card-header">
                    <button type="button" class="btn btn-default" onclick="print()"><i class="fas fa-print"></i> Imprimir Pedido</button>
                    <?php if($pedido['situacao'] == "Pago - Finalizado"): ?>
                        <button type="button" class="btn btn-info" disabled><i class="fas fa-print"></i> Finalizar Pedido</button>
                    <?php else: ?>
                        <a href="/pedidos/finalizarPedido/<?= $pedido['id_pedido'] ?>" class="btn btn-info"><i class="fas fa-print"></i> Finalizar Pedido</a>
                    <?php endif;?>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <div class="form-group">
                                <label for="">Cód. do Pedido</label>
                                <input type="text" class="form-control" value="<?= $pedido['id_pedido'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label for="">Situação</label>
                                <input type="text" class="form-control" value="<?= $pedido['situacao'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Valor da Venda</label>
                                <input type="text" class="form-control" value="<?= number_format($pedido['valor_a_pagar'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Desconto</label>
                                <input type="text" class="form-control" value="<?= number_format($pedido['desconto'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Valor Recebido</label>
                                <input type="text" class="form-control" value="<?= number_format($pedido['valor_recebido'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Troco</label>
                                <input type="text" class="form-control" value="<?= number_format($pedido['troco'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label for="">Forma de Pagamento</label>
                                <input type="text" class="form-control" value="<?= $pedido['forma_de_pagamento'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label for="">Prazo de Entrega</label>
                                <input type="text" class="form-control" value="<?= date('d/m/Y', strtotime($pedido['prazo_de_entrega'])) ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                            <div class="form-group">
                                <label for="">Data</label>
                                <input type="text" class="form-control" value="<?= date('d/m/Y', strtotime($pedido['data'])) ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Hora</label>
                                <input type="text" class="form-control" value="<?= $pedido['hora'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                            <div class="form-group">
                                <label for="">Cód. do Caixa</label>
                                <input type="text" class="form-control" value="<?= $pedido['id_caixa'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <div class="form-group">
                                <label for="">Cliente</label>
                                <input type="text" class="form-control" value="<?= $pedido['nome_do_cliente'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <div class="form-group">
                                <label for="">Vendedor</label>
                                <input type="text" class="form-control" value="<?= $pedido['nome_do_vendedor'] ?>" disabled="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th colspan="9" style="text-align: center">PRODUTOS DO PEDIDO</th>
                            </tr>
                            <tr>
                                <th>Cód.</th>
                                <th>Nome</th>
                                <th>UN</th>
                                <th>Cod. Barras</th>
                                <th>Qtd</th>
                                <th>Valor Unit.</th>
                                <th>Subtotal</th>
                                <th>Desc.</th>
                                <th>Valor Final</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($produtos_do_pedido as $produto) : ?>
                                <tr>
                                    <td><?= $produto['id_produto'] ?></td>
                                    <td><?= $produto['nome'] ?></td>
                                    <td><?= $produto['unidade'] ?></td>
                                    <td><?= $produto['codigo_de_barras'] ?></td>
                                    <td><?= $produto['quantidade'] ?></td>
                                    <td><?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['subtotal'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['desconto'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['valor_final'], 2, ',', '.') ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->