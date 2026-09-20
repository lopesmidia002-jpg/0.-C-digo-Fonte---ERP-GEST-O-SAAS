<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card no-print">
                <div class="card-body">
                    <form action="/relatorios/contasPagar" method="post">
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <select class="form-control select2" name="status">
                                        <?php if($status == "Todos"): ?>
                                            <option value="Todos" selected>Todas</option>
                                            <option value="Aberta">Aberta</option>
                                            <option value="Vencida">Vencida</option>
                                            <option value="Paga">Paga</option>
                                        <?php elseif($status == "Aberta"): ?>
                                            <option value="Todos">Todas</option>
                                            <option value="Aberta" selected>Aberta</option>
                                            <option value="Vencida">Vencida</option>
                                            <option value="Paga">Paga</option>
                                        <?php elseif($status == "Vencida"): ?>
                                            <option value="Todos">Todas</option>
                                            <option value="Aberta">Aberta</option>
                                            <option value="Vencida" selected>Vencida</option>
                                            <option value="Paga">Paga</option>
                                        <?php elseif($status == "Paga"): ?>
                                            <option value="Todos">Todas</option>
                                            <option value="Aberta">Aberta</option>
                                            <option value="Vencida">Vencida</option>
                                            <option value="Paga" selected>Paga</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data Inicio</label>
                                    <input type="date" class="form-control" name="data_inicio" value="<?= (isset($data_inicio)) ? $data_inicio : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Data Final</label>
                                    <input type="date" class="form-control" name="data_final" value="<?= (isset($data_final)) ? $data_final : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <button type="submit" class="btn btn-success" style="margin-top: 30px">Gerar Relatório</button>
                                <button type="button" class="btn btn-info" onclick="print()" style="margin-top: 30px"><i class="fas fa-print"></i> Imprimir / Salvar PDF</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.card -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <p style="text-align: center"><b>PEDRO ARLINDO DE MOURA JUNIOR 01758528125</b></p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <p>
                                        <b>CNPJ:</b> <span class="cnpj"><?= $empresa['CNPJ'] ?></span> <br>
                                        <b>CONTATO:</b> <span class="celular"><?= $empresa['fone'] ?></span> <br>
                                        <b>ENDEREÇO:</b> <?= $empresa['xLgr'] ?>, <?= $empresa['nro'] ?>, <?= $empresa['xCpl'] ?>, <?= $empresa['xBairro'] ?>.
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12">
                                    <h6 class="m-0 text-dark" style="text-align: center"><b><?= $titulo['modulo'] ?></b></h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <table id="" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Cód.</th>
                                                <th>Status</th>
                                                <th>Nome</th>
                                                <th>Vencimento</th>
                                                <th>Valor</th>
                                                <th>Obs</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($contas)): ?>
                                                <?php foreach($contas as $conta): ?>
                                                    <tr>
                                                        <td><?= $conta['id_conta'] ?></td>
                                                        <td><?= $conta['status'] ?></td>
                                                        <td><?= $conta['nome'] ?></td>
                                                        <td><?= date('d/m/Y', strtotime($conta['data_de_vencimento'])) ?></td>
                                                        <td><?= number_format($conta['valor'], 2, ',', '.') ?></td>
                                                        <td><?= $conta['observacoes'] ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="6">Nenhum registro!</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <p>Relatório gerado em: <?= date('d/m/Y') ?> às <?= date('H:i') ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->