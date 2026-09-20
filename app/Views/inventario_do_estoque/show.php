<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card no-print">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="/inventarioDoEstoque" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="/inventarioDoEstoque/listaProdutos/<?= $id_inventario ?>" class="btn btn-info"><i class="fas fa-edit"></i> Alterar/Excluir Produto</a>
                            <a href="/inventarioDoEstoque/add/<?= $id_inventario ?>" class="btn btn-info"><i class="fas fa-plus-circle"></i> Adicionar produto</a>
                            <button type="button" class="btn btn-default" onclick="print()"><i class="fas fa-print"></i> Imprimir</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->

            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <table id="" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th colspan="5" style="text-align: center">REGISTRO DE INVENTÁRIO</th>
                                    </tr>
                                    <tr>
                                        <td colspan="1"><b>EMPRESA:</b> <?= $empresa['xNome'] ?></td>
                                        <td colspan="4"><b>CNPJ:</b> <?= $empresa['CNPJ'] ?></td>
                                    </tr>
                                    <tr>
                                        <td><b>INSC. EST.:</b> <?= $empresa['IE'] ?></td>
                                        <td colspan="4"><b>ESTOQUES EXISTENTES EM:</b> <?= date('m/Y', strtotime($inventario['data'])) ?></td>
                                    </tr>
                                    <tr>
                                        <th colspan="3"></th>
                                        <th colspan="2" style="text-align: center">VALORES</th>
                                    </tr>
                                    <tr>
                                        <th style="width: 550px">DISCRIMINAÇÃO</th>
                                        <th>UNIDADE</th>
                                        <th>QUANTIDADE</th>
                                        <th>VALOR UNITÁRIO</th>
                                        <th>TOTAL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $total_geral = 0 ?>
                                    <?php foreach ($produtos_do_inventario as $produto) : ?>
                                        <tr>
                                            <td><?= $produto['discriminacao'] ?></td>
                                            <td><?= $produto['unidade'] ?></td>
                                            <td><?= $produto['quantidade'] ?></td>
                                            <td><?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                            <td><?= number_format($produto['quantidade'] * $produto['valor_unitario'], 2, ',', '.') ?></td>
                                        </tr>
                                        <?php $total_geral += ($produto['quantidade'] * $produto['valor_unitario']) ?>
                                    <?php endforeach; ?>
                                    <tr>
                                        <td colspan="4"><b>TOTAL GERAL:</b></td>
                                        <td><b><?= number_format($total_geral, 2, ',', '.') ?></b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->