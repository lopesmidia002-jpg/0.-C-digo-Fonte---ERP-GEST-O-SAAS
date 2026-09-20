<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="card no-print">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12">
                                <button type="button" class="btn btn-info" onclick="print()"><i class="fas fa-print"></i> Imprimir / Salvar PDF</button>
                                </div>
                            </div>
                            <form action="/admin/relatorioFaturamentoPorPeriodoDetalhado" method="post">
                                <div class="row" style="margin-top: 15px">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">Data Inicio</label>
                                            <input type="date" class="form-control" name="data_inicio" value="<?= $data_inicio ?>" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="">Data Final</label>
                                            <input type="date" class="form-control" name="data_final" value="<?= $data_final ?>" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success" style="margin-top: 30px">Pesquisar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
                                                <th>Razão Social</th>
                                                <th>Nome Fantasia</th>
                                                <th>CNPJ</th>
                                                <th style="color: red">Faturamento</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($empresas)): ?>
                                                <?php foreach($empresas as $empresa): ?>
                                                    <tr>
                                                        <td><?= $empresa['id_empresa'] ?></td>
                                                        <td><?= $empresa['xNome'] ?></td>
                                                        <td><?= $empresa['xFant'] ?></td>
                                                        <td class="cnpj"><?= $empresa['CNPJ'] ?></td>
                                                        <td><?= number_format($empresa['faturamento'], 2, ',', '.') ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="5">Nenhum registro!</td>
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

            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <canvas id="chartjs-1" class="chartjs" width="undefined" height="undefined"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <canvas id="chartjs-4" class="chartjs" width="undefined" height="undefined"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    new Chart(document.getElementById("chartjs-1"), {
        "type": "bar",
        "data": {
            "labels": [
                <?php foreach($empresas as $empresa): ?>
                    "<?= $empresa['xFant'] ?>",
                <?php endforeach; ?>
            ],
            "datasets": [{
                "label": "Faturamento das Empresa no Período",
                "data": [
                    <?php foreach($empresas as $empresa): ?>
                        "<?= $empresa['faturamento'] ?>",
                    <?php endforeach; ?>
                ],
                "fill": false,
                "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)", "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"],
                "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)", "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"],
                "borderWidth": 1
            }]
        },
        "options": {
            "scales": {
                "yAxes": [{
                    "ticks": {
                        "beginAtZero": true
                    }
                }]
            }
        }
    });

    new Chart(document.getElementById("chartjs-4"), {
        "type": "doughnut",
        "data": {
            "labels": [
                <?php foreach($empresas as $empresa): ?>
                    "<?= $empresa['xFant'] ?>",
                <?php endforeach; ?>
            ],
            "datasets": [{
                "label": "My First Dataset",
                "data": [
                    <?php foreach($empresas as $empresa): ?>
                        "<?= $empresa['faturamento'] ?>",
                    <?php endforeach; ?>
                ],
                "backgroundColor": ["rgb(255, 99, 132)", "rgb(54, 162, 235)", "rgb(255, 205, 86)"]
            }]
        }
    });
</script>