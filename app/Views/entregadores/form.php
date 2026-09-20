<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/entregadores/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/entregadores" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                                    <label>Status</label>
                                    <select class="form-control select2" name="status" style="width: 100%;">
                                        <?php if(isset($entregador)): ?>
                                            <?php if($entregador['status'] == "Ativo"): ?>
                                                <option value="Ativo" selected="">Ativo</option>
                                                <option value="Desligado">Desligado</option>
                                            <?php else: ?>
                                                <option value="Ativo">Ativo</option>
                                                <option value="Desligado" selected="">Desligado</option>
                                            <?php endif; ?>
                                        <?php else: ?>
                                            <option value="Ativo" selected="">Ativo</option>
                                            <option value="Desligado">Desligado</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome" value="<?= (isset($entregador)) ? $entregador['nome'] : "" ?>" onkeyup="verificaNomeCampoGeral('nome')" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data Inicio das Atividades</label>
                                    <input type="date" class="form-control" name="data_inicio_das_atividades" value="<?= (isset($entregador)) ? $entregador['data_inicio_das_atividades'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Anotações</label>
                                    <input type="text" class="form-control" name="anotacoes" value="<?= (isset($entregador)) ? $entregador['anotacoes'] : "" ?>">
                                </div>
                            </div>

                            <?php if (isset($entregador)) : ?>
                                <!-- HIDDENS -->
                                <input type="hidden" class="form-control" name="id_entregador" value="<?= $entregador['id_entregador'] ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($entregador)) ? "Atualizar" : "Cadastrar" ?></button>
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