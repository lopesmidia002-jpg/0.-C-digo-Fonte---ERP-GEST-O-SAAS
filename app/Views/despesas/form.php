<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/despesas/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/despesas" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <?php if (isset($despesa)) : ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Tipo</label>
                                        <select class="form-control select2" name="tipo" style="width: 100%;">
                                            <?php if ($despesa['tipo'] == "Prolabore") : ?>
                                                <option value="Prolabore" selected="">Prolabore</option>
                                                <option value="Impostos">Impostos</option>
                                                <option value="Despesas variáveis">Despesas variáveis</option>
                                                <option value="Despesas fixas">Despesas fixas</option>
                                                <option value="Gastos com pessoas">Gastos com pessoas</option>
                                            <?php elseif ($despesa['tipo'] == "Impostos") : ?>
                                                <option value="Prolabore">Prolabore</option>
                                                <option value="Impostos" selected="">Impostos</option>
                                                <option value="Despesas variáveis">Despesas variáveis</option>
                                                <option value="Despesas fixas">Despesas fixas</option>
                                                <option value="Gastos com pessoas">Gastos com pessoas</option>
                                            <?php elseif ($despesa['tipo'] == "Despesas variáveis") : ?>
                                                <option value="Prolabore">Prolabore</option>
                                                <option value="Impostos">Impostos</option>
                                                <option value="Despesas variáveis" selected="">Despesas variáveis</option>
                                                <option value="Despesas fixas">Despesas fixas</option>
                                                <option value="Gastos com pessoas">Gastos com pessoas</option>
                                            <?php elseif ($despesa['tipo'] == "Despesas fixas") : ?>
                                                <option value="Prolabore">Prolabore</option>
                                                <option value="Impostos">Impostos</option>
                                                <option value="Despesas variáveis">Despesas variáveis</option>
                                                <option value="Despesas fixas" selected="">Despesas fixas</option>
                                                <option value="Gastos com pessoas">Gastos com pessoas</option>
                                            <?php elseif ($despesa['tipo'] == "Gastos com pessoas") : ?>
                                                <option value="Prolabore">Prolabore</option>
                                                <option value="Impostos">Impostos</option>
                                                <option value="Despesas variáveis">Despesas variáveis</option>
                                                <option value="Despesas fixas">Despesas fixas</option>
                                                <option value="Gastos com pessoas" selected="">Gastos com pessoas</option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Tipo</label>
                                        <select class="form-control select2" name="tipo" style="width: 100%;">
                                            <option value="Prolabore">Prolabore</option>
                                            <option value="Impostos">Impostos</option>
                                            <option value="Despesas variáveis">Despesas variáveis</option>
                                            <option value="Despesas fixas">Despesas fixas</option>
                                            <option value="Gastos com pessoas">Gastos com pessoas</option>
                                        </select>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Descrição</label>
                                    <input type="text" class="form-control" name="descricao" value="<?= (isset($despesa)) ? $despesa['descricao'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor</label>
                                    <input type="text" class="form-control money" id="valor" name="valor" value="<?= (isset($despesa)) ? number_format($despesa['valor'], 2, ',', '.') : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data</label>
                                    <input type="date" class="form-control" name="data" value="<?= (isset($despesa)) ? $despesa['data'] : date('Y-m-d') ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Hora</label>
                                    <input type="text" class="form-control" name="hora" value="<?= (isset($despesa)) ? $despesa['hora'] : date('H:i:s') ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Observações</label>
                                    <textarea class="form-control" rows="5" name="observacoes"><?= (isset($despesa)) ? $despesa['observacoes'] : "" ?></textarea>
                                </div>
                            </div>

                            <?php if (isset($despesa)) : ?>
                                <!-- HIDDENS -->
                                <input type="hidden" class="form-control" name="id_despesa" value="<?= $despesa['id_despesa'] ?>">
                            <?php endif; ?>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($despesa)) ? "Atualizar" : "Cadastrar" ?></button>
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