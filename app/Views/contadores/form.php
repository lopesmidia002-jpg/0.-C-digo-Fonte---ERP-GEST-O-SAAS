<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/contadores/store" method="post">
                
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/contadores" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <?php if (isset($contador)): ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="">Status</label>
                                        <select class="form-control select2" name="status" style="width: 100%">
                                            <?php if ($contador['status'] == "Ativo"): ?>
                                                <option value="Ativo" selected>Ativo</option>
                                                <option value="Desativado">Desativado</option>
                                            <?php else: ?>
                                                <option value="Ativo">Ativo</option>
                                                <option value="Desativado" selected>Desativado</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            <?php endif;?>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" name="nome" value="<?= (isset($contador)) ? $contador['nome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Nome Fantasia</label>
                                    <input type="text" class="form-control" name="nome_fantasia" value="<?= (isset($contador)) ? $contador['nome_fantasia'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Razão Social</label>
                                    <input type="text" class="form-control" name="razao_social" value="<?= (isset($contador)) ? $contador['razao_social'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">CNPJ</label>
                                    <input type="text" class="form-control" name="cnpj" value="<?= (isset($contador)) ? $contador['cnpj'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Inscrição Estadual</label>
                                    <input type="text" class="form-control" name="inscricao_estadual" value="<?= (isset($contador)) ? $contador['inscricao_estadual'] : "" ?>">
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
                                    <input type="text" class="form-control" name="cep" value="<?= (isset($contador)) ? $contador['cep'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Logradouro</label>
                                    <input type="text" class="form-control" name="logradouro" value="<?= (isset($contador)) ? $contador['logradouro'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Número</label>
                                    <input type="text" class="form-control" name="numero" value="<?= (isset($contador)) ? $contador['numero'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Complemento</label>
                                    <input type="text" class="form-control" name="complemento" value="<?= (isset($contador)) ? $contador['complemento'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Bairro</label>
                                    <input type="text" class="form-control" name="bairro" value="<?= (isset($contador)) ? $contador['bairro'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Cidade</label>
                                    <input type="text" class="form-control" name="cidade" value="<?= (isset($contador)) ? $contador['cidade'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-1">
                                <div class="form-group">
                                    <label for="">UF</label>
                                    <input type="text" class="form-control" name="UF" value="<?= (isset($contador)) ? $contador['UF'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Ponto de Referência</label>
                                    <input type="text" class="form-control" name="ponto_de_referencia" value="<?= (isset($contador)) ? $contador['ponto_de_referencia'] : "" ?>">
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
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Contato</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Fixo</label>
                                    <input type="text" class="form-control" name="fixo" value="<?= (isset($contador)) ? $contador['fixo'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Celular 1</label>
                                    <input type="text" class="form-control" name="celular_1" value="<?= (isset($contador)) ? $contador['celular_1'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Celular 2</label>
                                    <input type="text" class="form-control" name="celular_2" value="<?= (isset($contador)) ? $contador['celular_2'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">E-mail</label>
                                    <input type="text" class="form-control" name="email" value="<?= (isset($contador)) ? $contador['email'] : "" ?>">
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
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Login</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Usuário</label>
                                    <input type="text" class="form-control" id="usuario" name="usuario" onblur="verificaUsuarioNobanco('usuario')" value="<?= (isset($login)) ? $login['usuario'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Senha</label>
                                    <input type="text" class="form-control" name="senha" value="<?= (isset($login)) ? $login['senha'] : "" ?>">
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
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Extra</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="">Anotações</label>
                                    <textarea class="form-control" name="anotacoes" rows="10"><?= (isset($contador)) ? $contador['anotacoes'] : "" ?></textarea>
                                </div>
                            </div>

                            <?php if (isset($contador)) : ?>
                                <input type="hidden" class="form-control" name="id_contador" value="<?= $contador['id_contador'] ?>">
                            <?php endif; ?>

                            <?php if (isset($login)) : ?>
                                <input type="hidden" class="form-control" name="id_login" value="<?= $login['id_login'] ?>">
                            <?php endif; ?>


                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($contador)) ? "Atualizar" : "Cadastrar" ?></button>
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

<script>
    $(function() {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000
        });

        <?php
        $session = session();
        $alert = $session->getFlashdata('alert');

        if (isset($alert)) :
        ?>
            <?php if ($alert == "success_edit_contador") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Contador editado com sucesso!'
                })
            <?php endif; ?>
        <?php endif; ?>
    });
</script>