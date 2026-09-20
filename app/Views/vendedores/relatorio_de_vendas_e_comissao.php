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
            
            <div class="card">
                <!-- /.card-body -->
                <div class="card-body">
                    <form action="/vendedores/relatorioDeVendasComissao/<?= $id_vendedor ?>" method="post">
                        <div class="row">
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
                                    <button type="submit" class="btn btn-success" style="margin-top: 30px">Gerar Relatório</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <div class="card">
                <!-- /.card-body -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th colspan="10" style="text-align: center">RELATÓRIO DE PRODUTOS VENDIDOS + COMISSÃO CALCULADA</th>
                            </tr>
                            <tr>
                                <th>Nome</th>
                                <th>Unidade</th>
                                <th>Quantidade</th>
                                <th>Valor Unitário</th>
                                <th>Subtotal</th>
                                <th>Desconto</th>
                                <th>Valor Final</th>
                                <th>Tipo Comissão</th>
                                <th>Porc. / Valor</th>
                                <th>Valor da Comissão</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(!empty($produtos_vendidos_pelo_vendedor)): ?>
                               
                                <?php $valor_total_da_comissao = 0; ?>
                                
                                <?php foreach($produtos_vendidos_pelo_vendedor as $produto): ?>
                                    <tr>
                                        <td><?= $produto['nome'] ?></td>
                                        <td><?= $produto['unidade'] ?></td>
                                        <td><?= $produto['quantidade'] ?></td>
                                        <td><?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                        <td><?= number_format($produto['subtotal'], 2, ',', '.') ?></td>
                                        <td><?= number_format($produto['desconto'], 2, ',', '.') ?></td>
                                        <td><?= number_format($produto['valor_final'], 2, ',', '.') ?></td>
                                        <td><?= ($produto['tipo_da_comissao'] == 1) ? "Porcentagem" : "Valor" ?></td>
                                        <td><?= ($produto['tipo_da_comissao'] == 1) ? $produto['porcentagem_comissao']."%" : number_format($produto['valor_comissao'], 2, ',', '.') ?></td>

                                        <?php $valor_da_comissao_porcentagem = ($produto['valor_final'] * $produto['porcentagem_comissao'] / 100) ?>
                                        <?php $valor_da_comissao_valor = ($produto['quantidade'] * $produto['valor_comissao']) ?>

                                        <td><?= ($produto['tipo_da_comissao'] == 1) ? number_format($valor_da_comissao_porcentagem, 2, ',', '.') : number_format($valor_da_comissao_valor, 2, ',', '.') ?></td>
                                    </tr>

                                    <?php
                                    
                                        if($produto['tipo_da_comissao'] == 1):
                                            $valor_total_da_comissao += $valor_da_comissao_porcentagem;
                                        else:
                                            $valor_total_da_comissao += $valor_da_comissao_valor;
                                        endif;

                                    ?>

                                <?php endforeach ?>
                                <tr>
                                    <td colspan="9" style="text-align: center"><b>VALOR TOTAL DA COMISSÃO</b></td>
                                    <td><b><?= number_format($valor_total_da_comissao, 2, ',', '.') ?></b></td>
                                </tr>
                            <?php else: ?>
                                <tr>
                                    <td colspan="10">Nenhum registro!</td>
                                </tr>
                            <?php endif ?>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->