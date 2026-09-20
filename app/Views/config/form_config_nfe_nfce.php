<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/configNFeNFCe/store" method="post" enctype="multipart/form-data">

                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> <?=$titulo['modulo']?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
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
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Natureza da Operação</label>
                                    <input type="text" class="form-control" name="natOp" value="<?=(isset($empresa)) ? $empresa['natOp'] : "Venda de mercadorias."?>">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Serie</label>
                                    <input type="text" class="form-control" name="serie" value="<?=(isset($empresa)) ? $empresa['serie'] : "1"?>">
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
                                <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> Dados NFe</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Ambiente NFe</label>
                                    <select class="form-control select2" id="tpAmb_NFe" name="tpAmb_NFe" onchange="alteraAmbiente('tpAmb_NFe', 'nNF_homologacao', 'nNF_producao')" style="width:100%">
                                        <?php if (isset($empresa)): ?>
                                            <?php if ($empresa['tpAmb_NFe'] == 2): ?>
                                                <option value="2" selected>Homologação</option>
                                                <option value="1">Produção</option>
                                            <?php elseif ($empresa['tpAmb_NFe'] == 1): ?>
                                                <option value="2">Homologação</option>
                                                <option value="1" selected>Produção</option>
                                            <?php endif;?>
                                        <?php else: ?>
                                            <option value="2" selected>Homologação</option>
                                            <option value="1">Produção</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Nº Homologação</label>
                                    <input type="number" class="form-control" id="nNF_homologacao" name="nNF_homologacao" value="<?=(isset($empresa)) ? $empresa['nNF_homologacao'] : ""?>" <?=(isset($empresa) && $empresa['tpAmb_NFe'] != 2) ? "disabled" : ""?>>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Nº Produção</label>
                                    <input type="number" class="form-control" id="nNF_producao" name="nNF_producao" value="<?=(isset($empresa)) ? $empresa['nNF_producao'] : ""?>" <?=(isset($empresa) && $empresa['tpAmb_NFe'] != 1) ? "disabled" : ""?> <?=(!isset($empresa)) ? "disabled" : ""?>>
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
                                <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> Dados NFCe</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Ambiente NFCe</label>
                                    <select class="form-control select2" id="tpAmb_NFCe" name="tpAmb_NFCe" onchange="alteraAmbiente('tpAmb_NFCe', 'nNFC_homologacao', 'nNFC_producao')" style="width:100%">
                                        <?php if (isset($empresa)): ?>
                                            <?php if ($empresa['tpAmb_NFCe'] == 2): ?>
                                                <option value="2" selected>Homologação</option>
                                                <option value="1">Produção</option>
                                            <?php elseif ($empresa['tpAmb_NFCe'] == 1): ?>
                                                <option value="2">Homologação</option>
                                                <option value="1" selected>Produção</option>
                                            <?php endif;?>
                                        <?php else: ?>
                                            <option value="2" selected>Homologação</option>
                                            <option value="1">Produção</option>
                                        <?php endif?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Nº Homologação</label>
                                    <input type="number" class="form-control" id="nNFC_homologacao" name="nNFC_homologacao" value="<?=(isset($empresa)) ? $empresa['nNFC_homologacao'] : ""?>" <?=(isset($empresa) && $empresa['tpAmb_NFCe'] != 2) ? "disabled" : ""?>>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Nº Produção</label>
                                    <input type="number" class="form-control" id="nNFC_producao" name="nNFC_producao" value="<?=(isset($empresa)) ? $empresa['nNFC_producao'] : ""?>" <?=(isset($empresa) && $empresa['tpAmb_NFCe'] != 1) ? "disabled" : ""?> <?=(!isset($empresa)) ? "disabled" : ""?>>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">CSC</label>
                                    <input type="text" class="form-control" name="CSC" value="<?=(isset($empresa)) ? $empresa['CSC'] : ""?>">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Cód. CSC</label>
                                    <input type="text" class="form-control" name="CSC_Id" value="<?=(isset($empresa)) ? $empresa['CSC_Id'] : ""?>">
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
                                <h6 class="m-0 text-dark"><i class="<?=$titulo['icone']?>"></i> Certificado</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-5">
                                <label for="">Certificado</label>
                                <input type="file" class="form-control" style="padding-bottom: 35px" name="file">
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Senha do Certificado</label>
                                    <input type="password" class="form-control" name="senha_do_certificado" value="<?=(isset($empresa)) ? $empresa['senha_do_certificado'] : ""?>" required>
                                </div>
                            </div>
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
</script>