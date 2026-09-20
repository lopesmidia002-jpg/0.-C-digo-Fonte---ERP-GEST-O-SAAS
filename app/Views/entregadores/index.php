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
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="/entregadores/create" class="btn btn-info"><i class="fa fa-user-plus"></i> Novo Entregador</a>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
            </div>
            <!-- /.card -->
            <div class="card">
                <!-- /.card-body -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 35px">Cód.</th>
                                <th>Nome</th>
                                <th>Status</th>
                                <th>Data Inicio das Atividades</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(!empty($entregadores)): ?>
                                <?php foreach($entregadores as $entregador): ?>
                                    <tr>
                                        <td><?= $entregador['id_entregador'] ?></td>
                                        <td><?= $entregador['nome'] ?></td>
                                        <td><?= $entregador['status'] ?></td>
                                        <td><?= ($entregador['data_inicio_das_atividades'] != "0000-00-00") ? date('d/m/Y', strtotime($entregador['data_inicio_das_atividades'])) : "Não cadastrado!" ?></td>
                                        <td>
                                            <?php if($entregador['nome'] != "GERAL"): ?>
                                                <a href="/entregadores/show/<?= $entregador['id_entregador'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                                <a href="/entregadores/edit/<?= $entregador['id_entregador'] ?>" class="btn btn-warning style-action"><i class="fas fa-edit"></i></a>
                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse Entregador?', '/entregadores/delete/<?= $entregador['id_entregador'] ?>')"><i class="fas fa-trash"></i></button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="6">Nenhum registro!</td>
                                </tr>
                            <?php endif ?>
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