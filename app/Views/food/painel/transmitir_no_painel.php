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

            <div class="row">
                <div class="col-lg-6">
                    <form action="/painel/storeTransmitir" method="post">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h6 class="m-0 text-dark"><i class="fas fa-edit"></i> Dados para Transmitir</h6>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Senha</label>
                                            <input type="text" class="form-control" name="senha" value="<?= $senha ?>" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: right">
                                        <button type="submit" class="btn btn-success">Transmitir no Painel</button>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                            <!-- /.card-header -->
                        </div>
                        <!-- /.card -->
                    </form>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h6 class="m-0 text-dark"><i class="fas fa-list"></i> Últimas senhas chamadas</h6>
                                </div><!-- /.col -->
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <button type="button" class="btn btn-info button-voltar" style="margin-bottom: 15px" onclick="confirmaExclusaoHistorico()">Limpar Histórico</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Senha</th>
                                                <th>Data</th>
                                                <th>Hora</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($historico)): ?>
                                                <?php foreach($historico as $aux): ?>
                                                    <tr>
                                                        <td><?= $aux['senha'] ?></td>
                                                        <td><?= $aux['data'] ?></td>
                                                        <td><?= $aux['hora'] ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="3">Nenhum registro!</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    function confirmaExclusaoHistorico() {
        if (confirm("Deseja realmente limpar o histórico? Essa ação não poderá ser desfeita.")) {
            window.location.href = "/painel/limpaHistorico";
        }
    }
</script>