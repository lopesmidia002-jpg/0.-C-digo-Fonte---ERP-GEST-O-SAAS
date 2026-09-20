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
                                <a href="/reposicoes" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
            </div>
            <!-- /.card -->
            
            <?php $num = 0; ?>
            <?php foreach($produtos as $produto): ?>
                <?php $num++; ?>

                <form action="/produtos/altera_dados_do_produto_provisorio_reposicao_por_xml" method="post">
                    <div id="<?= "prod_{$produto['id_produto_provisorio']}" ?>" class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h6 class="m-0 text-dark"><b>Produto Nº <?= $num ?></b></h6>
                                </div><!-- /.col -->
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <label for="">Nome</label>
                                        <input type="text" class="form-control" name="nome" value="<?= $produto['nome'] ?>" disabled="">
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="">Qtd</label>
                                        <input type="text" class="form-control" name="quantidade_da_reposicao" value="<?= $produto['quantidade_da_reposicao'] ?>" required="">
                                    </div>
                                </div>
                                <?php if($produto['id_produto'] == 0): ?>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label style="color: red">Produto não encontrado! Selecione abaixo..</label>
                                            <select class="form-control select2" name="id_produto" style="width: 100%;" required="">
                                                <option value="" selected="">-- Selecione --</option>
                                                <?php foreach($produtos_do_estoque as $prod): ?>
                                                    <option value="<?= $prod['id_produto'] ?>"><?= $prod['nome'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-lg-1">
                                        <div class="form-group">
                                            <a href="/produtos/remove_produto_reposicao_por_xml/<?= $produto['id_produto_provisorio'] ?>" class="btn btn-danger" style="margin-top: 30px"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </div>
                                    
                                    <?php $verifica_se_esta_tudo_certo = FALSE ?>

                                <?php else: ?>

                                    <input type="hidden" name="id_produto" value="<?= $produto['id_produto']  ?>">
                                
                                <?php endif; ?>

                                <!-- HIDDEN -->
                                <input type="hidden" name="id_produto_provisorio" value="<?= $produto['id_produto_provisorio']  ?>">
                                <!-- ------ -->

                            </div>
                            <div class="row">
                                <div class="col-lg-12" style="text-align: right">
                                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </form>
            <?php endforeach?>

            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12" style="text-align: right">
                            <button type="button" class="btn btn-success" onclick="window.location.href = '/produtos/finalizar_e_repoe_produtos_por_xml'" <?= (isset($verifica_se_esta_tudo_certo)) ? 'disabled' : '' ?>><i class="fas fa-save"></i> Finalizar e Repor Produtos</button>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
            </div>
            <!-- /.card -->
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
            <?php if ($alert == "success_update_prod") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Dados atualizados com sucesso!'
                })
            <?php endif; ?>
        <?php endif; ?>
    });

    var url = window.location.href;
    
    var nova = url.split('#');
    if(typeof nova[1] != 'undefined')
    {
        window.location.href = '#'+nova[1];
    }
</script>