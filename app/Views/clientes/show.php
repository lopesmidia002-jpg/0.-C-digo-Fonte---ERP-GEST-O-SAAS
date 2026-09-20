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

            <div class="row" style="margin-top: 17px">
                <div class="col-lg-12">
                    <div class="card card-primary card-tabs">
                        <div class="card-header p-0 pt-1">
                            <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="dados_do_cliente-tab" data-toggle="pill" href="#dados_do_cliente" role="tab" aria-controls="dados_do_cliente" aria-selected="true">Dados do Cliente</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="vendas-tab" data-toggle="pill" href="#vendas" role="tab" aria-controls="vendas" aria-selected="false">Vendas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="orcamentos-tab" data-toggle="pill" href="#orcamentos" role="tab" aria-controls="orcamentos" aria-selected="false">Orçamentos</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pedidos-tab" data-toggle="pill" href="#pedidos" role="tab" aria-controls="pedidos" aria-selected="false">Pedidos</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="custom-tabs-one-tabContent">
                                <div class="tab-pane fade show active" id="dados_do_cliente" role="tabpanel" aria-labelledby="dados_do_cliente-tab">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h5 style="text-align: center"><b>Dados do Cliente</b></h5>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label>Tipo</label>
                                                <input type="text" class="form-control" value="<?= ($cliente['tipo'] == 1) ? "Pessoa Física" : "Pessoa Jurídica" ?>" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">Nome</label>
                                                <input type="text" class="form-control" value="<?= $cliente['nome'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">CPF</label>
                                                <input type="text" class="form-control cpf" value="<?= $cliente['cpf'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">Razão social</label>
                                                <input type="text" class="form-control" value="<?= $cliente['razao_social'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">CNPJ</label>
                                                <input type="text" class="form-control cnpj" value="<?= $cliente['cnpj'] ?>" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label for="">Isento</label>
                                                <input type="text" class="form-control" value="<?= ($cliente['isento'] == 1) ? "Sim" : "Não" ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-4" style="">
                                            <div class="form-group">
                                                <label for="">I.E.</label>
                                                <input type="text" class="form-control" value="<?= $cliente['ie'] ?>" disabled>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 50px">
                                        <div class="col-lg-12">
                                            <h5 style="text-align: center"><b>Endereço</b></h5>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">CEP</label>
                                                <input type="text" class="form-control cep" value="<?= $cliente['cep'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="form-group">
                                                <label for="">Logradouro</label>
                                                <input type="text" class="form-control" value="<?= $cliente['logradouro'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <label for="">Número</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" value="<?= $cliente['numero'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label for="">Complemento</label>
                                                <input type="text" class="form-control" value="<?= $cliente['complemento'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="">Bairro</label>
                                                <input type="text" class="form-control" value="<?= $cliente['bairro'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                                <label for="">UF</label>
                                                <input type="text" class="form-control" value="<?= $cliente['uf'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label for="">Municipio</label>
                                                <input type="text" class="form-control" value="<?= $cliente['municipio'] ?>" disabled>
                                            </div>
                                        </div>

                                        <?php if(isset($cliente)): ?>
                                            <input type="hidden" class="form-control" name="id_cliente" value="<?= $cliente['id_cliente'] ?>">
                                        <?php endif ?>

                                    </div>
                                    
                                    <div class="row" style="margin-top: 50px">
                                        <div class="col-lg-12">
                                            <h5 style="text-align: center"><b>Contato</b></h5>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">Fixo</label>
                                                <input type="text" class="form-control fixo" value="<?= $cliente['fixo'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">Celular 1</label>
                                                <input type="text" class="form-control celular" value="<?= $cliente['celular_1'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">Celular 2</label>
                                                <input type="text" class="form-control celular" value="<?= $cliente['celular_2'] ?>" disabled>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <label for="">E-mail</label>
                                                <input type="text" class="form-control" value="<?= $cliente['email'] ?>" disabled>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="vendas" role="tabpanel" aria-labelledby="vendas-tab">
                                    <table class="table table-hover text-nowrap table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th colspan="7" style="text-align: center">VENDAS</th>
                                            </tr>
                                            <tr>
                                                <th style="width: 35px">Cód.</th>
                                                <th>Valor</th>
                                                <th>Data</th>
                                                <th>Hora</th>
                                                <th>Cod. Caixa</th>
                                                <th class="no-print" style="width: 110px">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (!empty($vendas)) : ?>
                                                <?php foreach ($vendas as $venda) : ?>
                                                    <tr>
                                                        <td><?= $venda['id_venda'] ?></td>
                                                        <td><?= number_format($venda['valor_a_pagar'], 2, ',', '.') ?></td>
                                                        <td><?= date('d/m/Y', strtotime($venda['data'])) ?></td>
                                                        <td><?= $venda['hora'] ?></td>
                                                        <td><?= $venda['id_caixa'] ?></td>
                                                        <td class="no-print">
                                                            <a href="/vendas/show/<?= $venda['id_venda'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                                            <!-- <a href="/vendas/edit/<?= $venda['id_venda'] ?>" class="btn btn-warning style-action"><i class="fa fa-edit"></i></a> -->
                                                            <?php if(!isset($venda['id_nfe']) && !isset($venda['id_nfce'])): ?>
                                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir essa venda?', '/vendas/delete/<?= $venda['id_venda'] ?>')"><i class="fa fa-trash"></i></button>
                                                            <?php endif; ?>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <tr>
                                                    <td colspan="7">Nenhum registro!</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="orcamentos" role="tabpanel" aria-labelledby="orcamentos-tab">
                                    <table class="table table-hover text-nowrap table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center" colspan="6">ORÇAMENTOS</th>
                                            </tr>
                                            <tr>
                                                <th style="width: 35px">Cód.</th>
                                                <th>Status</th>
                                                <th>Valor</th>
                                                <th>Data</th>
                                                <th>Hora</th>
                                                <th class="no-print" style="width: 110px">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (!empty($orcamentos)) : ?>
                                                <?php foreach ($orcamentos as $orcamento) : ?>
                                                    <tr>
                                                        <td><?= $orcamento['id_orcamento'] ?></td>
                                                        <td>
                                                            <?php if($orcamento['status'] == "Aberto"): ?>
                                                                <span class="badge badge-warning" style="height: 20px; font-size: 12px; color: white; border-radius: 2px;"><?= $orcamento['status'] ?></span>
                                                            <?php else: ?>
                                                                <span class="badge badge-success" style="height: 20px; font-size: 12px; color: white; border-radius: 2px;"><?= $orcamento['status'] ?></span>
                                                            <?php endif; ?>
                                                        </td>
                                                        <td><?= number_format($orcamento['valor_a_pagar'], 2, ',', '.') ?></td>
                                                        <td><?= date('d/m/Y', strtotime($orcamento['data'])) ?></td>
                                                        <td><?= $orcamento['hora'] ?></td>
                                                        <td class="no-print">
                                                            <a href="/orcamentos/show/<?= $orcamento['id_orcamento'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse orçamento?', '/orcamentos/delete/<?= $orcamento['id_orcamento'] ?>')"><i class="fa fa-trash"></i></button>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else : ?>
                                                <tr>
                                                    <td colspan="7">Nenhum registro!</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-pane fade" id="pedidos" role="tabpanel" aria-labelledby="pedidos-tab">
                                    <table class="table table-hover text-nowrap table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th colspan="6" style="text-align: center">PEDIDOS</th>
                                            </tr>
                                            <tr>
                                                <th style="width: 35px">Cód.</th>
                                                <th>Data</th>
                                                <th>Situação</th>
                                                <th>Prazo de entrega</th>
                                                <th>Valor</th>
                                                <th class="no-print" style="width: 110px">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if (!empty($pedidos)) : ?>
                                                <?php foreach ($pedidos as $pedido) : ?>
                                                    <tr>
                                                        <td><?= $pedido['id_pedido'] ?></td>
                                                        <td><?= date('d/m/Y', strtotime($pedido['data'])) ?></td>
                                                        <td>
                                                            <?php if($pedido['situacao'] == "Não Pago - Andamento"): ?>
                                                                <span style="height: 20px; font-size: 12px; color: white; border-radius: 2px; background: #FFC125" class="badge badge-warning"><?= $pedido['situacao'] ?>
                                                            <?php else: ?>
                                                                <span style="height: 20px; font-size: 12px; color: white; border-radius: 2px;" class="badge badge-success"><?= $pedido['situacao'] ?>
                                                            <?php endif; ?>
                                                        </td>
                                                        <td><?= date('d/m/Y', strtotime($pedido['prazo_de_entrega'])) ?></td>
                                                        <td><?= number_format($pedido['valor_a_pagar'], 2, ',', '.') ?></td>
                                                        <td class="no-print">
                                                            <a href="/pedidos/show/<?= $pedido['id_pedido'] ?>" class="btn btn-info style-action"><i class="fa fa-folder-open"></i></a>
                                                            <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse pedido?', '/pedidos/delete/<?= $pedido['id_pedido'] ?>')"><i class="fa fa-trash"></i></button>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            <?php else : ?>
                                                <tr>
                                                    <td colspan="7">Nenhum registro!</td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->