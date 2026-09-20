<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card no-print">
                <div class="card-body">
                    <form action="/relatorios/faturamentoDiario" method="post">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">

                                    <?php
                                        $meses = [
                                            'Janeiro',
                                            'Fevereiro',
                                            'Março',
                                            'Abril',
                                            'Maio',
                                            'Junho',
                                            'Julho',
                                            'Agosto',
                                            'Setembro',
                                            'Outubro',
                                            'Novembro',
                                            'Dezembro'
                                        ];
                                    ?>

                                    <label for="">Mês</label>
                                    <select class="form-control select2" name="mes" style="width: 100%">
                                        <?php for($i=0; $i<12; $i++): ?>
                                            <option value="<?= $i+1 ?>" <?= ($mes == $i+1) ? "selected" : "" ?>><?= $meses[$i] ?></option>
                                        <?php endfor ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Ano</label>
                                    <select class="form-control select2" name="ano" style="width: 100%">
                                        <?php for($i=2000; $i<=date('Y'); $i++): ?>
                                            <option value="<?= $i ?>" <?= ($ano == $i) ? "selected" : "" ?>><?= $i ?></option>
                                        <?php endfor ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <button type="submit" class="btn btn-success" style="margin-top: 30px">Gerar Relatório</button>
                                <button type="button" class="btn btn-info" onclick="print()" style="margin-top: 30px"><i class="fas fa-print"></i> Imprimir/Salvar PDF</button>
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
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <p>
                                        <b>MÊS:</b> <?= $meses[($mes*1)-1] ?> <br>
                                        <b>ANO:</b> <?= $ano ?> <br>
                                    </p>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-lg-12">
                                    <h4 style="text-align: center">FATURAMENTO DIÁRIO</h4>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">

                                    <?php
                                    
                                        $somatorio_faturamento = 0;
                                        
                                        $maior_faturamento = 0;
                                        
                                        $dia_maior_faturamento = 0;

                                    ?>

                                    <canvas id="chartjs-1" class="chartjs" width="undefined" height="undefined"></canvas>

                                    <script>
                                        new Chart(document.getElementById("chartjs-1"), {
                                            "type": "bar",
                                            "data": {
                                                "labels": [
                                                    <?php for($i=1; $i<=31; $i++)
                                                    {
                                                        echo $i.", ";
                                                    } ?>
                                                ],
                                                "datasets": [{
                                                    "label": "Faturamento Diário",
                                                    "data": [
                                                        <?php
                                                        $dia = 1;

                                                        foreach($faturamentos as $faturamento)
                                                        {
                                                            echo $faturamento.", ";

                                                            $somatorio_faturamento += $faturamento;

                                                            // Pega maior faturamento
                                                            if($faturamento > $maior_faturamento)
                                                            {
                                                                $maior_faturamento = $faturamento;
                                                                $dia_maior_faturamento = $dia;
                                                            }

                                                            $dia += 1;
                                                        } ?>
                                                    ],
                                                    "fill": false,
                                                    "backgroundColor": ["rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", ],
                                                    "borderColor": ["rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", "rgb(40, 167, 69)", ],
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
                                <div class="col-lg-4" style="margin-top: 30px">
                                    <p><b>Total Fat.: <?= number_format($somatorio_faturamento, 2, ',', '.') ?></b></p>
                                    <p><b>Média Fat. 30d: <?= number_format(($somatorio_faturamento / 30), 2, ',', '.') ?></b></p>
                                    <p><b>Dia Maior Fat.: <?= $dia_maior_faturamento ?></b></p>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 50px">
                                <div class="col-lg-12">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th colspan="4" style="text-align: center">FATURAMENTO DIÁRIO DETALHADO</th>
                                            </tr>
                                            <tr>
                                                <th>Dia</th>
                                                <th>Total Vendas</th>
                                                <th>Total Lançamentos</th>
                                                <th>Total Final</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($dados_fat)): ?>
                                                <?php foreach($dados_fat as $dados): ?>
                                                    <tr>
                                                        <td><?= $dados['dia'] ?></td>
                                                        <td><?= ($dados['vendas'] == null) ? number_format(0, 2, ',', '.') : number_format($dados['vendas'], 2, ',', '.') ?></td>
                                                        <td><?= ($dados['lancamentos'] == null) ? number_format(0, 2, ',', '.') : number_format($dados['lancamentos'], 2, ',', '.') ?></td>
                                                        <td><?= number_format((($dados['vendas'] == null) ? 0 : $dados['vendas']) + (($dados['lancamentos'] == null) ? 0 : $dados['lancamentos']), 2, ',', '.') ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
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