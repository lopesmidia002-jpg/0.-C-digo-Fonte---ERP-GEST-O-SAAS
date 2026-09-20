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
                            <a href="/lancamentos/create" class="btn btn-info"><i class="fa fa-plus-circle"></i> Novo Lançamento</a>
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
                                <th>Descrição</th>
                                <th>Valor</th>
                                <th>Data</th>
                                <th>Hora</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (!empty($lancamentos)) : ?>
                                <?php foreach ($lancamentos as $lancamento) : ?>
                                    <tr>
                                        <td><?= $lancamento['id_lancamento'] ?></td>
                                        <td><?= $lancamento['descricao'] ?></td>
                                        <td><?= number_format($lancamento['valor'], 2, ',', '.') ?></td>
                                        <td><?= date('d/m/Y', strtotime($lancamento['data'])) ?></td>
                                        <td><?= $lancamento['hora'] ?></td>
                                        <td class="no-print">
                                            <a href="/lancamentos/show/<?= $lancamento['id_lancamento'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                            <a href="/lancamentos/edit/<?= $lancamento['id_lancamento'] ?>" class="btn btn-warning style-action"><i class="fa fa-edit"></i></a>
                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse lançamento?', '/lancamentos/delete/<?= $lancamento['id_lancamento'] ?>')"><i class="fa fa-trash"></i></button>
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