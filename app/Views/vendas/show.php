<!-- Modal CUPOM NÃO FISCAL -->
<div class="modal fade" id="modal-cupom-nao-fiscal">
    <div class="modal-dialog modal-md" style="width: 300px"> <!-- 300px = 80mm -->
        <div class="modal-content">
            <div class="modal-header no-print">
                <h4 class="modal-title">Cupom não fiscal <button type="button" class="btn btn-success style-action" onclick="print()"><i class="fas fa-print"></i></button></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="cupom-nao-fiscal">
                    <p style='text-align: center'>
                        <b><?= $empresa['xFant'] ?></b><br>
                        <?= $empresa['xNome'] ?><br>
                        <?= $empresa['xLgr'] ?>, <?= $empresa['xCpl'] ?>, <?= $empresa['nro'] ?> - <?= $empresa['municipio'] ?> - <?= $empresa['uf'] ?>.<br>
                        <?= $empresa['fone'] ?>
                    </p>

                    <p>
                        <b>CNPJ:</b> <span class="cnpj"><?= $empresa['CNPJ'] ?></span><br>
                        <b>Cliente:</b> <?= $venda['nome_do_cliente'] ?><br>
                        <?= date('d/m/Y', strtotime($venda['data'])) ?> às <?= $venda['hora'] ?> - <b>Nº <?= $venda['id_venda'] ?></b>
                    </p>

                    <hr>

                    <table width='100%'>
                        <thead>
                            <tr>
                                <th>Cód.</th>
                                <th>Desc.</th>
                                <th>Qtd X Unit.</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($produtos_da_venda as $produto) : ?>
                                <tr>
                                    <td><?= $produto['id_produto'] ?></td>
                                    <td><?= $produto['nome'] ?></td>
                                    <td><?= $produto['quantidade'] ?> x <?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['valor_final'], 2, ',', '.') ?></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>

                    <hr>

                    <p>
                        <b>Total:</b> <?= number_format($venda['valor_a_pagar'], 2, ',', '.') ?><br>
                        <b>Recebido:</b> <?= number_format($venda['valor_recebido'], 2, ',', '.') ?><br>
                        <b>Troco:</b> <?= number_format($venda['troco'], 2, ',', '.') ?><br>
                        <b>Forma de PGTO:</b> <?= $venda['forma_de_pagamento'] ?>
                    </p>

                    <hr>

                    <p><b>Vendedor:</b> <?= $venda['nome_do_vendedor'] ?></p>

                    <hr>

                    <p style='text-align: center'>
                        ____________________________
                        <br>
                        Assinatura do Cliente
                    </p>
                </div>
            </div>
            <div class="modal-footer justify-content-between no-print">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-success" onclick="print()"><i class="fas fa-print"></i> Imprimir Cupom</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper no-print">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="/vendas" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                </div>
                <!-- /.card-header -->
                <div class="card-body no-print">
                    <div class="row">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-cupom-nao-fiscal" onclick="preparaImpressao()"><i class="fas fa-print"></i> Cupom NÃO Fiscal</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Cód. da Venda</label>
                                <input type="text" class="form-control" value="<?= $venda['id_venda'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Valor da Venda</label>
                                <input type="text" class="form-control" id="valor_da_venda" value="" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Valor a Pagar</label>
                                <input type="text" class="form-control" value="<?= number_format($venda['valor_a_pagar'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <!-- <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Desconto</label>
                                <input type="text" class="form-control" value="<?= $venda['desconto'] ?>" disabled="">
                            </div>
                        </div> -->
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Valor Recebido</label>
                                <input type="text" class="form-control" value="<?= number_format($venda['valor_recebido'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Troco</label>
                                <input type="text" class="form-control" value="<?= number_format($venda['troco'], 2, ',', '.') ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Forma de Pagamento</label>
                                <input type="text" class="form-control" value="<?= $venda['forma_de_pagamento'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Cliente</label>
                                <input type="text" class="form-control" value="<?= $venda['nome_do_cliente'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Vendedor</label>
                                <input type="text" class="form-control" value="<?= $venda['nome_do_vendedor'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Cód. do Caixa</label>
                                <input type="text" class="form-control" value="<?= $venda['id_caixa'] ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Data</label>
                                <input type="text" class="form-control" value="<?= date('d/m/Y', strtotime($venda['data'])) ?>" disabled="">
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Hora</label>
                                <input type="text" class="form-control" value="<?= $venda['hora'] ?>" disabled="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th colspan="14" style="text-align: center">PRODUTOS DA VENDA</th>
                            </tr>
                            <tr>
                                <th>Cód.</th>
                                <th>Nome</th>
                                <th>UN</th>
                                <th>Cod. Barras</th>
                                <th>Qtd</th>
                                <th>Valor Unit.</th>
                                <th>Subtotal</th>
                                <th>Desc.</th>
                                <th>Valor Final</th>
                                <th>NCM</th>
                                <th>CSOSN</th>
                                <th>CFOP NFe</th>
                                <th>CFOP NFCe</th>
                                <th>CFOP Externo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $valor_calculado_da_venda = 0 ?>

                            <?php foreach ($produtos_da_venda as $produto) : ?>
                                <tr>
                                    <td><?= $produto['id_produto_da_venda'] ?></td>
                                    <td><?= $produto['nome'] ?></td>
                                    <td><?= $produto['unidade'] ?></td>
                                    <td><?= $produto['codigo_de_barras'] ?></td>
                                    <td><?= $produto['quantidade'] ?></td>
                                    <td><?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['subtotal'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['desconto'], 2, ',', '.') ?></td>
                                    <td><?= number_format($produto['valor_final'], 2, ',', '.') ?></td>
                                    <td><?= $produto['NCM'] ?></td>
                                    <td><?= $produto['CSOSN'] ?></td>
                                    <td><?= $produto['CFOP_NFe'] ?></td>
                                    <td><?= $produto['CFOP_NFCe'] ?></td>
                                    <td><?= $produto['CFOP_Externo'] ?></td>
                                </tr>

                                <?php $valor_calculado_da_venda += $produto['valor_final'] ?>

                            <?php endforeach; ?>
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

<script>
    function alteraTipoIdentificacaoNaNota() {
        var opcao = document.getElementById('tipo').value;

        if (opcao == 'CPF') {
            document.getElementById('cnpj').disabled = true;
            document.getElementById('cpf').disabled = false;
        } else {
            document.getElementById('cnpj').disabled = false;
            document.getElementById('cpf').disabled = true;
        }
    }

    function preparaImpressao() {
        document.getElementById('footer').className += " no-print";
    }

    function habilitaCamposTransporte() {
        var opcao = document.getElementById('id_transportadora').value;

        if (opcao != 0) {
            document.getElementById('qtd_volume').disabled = false;
            document.getElementById('unidade').disabled = false;
            document.getElementById('peso_liquido').disabled = false;
            document.getElementById('peso_bruto').disabled = false;
        } else {
            document.getElementById('qtd_volume').disabled = true;
            document.getElementById('unidade').disabled = true;
            document.getElementById('peso_liquido').disabled = true;
            document.getElementById('peso_bruto').disabled = true;
        }
    }
</script>