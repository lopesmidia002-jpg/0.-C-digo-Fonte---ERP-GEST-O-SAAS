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
                                    <input type="text" class="form-control" value="<?= $produto['nome_do_produto'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label for="">Unidade</label>
                                <input type="text" class="form-control" value="<?= $produto['unidade'] ?>" disabled>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Cód. barras</label>
                                    <input type="text" class="form-control" value="<?= $produto['codigo_de_barras'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="form-group">
                                    <label for="">Localização</label>
                                    <input type="text" class="form-control" value="<?= $produto['localizacao'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Qtd</label>
                                    <input type="text" class="form-control" value="<?= $produto['quantidade'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Qtd mínima</label>
                                    <input type="text" class="form-control" value="<?= $produto['quantidade_minima'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Margem de Lucro %</label>
                                    <input type="text" class="form-control" value="<?= $produto['margem_de_lucro'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor de custo</label>
                                    <input type="text" class="form-control money" value="<?= number_format($produto['valor_de_custo'], 2, ',', '.') ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Valor de Venda</label>
                                    <input type="text" class="form-control money" value="<?= number_format($produto['valor_de_venda'], 2, ',', '.') ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Lucro</label>
                                    <input type="text" class="form-control money" value="<?= number_format($produto['lucro'], 2, ',', '.') ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Validade</label>
                                    <input type="text" class="form-control" value="<?= ($produto['validade'] == '0000-00-00') ? "Sem validade" : $produto['validade'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Cat. do produto</label>
                                    <input type="text" class="form-control" value="<?= $produto['nome_da_categoria_do_produto'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>Fornecedor</label>
                                    <input type="text" class="form-control" value="<?= $produto['nome_da_empresa'] ?>" disabled>
                                </div>
                            </div>
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
                                    <input type="text" class="form-control" value="<?= ($produto['tipo_da_comissao'] == 1) ? "Porcentagem" : "Valor" ?>" disabled="">
                                </div>
                            </div>
                            <?php if($produto['tipo_da_comissao'] == 1): ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="">Porcentagem</label>
                                        <input type="text" class="form-control" value="<?= number_format($produto['porcentagem_comissao'], 2, ',', '.')."%" ?>" disabled="">
                                    </div>
                                </div>
                            <?php else: ?>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="">Valor</label>
                                        <input type="text" class="form-control" value="<?= number_format($produto['valor_comissao'], 2, ',', '.') ?>" disabled="">
                                    </div>
                                </div>
                            <?php endif; ?>
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
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <?php if ($produto['arquivo'] == "") : ?>
                                                <img src="<?= base_url('assets/img/produtos/produto-sem-imagem.jpg') ?>" alt="Imagem do produto" style="width: 100%">
                                            <?php else : ?>
                                                <img src="<?= base_url('assets/img/produtos/') ."/". $produto['arquivo'] ?>" alt="Imagem do produto" style="width: 100%">
                                            <?php endif; ?>
                                        </div>
                                    </div>
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
                                    <input type="text" class="form-control" value="<?= $produto['NCM'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CSOSN</label>
                                    <input type="text" class="form-control" value="<?= $produto['CSOSN'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP NFe</label>
                                    <input type="text" class="form-control" value="<?= $produto['CFOP_NFe'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP NFCe</label>
                                    <input type="text" class="form-control" value="<?= $produto['CFOP_NFCe'] ?>" disabled>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">CFOP Externo</label>
                                    <input type="text" class="form-control" value="<?= $produto['CFOP_Externo'] ?>" disabled>
                                </div>
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