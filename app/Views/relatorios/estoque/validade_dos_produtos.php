<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card no-print">
                <div class="card-body">
                    <form action="/relatorios/validadeDosProdutos" method="post">
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Critério</label>
                                    <select class="form-control select2" name="criterio">
                                        <?php if($criterio == 0): ?>
                                            <option value="0" selected>Vencidos</option>
                                            <option value="1">Vence hoje</option>
                                            <option value="2">Vence nos próximos 3 dias</option>
                                            <option value="3">Vence nos próximos 7 dias</option>
                                            <option value="4">Vence nos próximos 15 dias</option>
                                            <option value="5">Vence nos próximos 31 dias</option>
                                        <?php elseif($criterio == 1): ?>
                                            <option value="0">Vencidos</option>
                                            <option value="1" selected>Vence hoje</option>
                                            <option value="2">Vence nos próximos 3 dias</option>
                                            <option value="3">Vence nos próximos 7 dias</option>
                                            <option value="4">Vence nos próximos 15 dias</option>
                                            <option value="5">Vence nos próximos 31 dias</option>
                                        <?php elseif($criterio == 2): ?>
                                            <option value="0">Vencidos</option>
                                            <option value="1">Vence hoje</option>
                                            <option value="2" selected>Vence nos próximos 3 dias</option>
                                            <option value="3">Vence nos próximos 7 dias</option>
                                            <option value="4">Vence nos próximos 15 dias</option>
                                            <option value="5">Vence nos próximos 31 dias</option>
                                        <?php elseif($criterio == 3): ?>
                                            <option value="0">Vencidos</option>
                                            <option value="1">Vence hoje</option>
                                            <option value="2">Vence nos próximos 3 dias</option>
                                            <option value="3" selected>Vence nos próximos 7 dias</option>
                                            <option value="4">Vence nos próximos 15 dias</option>
                                            <option value="5">Vence nos próximos 31 dias</option>
                                        <?php elseif($criterio == 4): ?>
                                            <option value="0">Vencidos</option>
                                            <option value="1">Vence hoje</option>
                                            <option value="2">Vence nos próximos 3 dias</option>
                                            <option value="3">Vence nos próximos 7 dias</option>
                                            <option value="4" selected>Vence nos próximos 15 dias</option>
                                            <option value="5">Vence nos próximos 31 dias</option>
                                        <?php elseif($criterio == 5): ?>
                                            <option value="0">Vencidos</option>
                                            <option value="1">Vence hoje</option>
                                            <option value="2">Vence nos próximos 3 dias</option>
                                            <option value="3">Vence nos próximos 7 dias</option>
                                            <option value="4">Vence nos próximos 15 dias</option>
                                            <option value="5" selected>Vence nos próximos 31 dias</option>
                                        <?php endif; ?>
                                    </select>
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
                                    <table id="" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Cód.</th>
                                                <th>Nome</th>
                                                <th>Un</th>
                                                <th>Cód. Barras</th>
                                                <th>Qtd</th>
                                                <th>Qtd M.</th>
                                                <th>Localização</th>
                                                <th>Validade</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($produtos)): ?>
                                                <?php foreach($produtos as $produto): ?>
                                                    <tr>
                                                        <td><?= $produto['id_produto'] ?></td>
                                                        <td><?= $produto['nome'] ?></td>
                                                        <td><?= $produto['unidade'] ?></td>
                                                        <td><?= ($produto['codigo_de_barras'] != 0) ? $produto['codigo_de_barras'] : "S/N" ?></td>
                                                        <td><?= $produto['quantidade'] ?></td>
                                                        <td><?= $produto['quantidade_minima'] ?></td>
                                                        <td><?= ($produto['localizacao'] != "") ? $produto['localizacao'] : "Não Cad." ?></td>
                                                        <td><?= ($produto['validade'] != "0000-00-00") ? date('d/m/Y', strtotime($produto['validade'])) : "Não cadastrado!" ?></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="10">Nenhum registro!</td>
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