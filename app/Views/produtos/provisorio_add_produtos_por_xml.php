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
            </div>
            <!-- /.card -->
            
            <?php $num = 0; ?>
            <?php foreach($produtos as $produto): ?>
                <?php $num++; ?>

                <form action="/produtos/altera_dados_do_produto_provisorio_cad_por_xml" method="post" enctype="multipart/form-data">
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
                                        <input type="text" class="form-control" id="codigo_de_barras" name="codigo_de_barras" value="<?= (isset($produto)) ? $produto['codigo_de_barras'] : "SEM GTIN" ?>" <?= (isset($produto) && $produto['codigo_de_barras'] != "SEM GTIN") ? "" : "disabled"?>>
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
                                                <?php if(!empty($categorias)) : ?>
                                                    <?php foreach ($categorias as $categoria) : ?>
                                                        <option value="<?= $categoria['id_categoria'] ?>"><?= $categoria['nome'] ?></option>
                                                    <?php endforeach; ?>
                                                <?php else: ?>
                                                    <option value="">Nenhuma categoria cadastrada!</option>
                                                <?php endif;?>
                                            </select>
                                        </div>
                                    </div>
                                <?php endif; ?>

                                <div class="col-lg-12">
                                    <hr>
                                </div>

                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="">Tipo Comissão</label>
                                        <select class="form-control select2" name="tipo_da_comissao" style="width: 100%" required>
                                            <?php if(isset($produto)): ?>
                                                <?php if($produto['tipo_da_comissao'] == 1): ?>
                                                    <option value="1" selected="">Porcentagem</option>
                                                    <option value="2">Valor</option>
                                                <?php else: ?>
                                                    <option value="1">Porcentagem</option>
                                                    <option value="2" selected="">Valor</option>
                                                <?php endif; ?>
                                            <?php else: ?>
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

                                <div class="col-lg-12">
                                    <hr>
                                </div>

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

                                <!-- HIDDEN -->
                                <input type="hidden" name="id_produto_provisorio" value="<?= $produto['id_produto_provisorio'] ?>">
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
                            <a href="/produtos/finalizar_e_cadastrar_produtos_por_xml" class="btn btn-success"><i class="fas fa-save"></i> Finalizar e Cadastrar Produtos</a>
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
    function calculaMargemDeLucro()
    {
        var margem_de_lucro = document.getElementById('margem_de_lucro').value;

        // Converte de BRL para USD (Padrão americano) 
        var valor_de_custo = converteMoneyUSD(document.getElementById('valor_de_custo').value);
        
        var valor_da_margem = (margem_de_lucro * valor_de_custo / 100);

        var valor_de_venda = (parseFloat(valor_de_custo) + valor_da_margem);

        // Converte de USD (Padrão americano) para BRL
        document.getElementById('valor_de_venda').value = converteMoneyBRL(valor_de_venda);

        // Converte de USD (Padrão americano) para BRL
        document.getElementById('lucro').value = converteMoneyBRL(valor_de_venda-valor_de_custo);
    }

    function calculaMargemDeLucroInverso()
    {
        var valor_de_venda = converteMoneyUSD(document.getElementById('valor_de_venda').value);
        var valor_de_custo  = converteMoneyUSD(document.getElementById('valor_de_custo').value);

        var lucro = valor_de_venda - valor_de_custo;

        document.getElementById('margem_de_lucro').value = (lucro/valor_de_custo*100);
        document.getElementById('lucro').value = converteMoneyBRL(lucro);
    }

    function calculaMargemDeLucroInversoLucro()
    {
        var valor_de_custo = converteMoneyUSD(document.getElementById('valor_de_custo').value);
        var lucro          = converteMoneyUSD(document.getElementById('lucro').value);

        document.getElementById('valor_de_venda').value = converteMoneyBRL(parseFloat(valor_de_custo)+parseFloat(lucro));
        document.getElementById('margem_de_lucro').value = (lucro/valor_de_custo*100).toFixed(2);
    }

    function semCodigoDeBarras(id)
{
    var campo = document.getElementById(id);

        if(campo.disabled)
        {
            // campo.value = "";
            campo.disabled = false;
        }
        else
        {
            campo.value = "SEM GTIN";
            campo.disabled = true;
        }
    }
</script>

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
            <?php elseif ($alert == "success_edit") : ?>
                Toast.fire({
                    type: 'success',
                    title: 'Produto atualizado com sucesso!'
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