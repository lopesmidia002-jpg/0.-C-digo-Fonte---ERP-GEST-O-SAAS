<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
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
                                <a href="/fornecedores" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Nome da Empresa</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['nome_da_empresa'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Nome do Representante</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['nome_do_representante'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">CNPJ</label>
                                <input type="text" class="form-control cnpj" value="<?= $fornecedor['cnpj'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">I.E.</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['ie'] ?>" disabled>
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
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Endereço</h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">CEP</label>
                                <input type="text" class="form-control cep" value="<?= $fornecedor['cep'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label for="">Logradouro</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['logradouro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <label for="">Número</label>
                            <input type="text" class="form-control" value="<?= $fornecedor['numero'] ?>" disabled>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Complemento</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['complemento'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Bairro</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['bairro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">UF</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['uf'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Municipio</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['municipio'] ?>" disabled>
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
                            <h6><i class="fa fa-phone-square"></i> Contato</h6>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Comercial</label>
                                <input type="text" class="form-control fixo" value="<?= $fornecedor['comercial'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Celular 1</label>
                                <input type="text" class="form-control celular" value="<?= $fornecedor['celular_1'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Celular 2</label>
                                <input type="text" class="form-control celular" value="<?= $fornecedor['celular_2'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">E-mail</label>
                                <input type="text" class="form-control" value="<?= $fornecedor['email'] ?>" disabled>
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