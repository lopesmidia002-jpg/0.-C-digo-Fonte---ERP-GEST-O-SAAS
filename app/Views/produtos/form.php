<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/produtos/store" method="post" enctype="multipart/form-data">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/produtos" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" name="nome" value="<?= (isset($produto)) ? $produto['nome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Unidade</label>
                                    <select class="form-control select2" name="unidade" style="width: 100%;">
                                        <option value="UN" selected="selected">UN</option>
                                        <option value="PCT">PCT</option>
                                        <option value="FRD">FRD</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <label for="">Código de Barras</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="codigo_de_barras" name="codigo_de_barras" value="<?= (isset($produto)) ? $produto['codigo_de_barras'] : "SEM GTIN" ?>" <?= (isset($produto) && $produto['codigo_de_barras'] != "SEM GTIN") ? "" : "disabled" ?>>
                                    <span class="input-group-append">
                                        <button type="button" class="btn btn-info btn-flat" onclick="semCodigoDeBarras('codigo_de_barras')">SEM GTIN</button>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Localização</label>
                                    <input type="text" class="form-control" name="localizacao" value="<?= (isset($produto)) ? $produto['localizacao'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Qtd</label>
                                    <input type="text" class="form-control" name="quantidade" value="<?= (isset($produto)) ? $produto['quantidade'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Qtd mínima</label>
                                    <input type="text" class="form-control" name="quantidade_minima" value="<?= (isset($produto)) ? $produto['quantidade_minima'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Margem de Lucro %</label>
                                    <input type="text" class="form-control" id="margem_de_lucro" name="margem_de_lucro" onkeyup="calculaMargemDeLucro()" value="<?= (isset($produto)) ? $produto['margem_de_lucro'] : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor de custo</label>
                                    <input type="text" class="form-control money" id="valor_de_custo" name="valor_de_custo" onkeyup="calculaMargemDeLucro()" value="<?= (isset($produto)) ? number_format($produto['valor_de_custo'], 2, ',', '.') : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor de Venda</label>
                                    <input type="text" class="form-control money" id="valor_de_venda" name="valor_de_venda" onkeyup="calculaMargemDeLucroInverso()" value="<?= (isset($produto)) ? number_format($produto['valor_de_venda'], 2, ',', '.') : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Lucro</label>
                                    <input type="text" class="form-control money" id="lucro" name="lucro" onkeyup="calculaMargemDeLucroInversoLucro()" value="<?= (isset($produto)) ? number_format($produto['lucro'], 2, ',', '.') : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Validade</label>
                                    <input type="date" class="form-control" name="validade" value="<?= (isset($produto)) ? $produto['validade'] : "" ?>">
                                </div>
                            </div>
                            <?php if (isset($produto)) : ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Cat. do produto</label>
                                        <select class="form-control select2" name="id_categoria" style="width: 100%;" required>
                                            <?php foreach ($categorias as $categoria) : ?>
                                                <?php if ($produto['id_categoria'] == $categoria['id_categoria']) : ?>
                                                    <option value="<?= $categoria['id_categoria'] ?>" selected=""><?= $categoria['nome'] ?></option>
                                                <?php else : ?>
                                                    <option value="<?= $categoria['id_categoria'] ?>"><?= $categoria['nome'] ?></option>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label>Cat. do produto</label>
                                        <select class="form-control select2" name="id_categoria" style="width: 100%;" required>
                                            <?php if (!empty($categorias)) : ?>
                                                <?php foreach ($categorias as $categoria) : ?>
                                                    <option value="<?= $categoria['id_categoria'] ?>"><?= $categoria['nome'] ?></option>
                                                <?php endforeach; ?>
                                            <?php else : ?>
                                                <option value="">Nenhuma categoria cadastrada!</option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php endif; ?>
                            <?php if (isset($produto)) : ?>
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <label>Fornecedor</label>
                                        <select class="form-control select2" name="id_fornecedor" style="width: 100%;">
                                            <?php foreach ($fornecedores as $fornecedor) : ?>
                                                <?php if ($produto['id_fornecedor'] == $fornecedor['id_fornecedor']) : ?>
                                                    <option value="<?= $fornecedor['id_fornecedor'] ?>" selected=""><?= $fornecedor['nome_do_representante'] ?> - <?= $fornecedor['nome_da_empresa'] ?></option>
                                                <?php else : ?>
                                                    <option value="<?= $fornecedor['id_fornecedor'] ?>"><?= $fornecedor['nome_do_representante'] ?> - <?= $fornecedor['nome_da_empresa'] ?></option>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <label>Fornecedor</label>
                                        <select class="form-control select2" name="id_fornecedor" style="width: 100%;">
                                            <?php foreach ($fornecedores as $fornecedor) : ?>
                                                <option value="<?= $fornecedor['id_fornecedor'] ?>"><?= $fornecedor['nome_do_representante'] ?> - <?= $fornecedor['nome_da_empresa'] ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
                <!-- /.card -->

                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Comissão</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Tipo</label>
                                    <select class="form-control select2" name="tipo_da_comissao" style="width: 100%" required>
                                        <?php if (isset($produto)) : ?>
                                            <?php if ($produto['tipo_da_comissao'] == 1) : ?>
                                                <option value="1" selected="">Porcentagem</option>
                                                <option value="2">Valor</option>
                                            <?php else : ?>
                                                <option value="1">Porcentagem</option>
                                                <option value="2" selected="">Valor</option>
                                            <?php endif; ?>
                                        <?php else : ?>
                                            <option value="1" selected="">Porcentagem</option>
                                            <option value="2">Valor</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Porcentagem</label>
                                    <input type="text" class="form-control money" name="porcentagem_comissao" value="<?= (isset($produto)) ? number_format($produto['porcentagem_comissao'], 2, ',', '.') : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor</label>
                                    <input type="text" class="form-control money" name="valor_comissao" value="<?= (isset($produto)) ? number_format($produto['valor_comissao'], 2, ',', '.') : "0" ?>" required="">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- /.card -->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Foto do Produto</h6>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <?php if (isset($produto)) : ?>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <?php if ($produto['arquivo'] == "") : ?>
                                                    <img src="<?= base_url('assets/img/produtos/produto-sem-imagem.jpg') ?>" alt="Imagem do produto" style="width: 100%">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <div class="custom-file">
                                                                <input type="file" class="custom-file-input" name="arquivo">
                                                                <label class="custom-file-label" for="">Cadastrar Foto</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <?php else : ?>
                                                    <img src="<?= base_url('assets/img/produtos') . "/" . $produto['arquivo'] ?>" alt="Imagem do produto" style="width: 100%">
                                                    <div class="form-group" style="margin-top: 5px">
                                                        <div class="input-group">
                                                            <div class="custom-file">
                                                                <input type="file" class="custom-file-input" name="arquivo">
                                                                <label class="custom-file-label" for="">Trocar Foto</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="/produtos/removerImagem/<?= $produto['id_produto'] ?>" class="btn btn-danger">Remover Foto</a>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    <?php else : ?>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="">Foto do Produto</label>
                                                <div class="input-group">
                                                    <input type="file" name="arquivo">
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> Dados Fiscais</h6>
                            </div><!-- /.col -->
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">NCM</label>
                                    <input type="text" class="form-control" name="NCM" value="<?= (isset($produto)) ? $produto['NCM'] : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CSOSN</label>
                                    <input type="text" class="form-control" name="CSOSN" value="<?= (isset($produto)) ? $produto['CSOSN'] : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP NFe</label>
                                    <input type="text" class="form-control" name="CFOP_NFe" value="<?= (isset($produto)) ? $produto['CFOP_NFe'] : "0" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP NFCe</label>
                                    <input type="text" class="form-control" name="CFOP_NFCe" value="<?= (isset($produto)) ? $produto['CFOP_NFCe'] : "0" ?>" required="">
                                </div>
                            </div>

                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP Externo</label>
                                    <input type="text" class="form-control" name="CFOP_Externo" value="<?= (isset($produto)) ? $produto['CFOP_Externo'] : "0" ?>" required="">
                                </div>
                            </div>

                            <?php if (isset($produto)) : ?>
                                <!-- HIDDEN -->
                                <input type="hidden" name="id_produto" value="<?= $produto['id_produto'] ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($produto)) ? "Atualizar" : "Cadastrar" ?></button>
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
    function calculaMargemDeLucro() {
        var margem_de_lucro = document.getElementById('margem_de_lucro').value;

        // Converte de BRL para USD (Padrão americano) 
        var valor_de_custo = converteMoneyUSD(document.getElementById('valor_de_custo').value);

        var valor_da_margem = (margem_de_lucro * valor_de_custo / 100);

        var valor_de_venda = (parseFloat(valor_de_custo) + valor_da_margem);

        // Converte de USD (Padrão americano) para BRL
        document.getElementById('valor_de_venda').value = converteMoneyBRL(valor_de_venda);

        // Converte de USD (Padrão americano) para BRL
        document.getElementById('lucro').value = converteMoneyBRL(valor_de_venda - valor_de_custo);
    }

    function calculaMargemDeLucroInverso() {
        var valor_de_venda = converteMoneyUSD(document.getElementById('valor_de_venda').value);
        var valor_de_custo = converteMoneyUSD(document.getElementById('valor_de_custo').value);

        var lucro = valor_de_venda - valor_de_custo;

        document.getElementById('margem_de_lucro').value = (lucro / valor_de_custo * 100);
        document.getElementById('lucro').value = converteMoneyBRL(lucro);
    }

    function calculaMargemDeLucroInversoLucro() {
        var valor_de_custo = converteMoneyUSD(document.getElementById('valor_de_custo').value);
        var lucro = converteMoneyUSD(document.getElementById('lucro').value);

        document.getElementById('valor_de_venda').value = converteMoneyBRL(parseFloat(valor_de_custo) + parseFloat(lucro));
        document.getElementById('margem_de_lucro').value = (lucro / valor_de_custo * 100).toFixed(2);
    }

    function semCodigoDeBarras(id) {
        var campo = document.getElementById(id);

        if (campo.disabled) {
            // campo.value = "";
            campo.disabled = false;
        } else {
            campo.value = "SEM GTIN";
            campo.disabled = true;
        }
    }
</script>