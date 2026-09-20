<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <?php if ($caixa['status'] == "Aberto") : ?>
                                <button type="button" class="btn btn-info" onclick="verificaValorDeFechamento()"><i class="fa fa-plus-circle"></i> Fechar Caixa</button>
                                <a href="/caixas/edit/<?= $caixa['id_caixa'] ?>" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</a>
                                <button type="button" class="btn btn-danger" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse caixa? Essa ação não poderá ser desfeita!', '/caixas/delete/<?= $caixa['id_caixa'] ?>')"><i class="fa fa-trash"></i> Excluir</button>
                            <?php else : ?>
                                <a href="/caixas/reabrir/<?= $caixa['id_caixa'] ?>" class="btn btn-info">Reabrir Caixa</a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
            </div>
            <!-- /.card -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-primary card-tabs">
                        <div class="card-header p-0 pt-1">
                            <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="dados_do_caixa-tab" data-toggle="pill" href="#dados_do_caixa" role="tab" aria-controls="dados_do_caixa" aria-selected="true">Dados do Caixa</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="entradas-tab" data-toggle="pill" href="#entradas" role="tab" aria-controls="entradas" aria-selected="false">Entradas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="saidas-tab" data-toggle="pill" href="#saidas" role="tab" aria-controls="saidas" aria-selected="false">Saídas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="resumo-tab" data-toggle="pill" href="#resumo" role="tab" aria-controls="resumo" aria-selected="false">Resumo</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="custom-tabs-one-tabContent">
                                <div class="tab-pane fade show active" id="dados_do_caixa" role="tabpanel" aria-labelledby="dados_do_caixa-tab">
                                    <form id="form-fechar-caixa" action="/caixas/fechar/<?= $caixa['id_caixa'] ?>">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Status</label>
                                                    <input type="text" class="form-control" value="<?= $caixa['status'] ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Data de Abertura</label>
                                                    <input type="text" class="form-control" value="<?= date('d/m/Y', strtotime($caixa['data_de_abertura'])) ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Data de Fechamento</label>
                                                    <input type="text" class="form-control" value="<?= ($caixa['data_de_fechamento'] == "0000-00-00") ? "Não definida!" : date('d/m/Y', strtotime($caixa['data_de_fechamento'])) ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Hora de Abertura</label>
                                                    <input type="text" class="form-control" value="<?= $caixa['hora_de_abertura'] ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Hora de Fechamento</label>
                                                    <input type="text" class="form-control" value="<?= ($caixa['hora_de_fechamento'] == "00:00:00") ? "Não definida!" : $caixa['hora_de_fechamento'] ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Valor Inicial</label>
                                                    <input type="text" class="form-control" value="<?= number_format($caixa['valor_inicial'], 2, ',', '.') ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Valor Total</label>
                                                    <input type="text" class="form-control" value="<?= number_format($somatorio, 2, ',', '.') ?>" disabled="">
                                                </div>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="">Valor de Fechamento</label>
                                                    <input type="text" id="valor_de_fechamento" class="form-control money" id="valor_de_fechamento" name="valor_de_fechamento" value="<?= number_format($caixa['valor_de_fechamento'], 2, ',', '.') ?>" <?= ($caixa['status'] == "Fechado") ? "disabled" : "" ?>>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="">Observações</label>
                                                    <input type="text" id="observacoes" class="form-control" name="observacoes" value="<?= $caixa['observacoes'] ?>" <?= ($caixa['status'] == "Fechado") ? "disabled" : "" ?>>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade" id="entradas" role="tabpanel" aria-labelledby="entradas-tab">
                                    <div class="table-responsive p-0">
                                        <table class="table table-hover text-nowrap table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th colspan="6" style="text-align: center">LANÇAMENTOS</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 35px">Cód.</th>
                                                    <th>Descrição</th>
                                                    <th>Valor</th>
                                                    <th>Data</th>
                                                    <th>Hora</th>
                                                    <th>Observações</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                    $qtd_de_lancamentos = 0;
                                                    $valor_total_de_lancamentos = 0;
                                                ?>
                                                <?php if (!empty($lancamentos)) : ?>
                                                    <?php foreach ($lancamentos as $lancamento) : ?>
                                                        <tr>
                                                            <td><?= $lancamento['id_lancamento'] ?></td>
                                                            <td><?= $lancamento['descricao'] ?></td>
                                                            <td><?= number_format($lancamento['valor'], 2, ',', '.') ?></td>
                                                            <td><?= date('d/m/Y', strtotime($lancamento['data'])) ?></td>
                                                            <td><?= $lancamento['hora'] ?></td>
                                                            <td><?= $lancamento['observacoes'] ?></td>
                                                        </tr>
                                                    <?php
                                                        $qtd_de_lancamentos += 1;
                                                        $valor_total_de_lancamentos += $lancamento['valor'];
                                                    ?>
                                                    <?php endforeach; ?>
                                                <?php else: ?>
                                                    <tr>
                                                        <td colspan="6">Nenhum registro!</td>
                                                    </tr>
                                                <?php endif; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p>
                                        <b>Qtd. de Lançamentos:</b> <?= $qtd_de_lancamentos ?> <br>
                                        <b>Valor Total de Lançamentos:</b> R$ <?= number_format($valor_total_de_lancamentos, 2, ',', '.') ?>
                                    </p>

                                    <br>
                                    <br>
                                    <br>
                                    
                                    <div class="table-responsive p-0">
                                        <table class="table table-hover text-nowrap table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th colspan="8" style="text-align: center">VENDAS</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 35px">Cód.</th>
                                                    <th>Valor</th>
                                                    <th>Desconto</th>
                                                    <th>Recebido</th>
                                                    <th>Troco</th>
                                                    <th>PGTO</th>
                                                    <th>Data</th>
                                                    <th>Hora</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                    $qtd_de_vendas = 0;
                                                    $valor_total_de_vendas = 0;
                                                ?>
                                                <?php if (!empty($vendas)) : ?>
                                                    <?php foreach ($vendas as $venda) : ?>
                                                        <tr>
                                                            <td><?= $venda['id_venda'] ?></td>
                                                            <td><?= number_format($venda['valor_a_pagar'], 2, ',', '.') ?></td>
                                                            <td><?= $venda['desconto'] ?></td>
                                                            <td><?= number_format($venda['valor_recebido'], 2, ',', '.') ?></td>
                                                            <td><?= number_format($venda['troco'], 2, ',', '.') ?></td>
                                                            <td><?= $venda['forma_de_pagamento'] ?></td>
                                                            <td><?= date('d/m/Y', strtotime($venda['data'])) ?></td>
                                                            <td><?= $venda['hora'] ?></td>
                                                        </tr>
                                                        <?php
                                                            $qtd_de_vendas += 1;
                                                            $valor_total_de_vendas += $venda['valor_a_pagar'];
                                                        ?>
                                                    <?php endforeach; ?>
                                                <?php else: ?>
                                                    <tr>
                                                        <td colspan="8">Nenhum registro!</td>
                                                    </tr>
                                                <?php endif; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p>
                                        <b>Qtd. de Vendas:</b> <?= $qtd_de_vendas ?> <br>
                                        <b>Valor Total de Vendas:</b> R$ <?= number_format($valor_total_de_vendas, 2, ',', '.') ?>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="saidas" role="tabpanel" aria-labelledby="saidas-tab">
                                    <div class="table-responsive p-0">
                                        <table class="table table-hover text-nowrap table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th colspan="7" style="text-align: center">RETIRADAS</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 35px">Cód.</th>
                                                    <th>Tipo</th>
                                                    <th>Descrição</th>
                                                    <th>Valor</th>
                                                    <th>Data</th>
                                                    <th>Hora</th>
                                                    <th>Obs</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                    $qtd_de_retiradas = 0;
                                                    $valor_total_de_retiradas = 0;
                                                ?>
                                                <?php if (!empty($retiradas)) : ?>
                                                    <?php foreach ($retiradas as $retirada) : ?>
                                                        <tr>
                                                            <td><?= $retirada['id_retirada'] ?></td>
                                                            <td><?= $retirada['tipo'] ?></td>
                                                            <td><?= $retirada['descricao'] ?></td>
                                                            <td><?= number_format($retirada['valor'], 2, ',', '.') ?></td>
                                                            <td><?= date('d/m/Y', strtotime($retirada['data'])) ?></td>
                                                            <td><?= $retirada['hora'] ?></td>
                                                            <td><?= $retirada['observacoes'] ?></td>
                                                        </tr>
                                                        <?php
                                                            $qtd_de_retiradas += 1;
                                                            $valor_total_de_retiradas += $retirada['valor'];
                                                        ?>
                                                    <?php endforeach; ?>
                                                <?php else: ?>
                                                    <tr>
                                                        <td colspan="7">Nenhum registro!</td>
                                                    </tr>
                                                <?php endif; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                    <p>
                                        <b>Qtd. de Retiradas:</b> <?= $qtd_de_retiradas ?> <br>
                                        <b>Valor Total de Retiradas:</b> R$ <?= number_format($valor_total_de_retiradas, 2, ',', '.') ?>
                                    </p>
                                </div>
                                <div class="tab-pane fade" id="resumo" role="tabpanel" aria-labelledby="resumo-tab">
                                    <div class="table-responsive p-0">
                                        <table class="table table-hover text-nowrap table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th colspan="7" style="text-align: center">RESUMO DO CAIXA</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><b>Valor Inicial do Caixa:</b> <?= number_format($caixa['valor_inicial'], 2, ',', '.') ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Total de Entradas:</b> <?= number_format(($valor_total_de_lancamentos + $valor_total_de_vendas), 2, ',', '.') ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Total de Saídas:</b> <?= number_format($valor_total_de_retiradas, 2, ',', '.') ?></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Saldo Final:</b> <?= number_format((($valor_total_de_lancamentos + $valor_total_de_vendas) - $valor_total_de_retiradas), 2, ',', '.') ?></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    function verificaValorDeFechamento() {
        var valor_de_fechamento = document.getElementById('valor_de_fechamento').value;

        if (valor_de_fechamento != "0,00" && valor_de_fechamento != 0) {
            document.getElementById('form-fechar-caixa').submit();
        } else {
            alert('Informe o valor de fechamento para continuar!');
        }
    }
</script>