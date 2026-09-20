<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/inventarioDoEstoque/store_produto" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-4">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-8">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="<?= (isset($produto)) ? "/inventarioDoEstoque/listaProdutos/$id_inventario" : "/inventarioDoEstoque/show/$id_inventario" ?>" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Discriminação</label>
                                    <input type="text" class="form-control" name="discriminacao" value="<?= (isset($produto)) ? $produto['discriminacao'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">UNIDADE</label>
                                    <input type="text" class="form-control" name="unidade" value="<?= (isset($produto)) ? $produto['unidade'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">QUANTIDADE</label>
                                    <input type="number" class="form-control" id="quantidade" name="quantidade" onkeyup="trocaVirguraPorPonto('quantidade')" value="<?= (isset($produto)) ? $produto['quantidade'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">VALOR UNITÁRIO</label>
                                    <input type="text" class="form-control money" id="valor_unitario" name="valor_unitario" value="<?= (isset($produto)) ? $produto['valor_unitario'] : "" ?>" required="">
                                </div>
                            </div>

                            <!-- HIDDENS -->
                            <?php if (isset($produto)) : ?>
                                <input type="hidden" name="id_produto_do_inventario" value="<?= $produto['id_produto_do_inventario'] ?>">
                            <?php endif; ?>

                            <input type="hidden" name="id_inventario" value="<?= $id_inventario ?>">
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($produto)) ? "Atualizar Produto" : "Adicionar Produto" ?></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </form>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->