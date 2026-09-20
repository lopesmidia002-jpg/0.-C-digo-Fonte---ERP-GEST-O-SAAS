<!DOCTYPE html>
<html lang="pt_BR">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>PDV :: Ponto de Venda</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/fontawesome-free/css/all.css') ?>">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.css') ?>">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/datatables-bs4/css/dataTables.bootstrap4.css') ?>">
    <!-- Select2 -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/select2/css/select2.css') ?>">
    <link rel="stylesheet" href="<?= base_url('theme/plugins/select2-bootstrap4-theme/select2-bootstrap4.css') ?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url('theme/dist/css/adminlte.css') ?>">
    <!-- Style -->
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css') ?>">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- ========= Scripts com prioridade ============= -->
    <!-- jQuery -->
    <script src="<?= base_url('theme/plugins/jquery/jquery.js') ?>"></script>
    <!-- SweetAlert2 -->
    <script src="<?= base_url('theme/plugins/sweetalert2/sweetalert2.js') ?>"></script>
    <!-- OPTIONAL SCRIPTS -->
    <script src="<?= base_url('theme/plugins/chart.js/Chart.min.js') ?>"></script>
</head>

<body style="background: lightgrey">
    <!-- Modal Altera Quantidade -->
    <div class="modal fade" id="alterar-qtd-do-produto">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Alterar QTD</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/pdv/alteraQtdDoProduto/<?= $id_caixa ?>" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Nova QTD</label>
                                    <input type="text" class="form-control" id="altera_qtd_do_produto_quantidade" name="quantidade" onkeyup="trocaVirguraPorPonto('altera_qtd_do_produto_quantidade')">
                                    <input type="hidden" class="form-control" id="altera_qtd_do_produto_id_pdv_produto" name="id_produto_pdv" onkeyup="trocaVirguraPorPonto('altera_qtd_do_produto_id_pdv_produto')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Continuar</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal Altera Valor Unitário -->
    <div class="modal fade" id="alterar-valor-unitario-do-produto">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Alterar Valor Unitário</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/pdv/alteraValorUnitarioDoProduto/<?= $id_caixa ?>" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Valor Unitário</label>
                                    <input type="text" class="form-control" id="altera_valor_unitario_do_produto_valor_unitario" name="valor_unitario" onkeyup="trocaVirguraPorPonto('altera_valor_unitario_do_produto_valor_unitario')">
                                    <input type="hidden" class="form-control" id="altera_valor_unitario_do_produto_id_pdv_produto" name="id_produto_pdv" onkeyup="trocaVirguraPorPonto('altera_valor_unitario_do_produto_id_pdv_produto')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Continuar</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal Altera Desconto -->
    <div class="modal fade" id="alterar-desconto-do-produto">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Alterar Desconto</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/pdv/alteraDescontoDoProduto/<?= $id_caixa ?>" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Desconto</label>
                                    <input type="text" class="form-control" id="altera_desconto_do_produto_valor_unitario" name="desconto" onkeyup="trocaVirguraPorPonto('altera_desconto_do_produto_valor_unitario')">
                                    <input type="hidden" class="form-control" id="altera_desconto_do_produto_id_pdv_produto" name="id_produto_pdv" onkeyup="trocaVirguraPorPonto('altera_desconto_do_produto_id_pdv_produto')">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Continuar</button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal Finalizar Venda -->
    <div class="modal fade" id="finalizar-venda">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Valor à Pagar: <b>R$ <span id="valor_a_pagar_informativo"><?= $valor_a_pagar['valor_final'] ?></span></b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Valor Recebido</label>
                                    <input type="text" class="form-control" id="valor_recebido" onkeyup="calculaTroco()" style="height: 70px; font-size: 50px; text-align: center">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Troco</label>
                                    <input type="text" class="form-control" id="troco" disabled="" style="height: 70px; font-size: 50px; text-align: center">
                                </div>
                            </div>
                            <input type="hidden" class="form-control" id="desconto" onkeyup="calculaDescontoGeral()" value="0">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label>Forma de Pagamento</label>
                                    <select class="form-control select2" id="forma_de_pagamento" style="width: 100%;">
                                        <?php foreach ($formas_de_pagamento as $forma) : ?>
                                            <option value="<?= $forma['nome'] ?>"><?= $forma['nome'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Vendedor</label>
                                    <select class="form-control select2" id="id_vendedor" style="width: 100%;">
                                        <?php foreach ($vendedores as $vendedor) : ?>
                                            <option value="<?= $vendedor['id_vendedor'] ?>"><?= $vendedor['nome'] ?></option>]
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label>Cliente</label>
                                    <select class="form-control select2" id="id_cliente" style="width: 100%;">
                                        <?php foreach ($clientes as $cliente) : ?>
                                            <?php if ($cliente['tipo'] == 1) : ?>
                                                <option value="<?= $cliente['id_cliente'] ?>"><?= $cliente['nome'] ?></option>]
                                            <?php else : ?>
                                                <option value="<?= $cliente['id_cliente'] ?>"><?= $cliente['razao_social'] ?></option>
                                            <?php endif; ?>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="finalizaVenda()">Finalizar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal CPF/CNPJ na Nota -->
    <div class="modal fade" id="modal-cpf-cnpj-na-nota">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">CPF ou CNPJ na Nota</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Tipo</label>
                                <select class="form-control select2" id="tipo" onchange="alteraTipoIdentificacaoNaNota()" style="width: 100%">
                                    <option value="SEM" selected>SEM CPF/CNPJ NA NOTA</option>
                                    <option value="CPF">CPF</option>
                                    <option value="CNPJ">CNPJ</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">CPF</label>
                                <input type="text" class="form-control cpf" id="cpf" name="CPF" disabled required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">CNPJ</label>
                                <input type="text" class="form-control cnpj" id="cnpj" name="CNPJ" disabled required>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-success" onclick="finalizaVendaEmiteNFCe()">Emitir NFCe</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal LOADING -->
    <div class="modal fade no-print" id="modal-loading">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="<?= base_url('assets/img/loading.gif') ?>" alt="Aguarde carregando.." style="width: 100%">
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal DANFCE -->
    <div class="modal fade" id="modal-danfce">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Imprimir Cupom Fiscal - DANFCe</h4>
                    <button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <a id="a-danfce" href="" target="_blank" class="btn btn-success">Imprimir Cupom Fiscal - DANFCe</a>
                    <button type="button" class="btn btn-primary" onclick="location.reload()">Fechar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- Modal CUPOM NÃO FISCAL -->
    <div class="modal fade" id="modal-cupom-nao-fiscal">
        <div class="modal-dialog modal-md" style="width: 300px"> <!-- 300px = 80mm -->
            <div class="modal-content">
                <div class="modal-header no-print">
                    <h4 class="modal-title">Cupom não fiscal <button type="button" class="btn btn-success style-action" onclick="print()"><i class="fas fa-print"></i></button></h4>
                    <button type="button" class="close" onclick="location.reload()" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="cupom-nao-fiscal"></div>
                </div>
                <div class="modal-footer justify-content-between no-print">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">Fechar</button>
                    <button type="button" class="btn btn-success" onclick="print()"><i class="fas fa-print"></i> Imprimir Cupom</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="container-fluid no-print" style="margin-top: 15px">
        <div class="row">
            <div class="col-lg-4">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Pesq. produto</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <form action="/pdv/adicionaProdutoPorCodigoDeBarras/<?= $id_caixa ?>" method="post">
                                    <div class="form-group">
                                        <label for="">Cód. de barras</label>
                                        <input type="text" class="form-control" name="codigo_de_barras" autofocus="" <?= (empty($produtos)) ? "disabled" : "" ?>>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label>Pesq. produto</label>
                                    <select class="form-control select2" id="pesq_de_produto_por_nome" onchange="adicionaProdutoPorNome()" style="width: 100%;" <?= (empty($produtos)) ? "disabled" : "" ?>>
                                        <?php if (!empty($produtos)) : ?>
                                            <option value="" selected="selected">Selecione</option>
                                            <?php foreach ($produtos as $produto) : ?>
                                                <option value="<?= $produto['id_produto'] ?>"><?= $produto['nome'] ?></option>
                                            <?php endforeach; ?>
                                        <?php else : ?>
                                            <option value="">Nenhum produto cadastrado!</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Valor à Pagar</label>
                                    <input type="text" class="form-control" style="height: 65px; text-align: center; font-size: 50px" value="<?= (!empty($valor_a_pagar['valor_final'])) ? number_format($valor_a_pagar['valor_final'], 2, ',', '.') : "R$ 0,00" ?>" disabled="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#finalizar-venda" <?= (!empty($valor_a_pagar['valor_final'])) ? "" : "disabled" ?>>Finalizar Venda</button>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <div class="col-lg-8">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Produtos</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Cód.</th>
                                            <th>Nome</th>
                                            <th>Qtd</th>
                                            <th>Valor Unit.</th>
                                            <th>Subtotal</th>
                                            <th>Desconto</th>
                                            <th>Valor Final</th>
                                            <th style="width: 10px; text-align: center">#</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if (!empty($produtos_do_pdv)) : ?>
                                            <?php foreach ($produtos_do_pdv as $produto) : ?>
                                                <tr>
                                                    <td><?= $produto['id_produto'] ?></td>
                                                    <td><?= $produto['nome'] ?></td>
                                                    <td>
                                                        <a href="#" data-toggle="modal" data-target="#alterar-qtd-do-produto" onclick="preparaParaAlterarQtdDoProduto(<?= $produto['id_produto_pdv'] ?>, <?= $produto['quantidade'] ?>)">
                                                            <?= $produto['quantidade'] ?>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-toggle="modal" data-target="#alterar-valor-unitario-do-produto" onclick="preparaParaAlterarValoUnitarioDoProduto(<?= $produto['id_produto_pdv'] ?>, <?= $produto['valor_unitario'] ?>)">
                                                            <?= number_format($produto['valor_unitario'], 2, ',', '.') ?>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <?= number_format($produto['subtotal'], 2, ',', '.') ?>
                                                    </td>
                                                    <td>
                                                        <a href="#" data-toggle="modal" data-target="#alterar-desconto-do-produto" onclick="preparaParaAlterarDescontoDoProduto(<?= $produto['id_produto_pdv'] ?>, <?= $produto['desconto'] ?>)">
                                                            <?= number_format($produto['desconto'], 2, ',', '.') ?>
                                                        </a>
                                                    </td>
                                                    <td><?= number_format($produto['valor_final'], 2, ',', '.') ?></td>
                                                    <td>
                                                        <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse produto da venda?', '/pdv/removeProdutoDoPdv/<?= $id_caixa ?>/<?= $produto['id_produto_pdv'] ?>')"><i class="fas fa-trash"></i></button>
                                                    </td>
                                                </tr>
                                            <?php endforeach; ?>
                                        <?php else : ?>
                                            <tr>
                                                <td colspan="8">Nenhum produto!</td>
                                            </tr>
                                        <?php endif; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <!-- <div class="card-footer">
                        Qtd de produtos: 10, Valor final: 110,65.
                    </div> -->
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>

    <input type="hidden" id="aux_id_venda">

    <!-- REQUIRED SCRIPTS -->
    <!-- Bootstrap 4 -->
    <script src="<?= base_url('theme/plugins/bootstrap/js/bootstrap.bundle.js') ?>"></script>
    <!-- Select2 -->
    <script src="<?= base_url('theme/plugins/select2/js/select2.full.js') ?>"></script>
    <!-- DataTables -->
    <script src="<?= base_url('theme/plugins/datatables/jquery.dataTables.js') ?>"></script>
    <script src="<?= base_url('theme/plugins/datatables-bs4/js/dataTables.bootstrap4.js') ?>"></script>
    <!-- AdminLTE App -->
    <script src="<?= base_url('theme/dist/js/adminlte.js') ?>"></script>
    <!-- Plugin Mascaras -->
    <script src="<?= base_url('assets/js/jquery.mask.js') ?>"></script>
    <!-- Scripts Mascaras -->
    <script src="<?= base_url('assets/js/mascaras.js') ?>"></script>
    <script>
        $(function() {
            //Initialize Select2 Elements
            $('.select2').select2()
            $('.select2-1').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
        });

        function trocaVirguraPorPonto(id) {
            var valor = document.getElementById(id).value;
            document.getElementById(id).value = valor.replace(',', '.')
        }

        function confirmaAcaoExcluir(msg, rota) {
            if (confirm(msg)) {
                window.location.href = rota;
            }
        }

        function adicionaProdutoPorNome() {
            var id_produto = document.getElementById('pesq_de_produto_por_nome').value;
            window.location.href = "/pdv/adicionaProdutoPorNome/<?= $id_caixa ?>/" + id_produto;
        }

        function calculaTroco() {
            trocaVirguraPorPonto('valor_recebido'); // Troca a virgula pelo ponto se ouver

            var valor_recebido = document.getElementById('valor_recebido').value;
            var valor_a_pagar = document.getElementById('valor_a_pagar_informativo').innerHTML;

            document.getElementById('troco').value = (valor_recebido - valor_a_pagar).toFixed(2);
        }

        function preparaParaAlterarQtdDoProduto(id_produto_pdv, quantidade) {
            document.getElementById('altera_qtd_do_produto_quantidade').value = quantidade;
            document.getElementById('altera_qtd_do_produto_id_pdv_produto').value = id_produto_pdv;
        }

        function preparaParaAlterarValoUnitarioDoProduto(id_produto_pdv, valor_unitario) {
            document.getElementById('altera_valor_unitario_do_produto_valor_unitario').value = valor_unitario;
            document.getElementById('altera_valor_unitario_do_produto_id_pdv_produto').value = id_produto_pdv;
        }

        function preparaParaAlterarDescontoDoProduto(id_produto_pdv, desconto) {
            document.getElementById('altera_desconto_do_produto_valor_unitario').value = desconto;
            document.getElementById('altera_desconto_do_produto_id_pdv_produto').value = id_produto_pdv;
        }

        function finalizaVenda() {
            var valor_a_pagar, desconto, valor_recebido, troco, forma_de_pagamento, id_cliente, id_vendedor;

            valor_a_pagar      = <?= (!empty($valor_a_pagar['valor_final'])) ? $valor_a_pagar['valor_final'] : "0" ?>;
            valor_recebido     = document.getElementById('valor_recebido').value;
            troco              = document.getElementById('troco').value;
            forma_de_pagamento = document.getElementById('forma_de_pagamento').value;
            id_cliente         = document.getElementById('id_cliente').value;
            id_vendedor        = document.getElementById('id_vendedor').value;

            $('#finalizar-venda').modal('hide');
            $('#modal-loading').modal('show');

            $.post(
                "/pdv/finalizaVenda/<?= $id_caixa ?>", {
                    valor_a_pagar:      valor_a_pagar,
                    desconto:           desconto,
                    valor_recebido:     valor_recebido,
                    troco:              troco,
                    forma_de_pagamento: forma_de_pagamento,
                    id_vendedor:        id_vendedor,
                    id_cliente:         id_cliente
                },

                function(data, status) {
                    if (status == "success") {
                        // Adiciona data (cupom não fiscal) no modal e exibe ele
                        document.getElementById('cupom-nao-fiscal').innerHTML = data;
                        $('#modal-cupom-nao-fiscal').modal('show');
                    }
                }
            );
        }
    </script>

    <script>
        $(function() {
            // -------------- ALERTAS ---------------- //
            <?php
                $session = session();
                $alert = $session->getFlashdata('alert');

                if (isset($alert)) : ?>

                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 5000
                    });

                    Toast.fire({
                        type: '<?= $alert['type'] ?>',
                        title: '<?= $alert['title']?>'
                    })
                    
                <?php endif;
            ?>
        });
    </script>
</body>

</html>