<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <?php $session = session() ?>
                    <h1 class="m-0 text-dark">Seja bem vindo!</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">Inicio</li>
                    </ol>
                </div>
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-6">

                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3><?= $qtde_clientes ?></h3>
                            <p>Clientes</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <a href="/clientes" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-6">

                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3><?= $qtde_produtos ?></h3>
                            <p>Produtos</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-box-open"></i>
                        </div>
                        <a href="/produtos" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-6">

                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3><?= $qtde_vendas ?></h3>
                            <p>Vendas</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <a href="/vendas" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-6">

                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3><?= $qtde_lancamentos ?></h3>
                            <p>Lançamentos</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-hand-holding-usd"></i>
                        </div>
                        <a href="/lancamentos" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-6">
                    <div class="small-box bg-primary">
                        <div class="inner">
                            <h3><?= number_format($faturamento, 2, ',', '.') ?></h3>
                            <p>Faturamento</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-usd"></i>
                        </div>
                        <a href="/orcamentos" style="color: black" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

                <div class="col-lg-2 col-6">
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3><?= $qtde_orcamentos ?></h3>
                            <p>Orçamentos</p>
                        </div>
                        <div class="icon">
                            <i class="fas fa-list"></i>
                        </div>
                        <a href="#" class="small-box-footer">Acessar <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-lg-8">
                    <div class="card">
                        <canvas id="chartjs-1" class="chartjs" width="undefined" height="undefined"></canvas>

                        <script>
                            new Chart(document.getElementById("chartjs-1"), {
                                "type": "bar",
                                "data": {
                                    "labels": [
                                        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
                                    ],
                                    "datasets": [{
                                        "label": "Faturamento Diário",
                                        "data": [
                                            <?php foreach ($faturamento_diario as $fat) : ?>
                                                <?= $fat ?>,
                                            <?php endforeach; ?>
                                        ],
                                        "fill": false,
                                        "backgroundColor": ["#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF"],
                                        "borderColor": ["#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF"],
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
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="2" style="text-align: center;">ANALISES RÁPIDAS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><b>Faturamento Total:</b></td>
                                    <td><?= number_format($somatorio_fat_diario, 2, ',', '.') ?></td>
                                </tr>
                                <tr>
                                    <td><b>Média Fat. 30d:</b></td>
                                    <td><?= number_format($somatorio_fat_diario / 30, 2, ',', '.') ?></td>
                                </tr>
                                <tr>
                                    <td><b>Qtde dias S/ Fat.:</b></td>
                                    <td><?= $qtde_dias_sem_fat ?></td>
                                </tr>
                                <tr>
                                    <td><b>Qtde dias no mês.:</b></td>
                                    <td><?= date('t') ?></td>
                                </tr>
                                <tr>
                                    <td><b>Dia maior Fat.:</b></td>
                                    <td><?= $dia_maior_fat ?></td>
                                </tr>
                                <tr>
                                    <td><b>Maior Fat. Diário:</b></td>
                                    <td><?= number_format($maior_fat_diario, 2, ',', '.') ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <!-- BAR CHART -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Gráfico Fat. Anual</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="chartjs-line" class="chartjs" width="undefined" height="undefined"></canvas>

                            <script>
                                new Chart(document.getElementById("chartjs-line"), {
                                    "type": "line",
                                    "data": {
                                        "labels": [
                                            <?php foreach ($nomes_meses as $nome) : ?> "<?= $nome ?>",
                                            <?php endforeach; ?>
                                        ],
                                        "datasets": [{
                                            "label": "Faturamento",
                                            "data": [
                                                <?php foreach ($faturamento_por_meses as $fat) : ?>
                                                    <?= $fat ?>,
                                                <?php endforeach; ?>
                                            ],
                                            "fill": false,
                                            "backgroundColor": ["#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF"],
                                            "borderColor": ["#007BFF"],
                                            "borderWidth": 3
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
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <!-- BAR CHART -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Gráfico Fat. Anual</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <canvas id="chartjs-bar" class="chartjs" width="undefined" height="undefined"></canvas>

                            <script>
                                new Chart(document.getElementById("chartjs-bar"), {
                                    "type": "bar",
                                    "data": {
                                        "labels": [
                                            <?php foreach ($nomes_meses as $nome) : ?> "<?= $nome ?>",
                                            <?php endforeach; ?>
                                        ],
                                        "datasets": [{
                                            "label": "Faturamento",
                                            "data": [
                                                <?php foreach ($faturamento_por_meses as $fat) : ?>
                                                    <?= $fat ?>,
                                                <?php endforeach; ?>
                                            ],
                                            "fill": false,
                                            "backgroundColor": ["#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF"],
                                            "borderColor": ["#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF", "#007BFF"],
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
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Contas a Receber <?= date('m/Y') ?></h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover text-nowrap table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Nome</th>
                                        <th>Vencimento</th>
                                        <th>Valor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($contas_receber)) : ?>
                                        <?php foreach ($contas_receber as $conta) : ?>
                                            <tr>
                                                <td><?= $conta['status'] ?></td>
                                                <td><?= $conta['nome'] ?></td>
                                                <td><?= $conta['data_de_vencimento'] ?></td>
                                                <td><?= number_format($conta['valor'], 2, ',', '.') ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else : ?>
                                        <tr>
                                            <td colspan="4">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Contas a Pagar <?= date('m/Y') ?></h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover text-nowrap table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Nome</th>
                                        <th>Vencimento</th>
                                        <th>Valor</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($contas_pagar)) : ?>
                                        <?php foreach ($contas_pagar as $conta) : ?>
                                            <tr>
                                                <td><?= $conta['status'] ?></td>
                                                <td><?= $conta['nome'] ?></td>
                                                <td><?= $conta['data_de_vencimento'] ?></td>
                                                <td><?= number_format($conta['valor'], 2, ',', '.') ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else : ?>
                                        <tr>
                                            <td colspan="4">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->