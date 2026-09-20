<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-4">
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                        </div><!-- /.col -->
                        <div class="col-sm-8">
                            <ol class="breadcrumb float-sm-right">
                                <a href="/inventarioDoEstoque/show/<?= $id_inventario ?>" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 450px">DISCRIMINAÇÃO</th>
                                        <th>UNIDADE</th>
                                        <th>QUANTIDADE</th>
                                        <th>VALOR UNITÁRIO</th>
                                        <th style="width: 110px">AÇÕES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($produtos_do_inventario as $produto) : ?>
                                        <tr>
                                            <td><?= $produto['discriminacao'] ?></td>
                                            <td><?= $produto['unidade'] ?></td>
                                            <td><?= $produto['quantidade'] ?></td>
                                            <td><?= number_format($produto['valor_unitario'], 2, ',', '.') ?></td>
                                            <td>
                                                <a href="/inventarioDoEstoque/editProduto/<?= $id_inventario ?>/<?= $produto['id_produto_do_inventario'] ?>" class="btn btn-warning style-action"><i class="fas fa-edit"></i></a>
                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse produto?', '/inventarioDoEstoque/deleteProduto/<?= $id_inventario ?>/<?= $produto['id_produto_do_inventario'] ?>')"><i class="fas fa-trash"></i></button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
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