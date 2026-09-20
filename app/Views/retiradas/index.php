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
                            <a href="/retiradas/create" class="btn btn-info"><i class="fa fa-plus-circle"></i> Nova Retirada</a>
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
                                <th>Tipo</th>
                                <th>Descrição</th>
                                <th>Valor</th>
                                <th>Data</th>
                                <th>Hora</th>
                                <th>Observações</th>
                                <th class="no-print" style="width: 110px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($retiradas)) : ?>
                                <?php foreach ($retiradas as $retirada) : ?>
                                    <tr>
                                        <td><?= $retirada['id_retirada'] ?></td>
                                        <td><?= $retirada['tipo'] ?></td>
                                        <td><?= $retirada['descricao'] ?></td>
                                        <td><?= number_format($retirada['valor'], 2, ',', '.') ?></td>
                                        <td><?= date('d/m/Y', strtotime($retirada['data'])) ?></td>
                                        <td><?= $retirada['hora'] ?></td>
                                        <td><?= $retirada['observacoes'] ?></td>
                                        <td class="no-print">
                                            <a href="/retiradas/edit/<?= $retirada['id_retirada'] ?>" class="btn btn-warning style-action"><i class="fa fa-edit"></i></a>
                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir essa retirada?', '/retiradas/delete/<?= $retirada['id_retirada'] ?>')"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php else : ?>
                                <tr>
                                    <td colspan="8">Nenhum registro!</td>
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