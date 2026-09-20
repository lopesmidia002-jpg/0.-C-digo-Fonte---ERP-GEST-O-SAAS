<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/empresas/store" method="post" enctype="multipart/form-data">

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
                                        <select class="form-control select2" name="status" style="width: 100%">
                                            <?php if ($empresa['status'] == "Ativo"): ?>
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
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">CNPJ</label>
                                    <input type="text" class="form-control cnpj" id="CNPJ" name="CNPJ" onblur="validarCNPJ('CNPJ')" value="<?=(isset($empresa)) ? $empresa['CNPJ'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Razão Social</label>
                                    <input type="text" class="form-control uppercase" id="input-razao-social" name="xNome" value="<?=(isset($empresa)) ? $empresa['xNome'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Nome Fantasia</label>
                                    <input type="text" class="form-control uppercase" name="xFant" value="<?=(isset($empresa)) ? $empresa['xFant'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">I.E.</label>
                                    <input type="text" class="form-control" name="IE" value="<?=(isset($empresa)) ? $empresa['IE'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Dia do Pagamento</label>
                                    <input type="number" class="form-control" name="dia_do_pagamento" value="<?=(isset($empresa)) ? $empresa['dia_do_pagamento'] : ""?>" required="">
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
                                    <input type="text" class="form-control cep" id="cep" name="CEP" value="<?=(isset($empresa)) ? $empresa['CEP'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <div class="form-group">
                                    <label for="">Logradouro</label>
                                    <input type="text" class="form-control" id="logradouro" name="xLgr" value="<?=(isset($empresa)) ? $empresa['xLgr'] : ""?>" required="">
                                </div>
                            </div>
                            <!-- <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Número</label>
                                    <input type="text" class="form-control" id="numero" name="nro" value="<?=(isset($empresa)) ? $empresa['nro'] : ""?>" required="">
                                </div>
                            </div> -->
                            <div class="col-lg-2">
                                <label for="">Número</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="nro" name="nro" value="<?=(isset($empresa)) ? $empresa['nro'] : "S/N"?>" disabled>
                                    <span class="input-group-append">
                                        <button type="button" class="btn btn-info btn-flat" onclick="semNumero('nro')">S/N</button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="">Complemento</label>
                                    <input type="text" class="form-control" id="complemento" name="xCpl" value="<?=(isset($empresa)) ? $empresa['xCpl'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Bairro</label>
                                    <input type="text" class="form-control" id="bairro" name="xBairro" value="<?=(isset($empresa)) ? $empresa['xBairro'] : ""?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">UF</label>
                                    <select class="form-control select2" id="id_uf" name="id_uf" onchange="selecionaUF('id_uf')" style="width: 100%" required>
                                        <?php if (isset($empresa)): ?>
                                            <?php foreach ($ufs as $uf): ?>
                                                <option value="<?=$uf['id_uf']?>" <?=($empresa['id_uf'] == $uf['id_uf']) ? "selected" : ""?>><?=$uf['uf']?></option>
                                            <?php endforeach;?>
                                        <?php else: ?>
                                            <option value="" selected>Selecione</option>
                                            <?php foreach ($ufs as $uf): ?>
                                                <option value="<?=$uf['id_uf']?>"><?=$uf['uf']?></option>
                                            <?php endforeach;?>
                                        <?php endif;?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Municipio</label>
                                    <select class="form-control select2" id="id_municipio" name="id_municipio" style="width: 100%" required>
                                        <?php if (isset($empresa)): ?>
                                            <?php foreach ($municipios as $municipio): ?>
                                                <option value="<?=$municipio['id_municipio']?>" <?=($empresa['id_municipio'] == $municipio['id_municipio']) ? "selected" : ""?>><?=$municipio['municipio']?></option>
                                            <?php endforeach;?>
                                        <?php else: ?>
                                            <!-- MUNICIPIOS AJAX -->
                                            <option value="">Selecione a UF para carregas os municipios</option>
                                        <?php endif;?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Fone</label>
                                    <input type="text" class="form-control fone-sem-mascara" name="fone" value="<?=(isset($empresa)) ? $empresa['fone'] : ""?>" required="">
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
                                    <input type="text" class="form-control" id="usuario" name="usuario" onfocusout="verificaNomeDeUsuario()" value="<?=(isset($login)) ? $login['usuario'] : ""?>" required>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Senha</label>
                                    <input type="password" class="form-control" name="senha" value="<?=(isset($login)) ? $login['senha'] : ""?>" required>
                                </div>
                            </div>

                            <?php if (isset($empresa)): ?>
                                <input type="hidden" class="form-control" name="id_empresa" value="<?=$empresa['id_empresa']?>">
                            <?php else: // Caso a ação seja create então cria o input status?>
	                                <input type="hidden" name="status" value="Ativo">
	                            <?php endif;?>

                            <?php if (isset($login)): ?>
                                <input type="hidden" class="form-control" name="id_login" value="<?=$login['id_login']?>">
                            <?php endif;?>


                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?=(isset($empresa)) ? "Atualizar" : "Cadastrar"?></button>
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
    function alteraAmbiente(ambiente, homologacao, producao)
    {
        var ambiente = document.getElementById(ambiente);

        if(ambiente.value == 2)
        {
            document.getElementById(homologacao).disabled = false;
            document.getElementById(producao).disabled = true;
        }
        else
        {
            document.getElementById(homologacao).disabled = true;
            document.getElementById(producao).disabled = false;
        }
    }

    function verificaNomeDeUsuario()
    {
        var doc, usuario;

        doc = document.getElementById('usuario');
        usuario = doc.value;

        $.post(
            "/login/verificaNomeDeUsuario", {
                usuario: usuario
            },
            function(data, status) {
                if (status == "success") {
                    if(data == "1")
                    {
                        alert('Esse usuário não pode ser cadastrado. Por favor, escolha outro.');
                        doc.value = "";
                        doc.focus();
                    }
                }
            }
        );      

    }
</script>