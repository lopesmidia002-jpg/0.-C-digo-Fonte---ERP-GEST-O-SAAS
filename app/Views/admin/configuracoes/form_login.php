<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/configuracoes/storeLogin" method="post" enctype="multipart/form-data">
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
                                    <label for="">Senha atual</label>
                                    <input type="text" class="form-control" name="senha" value="<?= (isset($login)) ? $login['senha'] : "" ?>">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Imagem de Fundo do LOGIN</label>
                                    <?php if(($configuracao['arquivo-imagem-de-fundo-login'] != "")): ?>
                                        <img src="<?= base_url('assets/img') . "/" . $configuracao['arquivo-imagem-de-fundo-login'] ?>" class="img-fluid" alt="Imagem de Fundo do Login">
                                    <?php endif; ?>

                                    <div class="input-group">
                                        <input type="file" class="form-control" name="arquivo" style="padding-bottom: 35px">
                                    </div>

                                    <?php if(($configuracao['arquivo-imagem-de-fundo-login'] != "")): ?>
                                        <a href="/configuracoes/deleteImagemDeDundoLogin" class="btn btn-danger btn-block" style="margin-top: 15px">Rmover Imagem de fundo do Login</a>
                                    <?php endif; ?>
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