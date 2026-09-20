<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/clientes/store" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/clientes" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <?php if (isset($cliente)): ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Tipo</label>
                                        <select class="form-control select2" id="tipo" name="tipo" style="width: 100%;" onchange="alteraTipo()">
                                            <?php if ($cliente['tipo'] == 1): ?>
                                                <option value="1" selected="">Pessoa Física</option>
                                                <option value="2">Pessoa Jurídica</option>
                                            <?php else: ?>
                                                <option value="1">Pessoa Física</option>
                                                <option value="2" selected="">Pessoa Jurídica</option>
                                            <?php endif;?>
                                        </select>
                                    </div>
                                </div>
                            <?php else: ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Tipo</label>
                                        <select class="form-control select2" id="tipo" name="tipo" style="width: 100%;" onchange="alteraTipo()">
                                            <option value="1" selected="">Pessoa Física</option>
                                            <option value="2">Pessoa Jurídica</option>
                                        </select>
                                    </div>
                                </div>
                            <?php endif;?>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome" onkeyup="verificaNomeCampoGeral('nome')" value="<?= (isset($cliente)) ? $cliente['nome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CPF</label>
                                    <input type="text" class="form-control cpf" id="cpf" name="cpf" value="<?= (isset($cliente)) ? $cliente['cpf'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Razão social</label>
                                    <input type="text" class="form-control" id="razao_social" name="razao_social" onkeyup="verificaNomeCampoGeral('razao_social')" value="<?= (isset($cliente)) ? $cliente['razao_social'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CNPJ</label>
                                    <input type="text" class="form-control cnpj" id="cnpj" name="cnpj" value="<?= (isset($cliente)) ? $cliente['cnpj'] : "" ?>" required="">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Isento</label>
                                    <select class="form-control select2" id="isento" name="isento" style="width: 100%" onchange="alteraIsento()">
                                        <?php if(isset($cliente) && $cliente['isento'] == 1): ?>
                                            <option value="1" selected>Sim</option>
                                            <option value="0">Não</option>
                                        <?php else: ?>
                                            <option value="1">Sim</option>
                                            <option value="0" selected>Não</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4" style="">
                                <div class="form-group">
                                    <label for="">I.E.</label>
                                    <input type="text" class="form-control" id="input-ie" name="ie" value="<?= (isset($cliente)) ? $cliente['ie'] : "" ?>" required <?= (isset($cliente) && $cliente['isento'] == 1) ? "disabled" : "" ?>>
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
                                    <input type="text" class="form-control cep" id="cep" name="cep" value="<?= (isset($cliente)) ? $cliente['cep'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="form-group">
                                    <label for="">Logradouro</label>
                                    <input type="text" class="form-control" id="logradouro" name="logradouro" value="<?= (isset($cliente)) ? $cliente['logradouro'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <label for="">Número</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="numero" name="numero" value="<?= (isset($cliente)) ? $cliente['numero'] : "S/N" ?>" <?= (isset($cliente)) ? "" : "disabled" ?>>
                                    <span class="input-group-append">
                                        <button type="button" class="btn btn-info btn-flat" onclick="semNumero('numero')">S/N</button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="">Complemento</label>
                                    <input type="text" class="form-control" id="complemento" name="complemento" value="<?= (isset($cliente)) ? $cliente['complemento'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Bairro</label>
                                    <input type="text" class="form-control" id="bairro" name="bairro" value="<?= (isset($cliente)) ? $cliente['bairro'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">UF</label>
                                    <select class="form-control select2" id="id_uf" name="id_uf" onchange="selecionaUF('id_uf')" style="width: 100%" required>
                                        <?php if(isset($cliente)) :?>
                                            <?php foreach($ufs as $uf) : ?>
                                                <option value="<?= $uf['id_uf'] ?>" <?= ($cliente['id_uf'] == $uf['id_uf']) ? "selected" : "" ?>><?= $uf['uf'] ?></option>
                                            <?php endforeach; ?>
                                        <?php else: ?>
                                            <option value="" selected>Selecione</option>
                                            <?php foreach($ufs as $uf) : ?>
                                                <option value="<?= $uf['id_uf'] ?>"><?= $uf['uf'] ?></option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Municipio</label>
                                    <select class="form-control select2" id="id_municipio" name="id_municipio" style="width: 100%" required>
                                        <?php if(isset($cliente)): ?>
                                            <?php foreach($municipios as $municipio) : ?>
                                                <option value="<?= $municipio['id_municipio'] ?>" <?= ($cliente['id_municipio'] == $municipio['id_municipio']) ? "selected" : "" ?>><?= $municipio['municipio'] ?></option>
                                            <?php endforeach; ?>
                                        <?php else: ?>
                                            <!-- MUNICIPIOS AJAX -->
                                            <option value="">Selecione a UF para carregas os municipios</option>
                                        <?php endif; ?>
                                    </select>
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
                                    <input type="text" class="form-control fixo" name="fixo" value="<?= (isset($cliente)) ? $cliente['fixo'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Celular 1</label>
                                    <input type="text" class="form-control celular" name="celular_1" value="<?= (isset($cliente)) ? $cliente['celular_1'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Celular 2</label>
                                    <input type="text" class="form-control celular" name="celular_2" value="<?= (isset($cliente)) ? $cliente['celular_2'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">E-mail</label>
                                    <input type="email" class="form-control" name="email" value="<?= (isset($cliente)) ? $cliente['email'] : "" ?>">
                                </div>
                            </div>

                            <?php if (isset($cliente)): ?>
                                <input type="hidden" class="form-control" name="id_cliente" value="<?=$cliente['id_cliente']?>">
                            <?php endif;?>
                            
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($cliente)) ? "Atualizar" : "Cadastrar" ?></button>
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
    function alteraTipo() {
        tipo = document.getElementById('tipo').value;

        if (tipo == 1) {
            // Reabilita campos PESSOA FÍSICA
            document.getElementById('nome').disabled = false;
            document.getElementById('cpf').disabled  = false;

            // Desabilita e limpa campos PESSOA JURÍDICA
            document.getElementById('razao_social').disabled = true;
            document.getElementById('cnpj').disabled         = true;
            document.getElementById('razao_social').value    = "";
            document.getElementById('cnpj').value            = "";
        } else {
            // Desabilita e limpa campos PESSOA FÍSICA
            document.getElementById('nome').disabled = true;
            document.getElementById('cpf').disabled  = true;
            document.getElementById('nome').value    = "";
            document.getElementById('cpf').value     = "";

            // Reabilita os campos para uso PESSOA JURÍDICA
            document.getElementById('razao_social').disabled = false;
            document.getElementById('cnpj').disabled         = false;
        }
    }

    function alteraIsento()
    {
        isento = document.getElementById('isento').value;

        if(isento == 1) 
        {
            // Desabilita campo
            document.getElementById('input-ie').disabled = true;
            // Limpa campo
            document.getElementById('input-ie').value = "";
        }
        else
        {
            // Desabilita campo
            document.getElementById('input-ie').disabled = false;
        }
    }

    // Chama as funções para trabalhar nos campos
    alteraTipo();
    alteraIsento();
</script>