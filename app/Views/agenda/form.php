<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/agenda/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/agenda?data=<?= (isset($compromisso)) ? $compromisso['data'] : $data ?>" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data</label>
                                    <input type="date" class="form-control" value="<?= (isset($compromisso)) ? $compromisso['data'] : $data ?>" disabled>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Horário</label>
                                    <input type="text" class="form-control" value="<?= (isset($compromisso)) ? $compromisso['horario'] : $horario ?>" disabled>
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <?php if(isset($compromisso)): ?>
                                        <select class="form-control select2" name="status" style="width: 100%" required>
                                            <?php if($compromisso['status'] == "Em aberto"): ?>
                                                <option value="Em aberto" selected>Em aberto</option>
                                                <option value="Em andamento">Em andamento</option>
                                                <option value="Concluido">Concluido</option>
                                                <option value="Cancelado">Cancelado</option>
                                            <?php elseif($compromisso['status'] == "Em andamento"): ?>
                                                <option value="Em aberto">Em aberto</option>
                                                <option value="Em andamento" selected>Em andamento</option>
                                                <option value="Concluido">Concluido</option>
                                                <option value="Cancelado">Cancelado</option>
                                            <?php elseif($compromisso['status'] == "Concluido"): ?>
                                                <option value="Em aberto">Em aberto</option>
                                                <option value="Em andamento">Em andamento</option>
                                                <option value="Concluido" selected>Concluido</option>
                                                <option value="Cancelado">Cancelado</option>
                                            <?php elseif($compromisso['status'] == "Cancelado"): ?>
                                                <option value="Em aberto">Em aberto</option>
                                                <option value="Em andamento">Em andamento</option>
                                                <option value="Concluido">Concluido</option>
                                                <option value="Cancelado" selected>Cancelado</option>
                                            <?php endif; ?>
                                        </select>
                                    <?php else: ?>
                                        <select class="form-control select2" name="status" style="width: 100%" required>
                                            <option value="Em aberto" selected>Em aberto</option>
                                            <option value="Em andamento">Em andamento</option>
                                            <option value="Concluido">Concluido</option>
                                            <option value="Cancelado">Cancelado</option>
                                        </select>
                                    <?php endif; ?>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Compromisso</label>
                                    <textarea class="form-control" name="compromisso" rows="10" required><?= (isset($compromisso)) ? $compromisso['compromisso'] : "" ?></textarea>
                                </div>
                            </div>

                            <?php if(isset($compromisso)) : ?>
                                <input type="hidden" name="id_compromisso" value="<?= $compromisso['id_compromisso'] ?>">
                            <?php else: ?>
                                <input type="hidden" name="data" value="<?= $data ?>">
                                <input type="hidden" name="horario" value="<?= $horario ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($compromisso)) ? "Atualizar" : "Cadastrar" ?></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </form>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->