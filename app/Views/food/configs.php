<!-- Modal Editar Mesa -->
<div class="modal fade" id="modal-editar-mesa">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar Mesa</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/storeMesa" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" class="form-control" id="nome_da_mesa" name="nome" required>
                            </div>
                        </div>

                        <input type="hidden" id="id_mesa" name="id_mesa">                                           
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Salvar Alterações</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Editar Mesa -->
<div class="modal fade" id="modal-editar-servico">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editar Serviço</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/storeServico" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" class="form-control" id="nome_do_servico" name="nome" required>
                            </div>
                        </div>

                        <input type="hidden" id="id_servico" name="id_servico">                                           
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Salvar Alterações</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Cadastrar Mesa -->
<div class="modal fade" id="modal-create-mesa">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Nova Mesa</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/storeMesa" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" class="form-control" name="nome" required>
                            </div>
                        </div>                                           
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal Cadastrar Serviço -->
<div class="modal fade" id="modal-create-servico">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Novo Serviço</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/food/storeServico" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label for="">Nome</label>
                                <input type="text" class="form-control" name="nome" required>
                            </div>
                        </div>                                           
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 15px">
                <div class="col-sm-6">
                    <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                </div><!-- /.col -->
                <div class="col-sm-6 no-print">
                    <ol class="breadcrumb float-sm-right">
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

            <div class="card">
                <div class="card-body">
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-create-mesa"><i class="fas fa-plus-circle"></i> Cadastrar Mesa</button>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-create-servico"><i class="fas fa-plus-circle"></i> Cadastrar Serviço</button>
                </div>
            </div>
            <!-- /.card -->

            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover text-nowrap table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th colspan="2" style="text-align: center">MESAS</th>
                                    </tr>
                                    <tr>
                                        <th>Nome</th>
                                        <th style="width: 90px">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($mesas)) : ?>
                                        <?php foreach ($mesas as $mesa) : ?>
                                            <tr>
                                                <td><?= $mesa['nome'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-warning style-action" onclick="preparaDadosParaEditar(<?= $mesa['id_mesa'] ?>, '<?= $mesa['nome'] ?>')" data-toggle="modal" data-target="#modal-editar-mesa"><i class="fas fa-edit"></i></button>
                                                    <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir essa Mesa?', '/food/deleteMesa/<?= $mesa['id_mesa'] ?>')"><i class="fa fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="3">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover text-nowrap table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th colspan="2" style="text-align: center">SERVIÇOS</th>
                                    </tr>
                                    <tr>
                                        <th>Nome</th>
                                        <th style="width: 90px">Ações</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($servicos)) : ?>
                                        <?php foreach ($servicos as $servico) : ?>
                                            <tr>
                                                <td><?= $servico['nome'] ?></td>
                                                <td>
                                                    <button type="button" class="btn btn-warning style-action" onclick="preparaDadosParaEditarServico(<?= $servico['id_servico'] ?>, '<?= $servico['nome'] ?>')" data-toggle="modal" data-target="#modal-editar-servico"><i class="fas fa-edit"></i></button>
                                                    <button type="button"servico class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse Serviço?', '/food/deleteServico/<?= $servico['id_servico'] ?>')"><i class="fa fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="3">Nenhum registro!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <form action="/painel/storeConfigsPainel" method="post">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h6 class="m-0 text-dark"><i class="fas fa-edit"></i> Configurações do Painel</h6>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Tam. da Senha</label>
                                            <input type="number" class="form-control" name="tamanho_da_senha" value="<?= $config_painel['tamanho_da_senha'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Cor da Senha</label>
                                            <input type="text" class="form-control" name="cor_da_senha" value="<?= $config_painel['cor_da_senha'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Tam. últ. senhas</label>
                                            <input type="number" class="form-control" name="tamanho_ultimas_senhas" value="<?= $config_painel['tamanho_ultimas_senhas'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Tam. letreiro</label>
                                            <input type="number" class="form-control" name="tamanho_letreiro" value="<?= $config_painel['tamanho_letreiro'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Cor letreiro</label>
                                            <input type="text" class="form-control" name="cor_do_letreiro" value="<?= $config_painel['cor_do_letreiro'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="">Cor de fundo PAINEL</label>
                                            <input type="text" class="form-control" name="cor_do_fundo_painel" value="<?= $config_painel['cor_do_fundo_painel'] ?>">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="">Texto Letreiro</label>
                                            <input type="text" class="form-control" name="texto_do_letreiro" value="<?= $config_painel['texto_do_letreiro'] ?>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-lg-12" style="text-align: right">
                                        <button type="submit" class="btn btn-success">Salvar Alterações</button>
                                    </div><!-- /.col -->
                                </div>
                            </div>
                            <!-- /.card-header -->
                        </div>
                        <!-- /.card -->
                    </form>
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    function preparaDadosParaEditar(id_mesa, nome_da_mesa)
    {
        document.getElementById('nome_da_mesa').value = nome_da_mesa;
        document.getElementById('id_mesa').value = id_mesa;
    }

    function preparaDadosParaEditarServico(id_servico, nome_do_servico)
    {
        document.getElementById('nome_do_servico').value = nome_do_servico;
        document.getElementById('id_servico').value = id_servico;
    }
</script>