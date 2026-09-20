<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-lg-4">
                    <div class="card no-print">
                        <div class="card-body">
                            <button type="button" class="btn btn-info" onclick="print()"><i class="fas fa-print"></i> Imprimir / Salvar PDF</button>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <p style="text-align: center"><b><?= $configuracao['xFant'] ?></b></p>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <p>
                                        <b>CNPJ:</b> <span class="cnpj"><?= $configuracao['CNPJ'] ?></span> <br>
                                        <b>CONTATO:</b> <span class="celular"><?= $configuracao['telefone'] ?></span> <br>
                                        <b>ENDEREÇO:</b> <?= $configuracao['endereco'] ?>
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
                                                <th>CNPJ</th>
                                                <th>Razão Social</th>
                                                <th>Fone</th>
                                                <th>Endereço</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($empresas)): ?>
                                                <?php foreach($empresas as $empresa): ?>
                                                    <tr>
                                                        <td><?= $empresa['id_empresa'] ?></td>
                                                        <td><?= $empresa['CNPJ'] ?></td>
                                                        <td><?= $empresa['xNome'] ?></td>
                                                        <td><?= $empresa['fone'] ?></td>
                                                        <td><?= $empresa['xLgr'] ?>, <?= $empresa['xCpl'] ?>, Nº <?= $empresa['nro'] ?>, <?= $empresa['xBairro'] ?>, CEP: <?= $empresa['CEP'] ?></td>
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