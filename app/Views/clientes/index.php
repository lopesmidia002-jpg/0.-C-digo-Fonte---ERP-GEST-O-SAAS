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
                <div class="card-header">
                    <div class="row">
                        <div class="col-lg-12">
                            <a href="/clientes/create" class="btn btn-info"><i class="fa fa-user-plus"></i> Novo Cliente</a>
                        </div>
                    </div>
                </div>
                <!-- /.card-header -->
            </div>
            <!-- /.card -->
            
            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap table-bordered table-striped">
                        <thead>
                            <tr>
                                <th style="width: 35px">Cód.</th>
                                <th>Nome/Razão Social</th>
                                <th>CPF/CNPJ</th>
                                <th>Tipo</th>
                                <th class="no-print" style="width: 130px">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(!empty($clientes)): ?>
                                <?php foreach($clientes as $cliente): ?>
                                    <tr>
                                        <td><?= $cliente['id_cliente'] ?></td>
                                        <td><?= ($cliente['tipo'] == 1) ? $cliente['nome'] : $cliente['razao_social'] ?></td>
                                        
                                        <?php if($cliente['nome'] == "CONSUMIDOR FINAL"): ?>
                                            <td>Não necessário!</td>
                                        <?php else: ?>
                                            <?php if($cliente['tipo'] == 1): ?>
                                                <td class="cpf"><?= $cliente['cpf'] ?></td>
                                            <?php else: ?>
                                                <td class="cnpj"><?= $cliente['cnpj'] ?></td>
                                            <?php endif ?>
                                        <?php endif; ?>
                                        
                                        <td><?= ($cliente['tipo'] == 1) ? "Pessoa Física" : "Pessoa Jurídica" ?></td>
                                        
                                        <td>
                                            <?php if($cliente['nome'] == "CONSUMIDOR FINAL"): ?>
                                                <a href="/clientes/show/<?= $cliente['id_cliente'] ?>" class="btn btn-primary style-action"><i class="fas fa-folder-open"></i></a>
                                            <?php else: ?>
                                                <a href="/clientes/show/<?= $cliente['id_cliente'] ?>" class="btn btn-primary style-action"><i class="fas fa-folder-open"></i></a>
                                                <a href="/clientes/edit/<?= $cliente['id_cliente'] ?>" class="btn btn-warning style-action"><i class="fas fa-edit"></i></a>
                                                <button type="button" class="btn btn-danger style-action" onclick="confirmaAcaoExcluir('Deseja realmente excluir esse Cliente?', '/clientes/delete/<?= $cliente['id_cliente'] ?>')"><i class="fas fa-trash"></i></button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            <?php else: ?>
                                <tr>
                                    <td colspan="8">Nenhum registro!</td>
                                </tr>
                            <?php endif ?>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->