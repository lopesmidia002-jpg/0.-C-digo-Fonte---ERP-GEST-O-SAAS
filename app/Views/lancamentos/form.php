<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/lancamentos/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/lancamentos" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="">Descrição</label>
                                    <input type="text" class="form-control" name="descricao" value="<?= (isset($lancamento)) ? $lancamento['descricao'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Valor</label>
                                    <input type="text" class="form-control money" id="valor" name="valor" value="<?= (isset($lancamento)) ? number_format($lancamento['valor'], 2, ',', '.') : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Data</label>
                                    <input type="date" class="form-control" name="data" value="<?= (isset($lancamento)) ? $lancamento['data'] : date('Y-m-d') ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Hora</label>
                                    <input type="text" class="form-control" name="hora" value="<?= (isset($lancamento)) ? $lancamento['hora'] : date('H:i:s') ?>" required="">
                                </div>
                            </div>
                            <?php if (isset($lancamento)) : ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label for="">Cód. do Caixa</label>
                                        <input type="text" class="form-control" name="id_caixa" value="<?= (isset($lancamento)) ? $lancamento['id_caixa'] : "" ?>" required="">
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Caixas abertos</label>
                                        <select class="form-control select2" name="id_caixa" style="width: 100%;">
                                            <?php if (!empty($caixas)) : ?>
                                                <?php foreach ($caixas as $caixa) : ?>
                                                    <option value="<?= $caixa['id_caixa'] ?>">Data abert.: <?= $caixa['data_de_abertura'] ?> - Hora abert.: <?= $caixa['hora_de_abertura'] ?></option>
                                                <?php endforeach; ?>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Observações</label>
                                    <textarea class="form-control" rows="5" name="observacoes"><?= (isset($lancamento)) ? $lancamento['observacoes'] : "" ?></textarea>
                                </div>
                            </div>

                            <?php if (isset($lancamento)) : ?>
                                <!-- HIDDENS EDIT -->
                                <input type="hidden" class="form-control" name="id_lancamento" value="<?= $lancamento['id_lancamento'] ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($lancamento)) ? "Atualizar" : "Cadastrar" ?></button>
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