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
                    <form action="">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Data</label>
                                    <input type="date" class="form-control" name="data" value="<?= (isset($data)) ? $data : "" ?>" required>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success" style="margin-top: 30px">Pesquisar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 95px">Horário</th>
                                <th>Compromisso</th>
                                <th>Status</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach($compromissos as $compromisso): ?>
                                <?php if(isset($compromisso[0]['compromisso'])): ?>

                                    <?php if($compromisso[0]['status'] == "Em aberto"): ?>
                                        <tr class="btn-warning">
                                    <?php elseif($compromisso[0]['status'] == "Em andamento"): ?>
                                        <tr class="btn-primary">
                                    <?php elseif($compromisso[0]['status'] == "Concluido"): ?>
                                        <tr class="btn-success">
                                    <?php elseif($compromisso[0]['status'] == "Cancelado"): ?>
                                        <tr class="btn-danger">
                                    <?php endif; ?>
                                        <td><?= $compromisso[0]['horario'] ?></td>
                                        <td><?= $compromisso[0]['compromisso'] ?></td>
                                        <td><?= $compromisso[0]['status'] ?></td>
                                        <td>
                                            <a href="/agenda/edit/<?= $compromisso[0]['id_compromisso'] ?>" class="btn btn-warning style-action"><i class="fa fa-edit"></i></a>
                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse Compromisso?', '/agenda/delete/<?= $compromisso[0]['id_compromisso'] ?>/<?= $compromisso[0]['data'] ?>')"><i class="fa fa-trash"></i></button>
                                        </td>
                                    </tr>

                                <?php else: ?>

                                    <tr>
                                        <td><?= $compromisso['horario'] ?></td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <a href="/agenda/create?data=<?= (isset($_GET['data'])) ? $_GET['data'] : date('Y-m-d') ?>&horario=<?= $compromisso['horario'] ?>" class="btn btn-info style-action"><i class="fa fa-plus-circle"></i></a>
                                        </td>
                                    </tr>

                                <?php endif; ?>
                            <?php endforeach; ?>
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