<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form id="form" action="/contasReceber/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/contasReceber" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <?php if (isset($conta)) : ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select class="form-control select2" id="status" name="status" style="width: 100%;" required="">
                                            <?php if ($conta['status'] == "Aberta") : ?>
                                                <option value="Aberta" selected="">Aberta</option>
                                                <option value="Vencida">Vencida</option>
                                                <option value="Paga">Paga</option>
                                            <?php elseif ($conta['status'] == "Vencida") : ?>
                                                <option value="Aberta">Aberta</option>
                                                <option value="Vencida" selected="">Vencida</option>
                                                <option value="Paga">Paga</option>
                                            <?php elseif ($conta['status'] == "Paga") : ?>
                                                <option value="Aberta">Aberta</option>
                                                <option value="Vencida">Vencida</option>
                                                <option value="Paga" selected="">Paga</option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select class="form-control select2" id="status" name="status" style="width: 100%;" required="">
                                            <option value="Aberta">Aberta</option>
                                            <option value="Vencida">Vencida</option>
                                            <option value="Paga">Paga</option>
                                        </select>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" name="nome" value="<?= (isset($conta)) ? $conta['nome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data de Venc.</label>
                                    <input type="date" class="form-control" name="data_de_vencimento" value="<?= (isset($conta)) ? $conta['data_de_vencimento'] : date('Y-m-d') ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Valor</label>
                                    <input type="text" class="form-control money" id="valor" name="valor" value="<?= (isset($conta)) ? number_format($conta['valor'], 2, ',', '.') : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Caixa</label>
                                    <select class="form-control select2" id="id_caixa" name="id_caixa" style="width: 100%" required>
                                        <?php foreach($caixas as $caixa): ?>
                                            <option value="<?= $caixa['id_caixa'] ?>">Cod.: <?= $caixa['id_caixa'] ?> - Data Abert.: <?= $caixa['data_de_abertura'] ?> - Hora Abert.: <?= $caixa['hora_de_abertura'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="customSwitch1" onclick="desabilitaSelectCaixa()">
                                        <label class="custom-control-label" for="customSwitch1">Não adicionar valor ao caixa</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Observações</label>
                                    <textarea class="form-control" rows="5" name="observacoes"><?= (isset($conta)) ? $conta['observacoes'] : "" ?></textarea>
                                </div>
                            </div>

                            <div class="col-lg-12" style="margin-top: 25px">
                                <p><b>Obs:</b> Para adicionar o valor da conta ao caixa o status deve ser Paga!</p>
                            </div>

                            <?php if (isset($conta)) : ?>
                                <!-- HIDDENS -->
                                <input type="hidden" class="form-control" name="id_conta" value="<?= $conta['id_conta'] ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($conta)) ? "Atualizar" : "Cadastrar" ?></button>
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

<script>
    function desabilitaSelectCaixa()
    {
        var opcao = document.getElementById('customSwitch1').checked;

        if(opcao)
        {
            document.getElementById('id_caixa').disabled = true;
        }
        else
        {
            document.getElementById('id_caixa').disabled = false;
        }
    }
</script>