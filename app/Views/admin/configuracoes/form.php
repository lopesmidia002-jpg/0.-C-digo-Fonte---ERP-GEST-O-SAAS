<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/configuracoes/store" method="post" enctype="multipart/form-data">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/admin/inicio" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Nome do App</label>
                                    <input type="text" class="form-control" name="nome_do_app" value="<?= (isset($configuracao)) ? $configuracao['nome_do_app'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Razão Social</label>
                                    <input type="text" class="form-control" name="xNome" value="<?= (isset($configuracao)) ? $configuracao['xNome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Nome Fantasia</label>
                                    <input type="text" class="form-control" name="xFant" value="<?= (isset($configuracao)) ? $configuracao['xFant'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">CNPJ</label>
                                    <input type="text" class="form-control cnpj" name="CNPJ" value="<?= (isset($configuracao)) ? $configuracao['CNPJ'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Telefone</label>
                                    <input type="text" class="form-control" name="telefone" value="<?= (isset($configuracao)) ? $configuracao['telefone'] : "" ?>" required="">
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <div class="form-group">
                                    <?php if($configuracao['logomarca'] != ""): ?>
                                        <img src="<?= base_url("assets/img/logomarcas") . "/" . $configuracao['logomarca'] ?>" alt="Logo marcar do App" style="width: 160px;">
                                    <?php else: ?>
                                        <img src="<?= base_url("assets/img/logomarcas") . "/" . "logo-marca.png" ?>" alt="Logo marcar do App" style="width: 160px;">
                                    <?php endif; ?>
                                    <br>
                                    <label for="">Logomarca</label>
                                    <input type="file" class="form-control" name="arquivo" style="padding-bottom: 35px">
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($configuracao)) ? "Atualizar" : "Cadastrar" ?></button>
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