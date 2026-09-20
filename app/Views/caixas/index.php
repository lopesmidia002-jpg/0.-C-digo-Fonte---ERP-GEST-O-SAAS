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
                <!-- /.card-header -->
                <div class="card-body no-print">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="/caixas/abrir" class="btn btn-info"><i class="fa fa-plus-circle"></i> Abrir Caixa</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <h6 class="m-0 text-dark"><i class="fas fa-list"></i> <?= (isset($ultimos_cinco)) ? "Cinco últimos caixas cadastrados" : "Registros" ?></h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 35px">Cód.</th>
                                <th>Status</th>
                                <th>Data de abert.</th>
                                <th>Hora de abert.</th>
                                <th>Data de fecham.</th>
                                <th>Hora de fecham.</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($caixas)) : ?>
                                <?php foreach ($caixas as $caixa) : ?>
                                    <tr>
                                        <td><?= $caixa['id_caixa'] ?></td>
                                        <td><?= $caixa['status'] ?></td>
                                        <td><?= date('d/m/Y', strtotime($caixa['data_de_abertura'])) ?></td>
                                        <td><?= $caixa['hora_de_abertura'] ?></td>
                                        <td><?= ($caixa['data_de_fechamento'] == "0000-00-00" ? "Não definida!" : date('d/m/Y', strtotime($caixa['data_de_fechamento']))) ?></td>
                                        <td><?= ($caixa['hora_de_fechamento'] == "00:00:00" ? "Não definida!" : $caixa['hora_de_fechamento']) ?></td>
                                        <td class="no-print">
                                            <a href="/caixas/show/<?= $caixa['id_caixa'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                            <!-- <button type="button" class="btn btn-warning style-action"><i class="fa fa-edit"></i></button>
                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse caixa?', '/caixas/delete/<?= $caixa['id_caixa'] ?>')"><i class="fa fa-trash"></i></button> -->
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