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
                        <a href="/orcamentos" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                    <button type="button" class="btn btn-default" onclick="print()"><i class="fas fa-print"></i> Imprimir Orçamento</button>
                    <?php if($orcamento['status'] == "Finalizado"): ?>
                        <button type="button" class="btn btn-info" disabled><i class="fas fa-print"></i> Finalizar Venda</button>
                    <?php else: ?>
                        <a href="/orcamentos/finalizarVenda/<?= $orcamento['id_orcamento'] ?>" class="btn btn-info"><i class="fas fa-print"></i> Finalizar Venda</a>
                    <?php endif;?>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Cód. do Orçamento</label>
                                <input type="text" class="form-control" value="<?= $orcamento['id_orcamento'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Status</label>
                                <input type="text" class="form-control" value="<?= $orcamento['status'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Valor da Venda</label>
                                <input type="text" class="form-control" value="<?= number_format($orcamento['valor_a_pagar'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Desconto</label>
                                <input type="text" class="form-control" value="<?= number_format($orcamento['desconto'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Valor Recebido</label>
                                <input type="text" class="form-control" value="<?= number_format($orcamento['valor_recebido'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Troco</label>
                                <input type="text" class="form-control" value="<?= number_format($orcamento['troco'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Forma de Pagamento</label>
                                <input type="text" class="form-control" value="<?= $orcamento['forma_de_pagamento'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <div class="form-group">
                                <label for="">Cliente</label>
                                <input type="text" class="form-control" value="<?= $orcamento['nome_do_cliente'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                            <div class="form-group">
                                <label for="">Vendedor</label>
                                <input type="text" class="form-control" value="<?= $orcamento['nome_do_vendedor'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Data</label>
                                <input type="text" class="form-control" value="<?= date('d/m/Y', strtotime($orcamento['data'])) ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Hora</label>
                                <input type="text" class="form-control" value="<?= $orcamento['hora'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            <div class="form-group">
                                <label for="">Cód. do Caixa</label>
                                <input type="text" class="form-control" value="<?= $orcamento['id_caixa'] ?>" disabled="">
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
                                <th colspan="12" style="text-align: center">PRODUTOS DO ORÇAMENTO</th>
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
                            <?php if(!empty($produtos_do_orcamento)): ?>
                                <?php foreach ($produtos_do_orcamento as $orcamento) : ?>
                                    <tr>
                                        <td><?= $orcamento['id_orcamento'] ?></td>
                                        <td><?= $orcamento['nome'] ?></td>
                                        <td><?= $orcamento['unidade'] ?></td>
                                        <td><?= $orcamento['codigo_de_barras'] ?></td>
                                        <td><?= $orcamento['quantidade'] ?></td>
                                        <td><?= number_format($orcamento['valor_unitario'], 2, ',', '.') ?></td>
                                        <td><?= number_format($orcamento['subtotal'], 2, ',', '.') ?></td>
                                        <td><?= number_format($orcamento['desconto'], 2, ',', '.') ?></td>
                                        <td><?= number_format($orcamento['valor_final'], 2, ',', '.') ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="9">Nenhum registro!</td>
                                </tr>
                            <?php endif;?>
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

<script>
    $(function() {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000
        });

        <?php
        $session = session();
        $alert = $session->getFlashdata('alert');

        if (isset($alert)) :
        ?>
            <?php if ($alert == "success_finaliza_venda") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Orçamento finalizado com sucesso!'
                })
            <?php endif; ?>
        <?php endif; ?>
    });
</script>