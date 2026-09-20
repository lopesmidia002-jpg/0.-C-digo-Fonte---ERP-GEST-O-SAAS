<!-- Modal Ação do Usuário Add Forcenedor -->
<div class="modal fade" id="acao-do-usuario-add-fornecedor">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><i class="fas fa-plus-circle"></i> Novo Fornecedor</h4>
                <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button> -->
            </div>
            <form action="/pdv/alteraQtdDoProduto/8" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <h5>Esse fornecedor ainda não foi cadastrado, deseja cadastra-lo?</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Representante</th>
                                        <th>CNPJ</th>
                                        <th>IE</th>
                                        <th>Nome da Empresa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?= $fornecedor['nome_do_representante'] ?></td>
                                        <td><?= $fornecedor['cnpj'] ?></td>
                                        <td><?= $fornecedor['ie'] ?></td>
                                        <td><?= $fornecedor['nome_da_empresa'] ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-12">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>CEP</th>
                                        <th>Logradouro</th>
                                        <th>Número</th>
                                        <th>Complemento</th>
                                        <th>Bairro</th>
                                        <th>Município</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?= $fornecedor['cep'] ?></td>
                                        <td><?= $fornecedor['logradouro'] ?></td>
                                        <td><?= $fornecedor['numero'] ?></td>
                                        <td><?= $fornecedor['complemento'] ?></td>
                                        <td><?= $fornecedor['bairro'] ?></td>
                                        <td><?= $fornecedor['municipio'] ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-lg-12">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Telefone</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?= $fornecedor['comercial'] ?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="/produtos/remove_fornecedor_cadastrado_por_xml/<?= $fornecedor['id_fornecedor'] ?>" class="btn btn-info" onclick="alert('Fornecedor não cadastrado, será usado o fornecedor GERAL!')">Não Cadastrar</a>
                    <a href="/produtos/provisorio_add_produtos_por_xml" class="btn btn-info" onclick="alert('Fornecedor cadastrado com sucesso!')"><i class="fas fa-plus-circle"></i> Cadastrar Fornecedor</a>
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
            <!-- CONTEUDO AQUI! -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script>
    $(function() {
        //Abre modal Ação do Usuário Add Fornecedor
        $('#acao-do-usuario-add-fornecedor').modal('show')
    });
</script>