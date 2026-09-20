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
                            <a href="/tecnicos/create" class="btn btn-info"><i class="fa fa-user-plus"></i> Novo Técnico</a>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
            </div>
            <!-- /.card -->
            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 35px">Cód.</th>
                                <th>Nome</th>
                                <th>CPF</th>
                                <th>Celular 1</th>
                                <th>Celular 2</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(!empty($tecnicos)): ?>
                                <?php foreach($tecnicos as $tecnico): ?>
                                    <tr>
                                        <td><?= $tecnico['id_tecnico'] ?></td>
                                        <td><?= $tecnico['nome'] ?></td>
                                        <td class="cpf"><?= $tecnico['cpf'] ?></td>
                                        <td class="<?= ($tecnico['celular_1'] != "") ? "celular" : "" ?>"><?= ($tecnico['celular_1'] != "") ? $tecnico['celular_1'] : "Não cadastrado!" ?></td>
                                        <td class="<?= ($tecnico['celular_2'] != "") ? "celular" : "" ?>"><?= ($tecnico['celular_2'] != "") ? $tecnico['celular_2'] : "Não cadastrado!" ?></td>
                                        <td>
                                            <?php if($tecnico['nome'] != "GERAL"): ?>
                                                <a href="/tecnicos/show/<?= $tecnico['id_tecnico'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                                <a href="/tecnicos/edit/<?= $tecnico['id_tecnico'] ?>" class="btn btn-warning style-action"><i class="fas fa-edit"></i></a>
                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse Técnico?', '/tecnicos/delete/<?= $tecnico['id_tecnico'] ?>')"><i class="fas fa-trash"></i></button>
                                            <?php endif;?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="8">Nenhum registro!</td>
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