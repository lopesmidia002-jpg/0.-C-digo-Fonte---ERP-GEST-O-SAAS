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
                                <a href="/funcionarios" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label>Status</label>
                                <input type="text" class="form-control" value="<?= $funcionario['status'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" class="form-control" value="<?= $funcionario['nome'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Data de nascimento</label>
                                <input type="text" class="form-control" value="<?= ($funcionario['data_de_nascimento'] != "0000-00-00") ? date('d/m/Y', strtotime($funcionario['data_de_nascimento'])) : "Não cadastrado!" ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">CPF</label>
                                <input type="text" class="form-control cpf" value="<?= $funcionario['cpf'] ?>" disabled>
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
                                <input type="text" class="form-control cep" value="<?= $funcionario['cep'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label for="">Logradouro</label>
                                <input type="text" class="form-control" value="<?= $funcionario['logradouro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <label for="">Número</label>
                            <input type="text" class="form-control" value="<?= $funcionario['numero'] ?>" disabled>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="">Complemento</label>
                                <input type="text" class="form-control" value="<?= $funcionario['complemento'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Bairro</label>
                                <input type="text" class="form-control" value="<?= $funcionario['bairro'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">UF</label>
                                <input type="text" class="form-control" value="<?= $funcionario['uf'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Municipio</label>
                                <input type="text" class="form-control" value="<?= $funcionario['municipio'] ?>" disabled>
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
                                <label for="">Fixo</label>
                                <input type="text" class="form-control fixo" value="<?= $funcionario['fixo'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">celular 1</label>
                                <input type="text" class="form-control celular" value="<?= $funcionario['celular_1'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">celular 2</label>
                                <input type="text" class="form-control celular" value="<?= $funcionario['celular_2'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">E-mail</label>
                                <input type="text" class="form-control" value="<?= $funcionario['email'] ?>" disabled>
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
                        <div class="col-sm-12">
                            <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Dados Empregatícios</h6>
                        </div><!-- /.col -->
                    </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="">Cargo</label>
                                <input type="text" class="form-control" value="<?= $funcionario['cargo'] ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Data de contratação</label>
                                <input type="text" class="form-control" value="<?= ($funcionario['data_de_contratacao'] != "0000-00-00") ? date('d/m/Y', strtotime($funcionario['data_de_contratacao'])) : "Não cadastrado!" ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="">Data inicio das atividades</label>
                                <input type="text" class="form-control" value="<?= ($funcionario['data_inicio_das_atividades'] != "0000-00-00") ? date('d/m/Y', strtotime($funcionario['data_inicio_das_atividades'])) : "Não cadastrado!" ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="">Salário</label>
                                <input type="text" class="form-control" value="<?= number_format($funcionario['salario'], 2, ',', '.') ?>" disabled>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="">Detalhes da atividade</label>
                                <input type="text" class="form-control" value="<?= $funcionario['detalhes_da_atividade'] ?>" disabled>
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