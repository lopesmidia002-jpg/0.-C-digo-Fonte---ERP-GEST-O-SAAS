<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-6">
                            <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> <?=$titulo['modulo']?></h6>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="/empresas" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
                                <?php foreach ($caminhos as $caminho): ?>
                                    <?php if (!$caminho['active']): ?>
                                        <li class="breadcrumb-item"><a href="<?=$caminho['rota']?>"><?=$caminho['titulo']?></a></li>
                                    <?php else: ?>
                                        <li class="breadcrumb-item active"><?=$caminho['titulo']?></li>
                                    <?php endif;?>
                                <?php endforeach;?>
                            </ol>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <?php if (isset($empresa)): ?>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Status</label>
                                    <input type="text" class="form-control" value="<?= $empresa['status'] ?>" disabled>
                                </div>
                            </div>
                        <?php endif;?>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">CNPJ</label>
                                <input type="text" class="form-control" value="<?= $empresa['CNPJ'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="form-group">
                                <label for="">Razão Social</label>
                                <input type="text" class="form-control" value="<?= $empresa['xNome'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Nome Fantasia</label>
                                <input type="text" class="form-control" value="<?= $empresa['xFant'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">I.E.</label>
                                <input type="text" class="form-control" value="<?= $empresa['IE'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Dia do Pagamento</label>
                                <input type="text" class="form-control" value="<?= $empresa['dia_do_pagamento'] ?>" disabled>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> Endereço</h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">CEP</label>
                                <input type="text" class="form-control" value="<?= $empresa['CEP'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label for="">Logradouro</label>
                                <input type="text" class="form-control" value="<?= $empresa['xLgr'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Número</label>
                                <input type="text" class="form-control" value="<?= $empresa['nro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Complemento</label>
                                <input type="text" class="form-control" value="<?= $empresa['xCpl'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Bairro</label>
                                <input type="text" class="form-control" value="<?= $empresa['xBairro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">UF</label>
                                <input type="text" class="form-control" value="<?= $empresa['uf'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Municipio</label>
                                <input type="text" class="form-control" value="<?= $empresa['municipio'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Fone</label>
                                <input type="text" class="form-control" value="<?= $empresa['fone'] ?>" disabled>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> Login</h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Usuário</label>
                                <input type="text" class="form-control" value="<?= $empresa['usuario'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Senha</label>
                                <input type="text" class="form-control" value="<?= $empresa['senha'] ?>" disabled>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->