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
            <div class="card">
                <div class="card-body no-print">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="/vendaRapida" class="btn btn-info"><i class="fa fa-plus-circle"></i> Novo Pedido</a>
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
                                <th style="width: 35px">Cód.</th>
                                <th>Cliente</th>
                                <th>Data</th>
                                <th>Situação</th>
                                <th>Prazo de entrega</th>
                                <th>Valor</th>
                                <th class="no-print" style="width: 110px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($pedidos)) : ?>
                                <?php foreach ($pedidos as $pedido) : ?>
                                    <tr>
                                        <td><?= $pedido['id_pedido'] ?></td>
                                        <td>
                                            <a href="/clientes/show/<?= $pedido['id_cliente'] ?>" style="color: black"><u><?= $pedido['nome'] ?></u></a>
                                        </td>
                                        <td><?= date('d/m/Y', strtotime($pedido['data'])) ?></td>
                                        <td>
                                            <?php if($pedido['situacao'] == "Não Pago - Andamento"): ?>
                                                <span style="height: 20px; font-size: 12px; color: white; border-radius: 2px; background: #FFC125" class="badge badge-warning"><?= $pedido['situacao'] ?>
                                            <?php else: ?>
                                                <span style="height: 20px; font-size: 12px; color: white; border-radius: 2px;" class="badge badge-success"><?= $pedido['situacao'] ?>
                                            <?php endif; ?>
                                        </td>
                                        <td><?= date('d/m/Y', strtotime($pedido['prazo_de_entrega'])) ?></td>
                                        <td><?= number_format($pedido['valor_a_pagar'], 2, ',', '.') ?></td>
                                        <td class="no-print">
                                            <a href="/pedidos/show/<?= $pedido['id_pedido'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse pedido?', '/pedidos/delete/<?= $pedido['id_pedido'] ?>')"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <tr>
                                    <td colspan="7">Nenhum registro!</td>
                                </tr>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
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
            <?php if ($alert == "success_create") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Despesa cadastrada com sucesso!'
                })
            <?php elseif ($alert == "success_delete") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Pedido excluido com sucesso!'
                })
            <?php elseif ($alert == "success_filter") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Filtro aplicado!'
                })
            <?php endif; ?>
        <?php endif; ?>
    });
</script>