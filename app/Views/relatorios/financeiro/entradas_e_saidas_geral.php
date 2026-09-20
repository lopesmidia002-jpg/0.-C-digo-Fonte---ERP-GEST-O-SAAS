<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card no-print">
                <div class="card-body">
                    <form action="/relatorios/entradasSaidasGeral" method="post">
                        <div class="row">
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
                                    <p style="text-align: center"><b><?= $empresa['xNome'] ?></b></p>
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
                                    <table id="" class="table table-bordered">
                                        <!-- <thead>
                                            <tr>
                                                <th>Entradas</th>
                                                <th>Saídas</th>
                                                <th>Saldo</th>
                                            </tr>
                                        </thead> -->
                                        <tbody>
                                            <tr style="background: lightgrey">
                                                <td colspan="2"><b>ENTRADAS</b></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 50px">Lançamentos no Caixa</td>
                                                <td><?= $lancamentos ?></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 50px">Venda</td>
                                                <td><?= $vendas ?></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 50px"><b>Total</b></td>
                                                <td><b><?= $lancamentos + $vendas ?></b></td>
                                            </tr>
                                            <tr style="background: lightgrey">
                                                <td colspan="2"><b>SAÍDAS</b></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 50px">Despesas</td>
                                                <td><?= $despesas ?></td>
                                            </tr>
                                            <tr style="background: lightgrey">
                                                <td><b>SALDO FINAL</b></td>
                                                <td><b><?= $saldo ?></b></td>
                                            </tr>
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
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <!-- BAR CHART -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Relatório DRE Gráfico</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="chartjs-4" class="chartjs" width="undefined" height="undefined"></canvas>

                            <script>
                                new Chart(document.getElementById("chartjs-4"), {
                                    "type": "doughnut",
                                    "data": {
                                        "labels": ["Entradas", "Saídas"],
                                        "datasets": [{
                                            "label": "My First Dataset",
                                            "data": [<?= ($lancamentos + $vendas) . ", " . $despesas ?>],
                                            "backgroundColor": ["rgb(40, 167, 69)", "rgb(255, 99, 132)", "rgb(204,135,20)", "rgb(242,226,5)", "rgb(255,255,82)", "rgb(54, 162, 235)", "rgb(255, 205, 86)"]
                                        }]
                                    }
                                });
                            </script>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>

                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <!-- BAR CHART -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Relatório DRE Gráfico</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="chartjs-1" class="chartjs" width="undefined" height="undefined"></canvas>

                            <script>
                                new Chart(document.getElementById("chartjs-1"), {
                                    "type": "bar",
                                    "data": {
                                        "labels": ["Entradas", "Saídas"],
                                        "datasets": [{
                                            "label": "Mov. Entradas e Saídas",
                                            "data": [<?= ($lancamentos + $vendas) . ", " . $despesas ?>],
                                            "fill": false,
                                            "backgroundColor": ["rgb(40, 167, 69)", "rgb(255, 99, 132)", "rgb(204,135,20)", "rgb(242,226,5)", "rgb(255,255,82)", "rgb(54, 162, 235)", "rgb(255, 205, 86)"],
                                            "borderColor": ["rgb(40, 167, 69)", "rgb(255, 99, 132)", "rgb(204,135,20)", "rgb(242,226,5)", "rgb(255,255,82)", "rgb(54, 162, 235)", "rgb(255, 205, 86)"],
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
                            </script>
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