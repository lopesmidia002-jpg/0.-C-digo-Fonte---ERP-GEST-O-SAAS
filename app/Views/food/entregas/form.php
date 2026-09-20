<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <form action="/food/storeEntrega" method="post">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-6">
                                <h6 class="m-0 text-dark"><i class="<?= $titulo['icone'] ?>"></i> <?= $titulo['modulo'] ?></h6>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="/food/entregas" class="btn btn-success button-voltar"><i class="fa fa-arrow-alt-circle-left"></i> Voltar</a>
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
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label>Status</label>
                                    <select class="form-control select2" name="status" style="width: 100%;" required>
                                        <?php if(isset($entrega)): ?>
                                            <?php if($entrega['status'] == "Aberta"): ?>
                                                <option value="Aberta" selected="">Aberta</option>
                                                <option value="Entregue">Entregue</option>
                                                <option value="Cancelada">Cancelada</option>
                                                <option value="Devolvida">Devolvida</option>
                                            <?php elseif($entrega['status'] == "Entregue") : ?>
                                                <option value="Aberta">Aberta</option>
                                                <option value="Entregue" selected="">Entregue</option>
                                                <option value="Cancelada">Cancelada</option>
                                                <option value="Devolvida">Devolvida</option>
                                            <?php elseif($entrega['status'] == "Cancelada") : ?>
                                                <option value="Aberta">Aberta</option>
                                                <option value="Entregue">Entregue</option>
                                                <option value="Cancelada" selected="">Cancelada</option>
                                                <option value="Devolvida">Devolvida</option>
                                            <?php elseif($entrega['status'] == "Devolvida") : ?>
                                                <option value="Aberta">Aberta</option>
                                                <option value="Entregue">Entregue</option>
                                                <option value="Cancelada">Cancelada</option>
                                                <option value="Devolvida" selected="">Devolvida</option>
                                            <?php endif; ?>
                                        <?php else :?>
                                            <option value="Aberta" selected="">Aberta</option>
                                            <option value="Entregue">Entregue</option>
                                            <option value="Cancelada">Cancelada</option>
                                            <option value="Devolvida">Devolvida</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="">Nome</label>
                                    <input type="text" class="form-control" name="nome" value="<?= (isset($entrega)) ? $entrega['nome'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Endereço</label>
                                    <input type="text" class="form-control" name="endereco" value="<?= (isset($entrega)) ? $entrega['endereco'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Troco Para</label>
                                    <input type="text" class="form-control money" id="troco_para" name="troco_para" value="<?= (isset($entrega)) ? number_format($entrega['troco_para'], 2, ',', '.') : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Forma de Pagamento</label>
                                    <select class="form-control select2" name="forma_de_pagamento" style="width: 100%" required>
                                        <?php if(isset($entrega)) : ?>
                                            <?php foreach($formas_de_pagamentos as $forma): ?>
                                                <option value="<?= $forma['nome'] ?>" <?= ($entrega['forma_de_pagamento'] == $forma['nome']) ? "selected" : "" ?>><?= $forma['nome'] ?></option>
                                            <?php endforeach; ?>
                                        <?php else: ?>
                                            <?php foreach($formas_de_pagamentos as $forma) : ?>
                                                <option value="<?= $forma['nome'] ?>"><?= $forma['nome'] ?></option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Serviço</label>
                                    <select class="form-control select2" name="servico" style="width: 100%" required>
                                        <?php if(isset($entrega)) :?>
                                            <?php foreach($servicos as $servico) :?>
                                                <option value="<?= $servico['nome'] ?>" <?= ($entrega['servico'] == $servico['nome']) ? "selected" : "" ?>><?= $servico['nome'] ?></option>
                                            <?php endforeach;?>
                                        <?php else: ?>
                                            <?php foreach($servicos as $servico) :?>
                                                <option value="<?= $servico['nome'] ?>"><?= $servico['nome'] ?></option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Data</label>
                                    <input type="date" class="form-control" name="data" value="<?= (isset($entrega)) ? $entrega['data'] : date('Y-m-d') ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="">Hora</label>
                                    <input type="time" class="form-control" name="hora" value="<?= (isset($entrega)) ? $entrega['hora'] : date("H:i") ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Celula 1</label>
                                    <input type="text" class="form-control celular" name="celular_1" value="<?= (isset($entrega)) ? $entrega['celular_1'] : "" ?>" required="">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Celula 2</label>
                                    <input type="text" class="form-control celular" name="celular_2" value="<?= (isset($entrega)) ? $entrega['celular_2'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Fixo</label>
                                    <input type="text" class="form-control fixo" name="fixo" value="<?= (isset($entrega)) ? $entrega['fixo'] : "" ?>">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="">Entregador</label>
                                    <select class="form-control select2" name="id_entregador" style="width: 100%" required>
                                        <?php if(!empty($entregadores)): ?>
                                            <?php foreach($entregadores as $entregador): ?>
                                                <option value="<?= $entregador['id_entregador'] ?>"><?= $entregador['nome'] ?></option>
                                            <?php endforeach; ?>
                                        <?php else: ?>
                                            <option value="">Nenhum entregador cadastrado!</option>
                                        <?php endif; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="">Observações</label>
                                    <input type="text" class="form-control" name="observacoes" value="<?= (isset($entrega)) ? $entrega['observacoes'] : "" ?>">
                                </div>
                            </div>

                            <?php if (isset($entrega)) : ?>
                                <!-- HIDDENS -->
                                <input type="hidden" class="form-control" name="id_entrega" value="<?= $entrega['id_entrega'] ?>">
                            <?php endif; ?>

                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-lg-12" style="text-align: right">
                                <button type="submit" class="btn btn-primary"><?= (isset($entrega)) ? "Atualizar" : "Cadastrar" ?></button>
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