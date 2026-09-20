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
                            <a href="/vendaRapida" class="btn btn-info"><i class="fa fa-plus-circle"></i> Nova Venda</a>
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
                                <th>Valor</th>
                                <th>Data</th>
                                <th>Hora</th>
                                <th>Cliente</th>
                                <th>Cod. Caixa</th>
                                <th class="no-print" style="width: 110px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($vendas)) : ?>
                                <?php foreach ($vendas as $venda) : ?>
                                    <tr>
                                        <td><?= $venda['id_venda'] ?></td>
                                        <td><?= number_format($venda['valor_a_pagar'], 2, ',', '.') ?></td>
                                        <td><?= date('d/m/Y', strtotime($venda['data'])) ?></td>
                                        <td><?= $venda['hora'] ?></td>
                                        <td><?= $venda['nome'] ?></td>
                                        <td><?= $venda['id_caixa'] ?></td>
                                        <td class="no-print">
                                            <a href="/vendas/show/<?= $venda['id_venda'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                            <!-- <a href="/vendas/edit/<?= $venda['id_venda'] ?>" class="btn btn-warning style-action"><i class="fa fa-edit"></i></a> -->
                                            <?php if(!isset($venda['id_nfe']) && !isset($venda['id_nfce'])): ?>
                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir essa venda?', '/vendas/delete/<?= $venda['id_venda'] ?>')"><i class="fa fa-trash"></i></button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else: ?>
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