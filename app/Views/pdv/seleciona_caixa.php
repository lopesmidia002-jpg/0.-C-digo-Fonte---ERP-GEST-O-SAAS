<!-- Modal Caixas Abertos -->
<div class="modal fade" id="caixas-abertos">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Caixas Abertos</h4>
                <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button> -->
            </div>
            <form action="/pdv/alteraQtdDoProduto/8" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Cód.</th>
                                        <th>Status</th>
                                        <th>Data</th>
                                        <th>Hora</th>
                                        <th style="width: 100px">Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($caixas)) : ?>
                                        <?php foreach ($caixas as $caixa) : ?>
                                            <tr>
                                                <td><?= $caixa['id_caixa'] ?></td>
                                                <td><?= $caixa['status'] ?></td>
                                                <td><?= date('d/m/Y', strtotime($caixa['data_de_abertura'])) ?></td>
                                                <td><?= $caixa['hora_de_abertura'] ?></td>
                                                <td>
                                                    <a href="/pdv/start/<?= $caixa['id_caixa'] ?>" class="btn btn-primary style-action" target="_blank">Selecionar</a>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="5">Nenhum caixa aberto!</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <a href="/inicio" class="btn btn-info">Voltar</a>
                    <a href="/caixas/abrir" class="btn btn-info"><i class="fas fa-plus-circle"></i> Abrir Novo Caixa</a>
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
        //Abre model caixas abertos
        $('#caixas-abertos').modal('show')
    });
</script>