<?php $session = session(); ?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel :: <?= $session->get('xFant') ?></title>

    <!-- CDNs -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
    <style>
        body{
            background: <?= $configuracao['cor_do_fundo_painel'] ?>;
        }
    </style>
<body>
    <audio id="alerta">
        <source src="<?= base_url('assets/song/alerta.wav') ?>" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <p id="senha" style="font-size: <?= $configuracao['tamanho_da_senha'] ?>px; color: <?= $configuracao['cor_da_senha'] ?>; text-align: center; font-weight: bold">S/N</p>
            </div>
            <div class="col-lg-4">
                <table class="table table-bordered table-striped" style="text-align: center; background: white">
                    <thead>
                        <tr>
                            <th style="font-size: 30px">ÚLTIMAS CHAMADAS</th>
                        </tr>
                    </thead>
                    <tbody id="historico" style="font-size: <?= $configuracao['tamanho_ultimas_senhas'] ?>px">
                        <!-- AQUI FICARÁ O HISTÓRICO -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <marquee behavior="" direction="">
                <p style="font-size: <?= $configuracao['tamanho_letreiro'] ?>px; color: <?= $configuracao['cor_do_letreiro'] ?>"><?= $configuracao['texto_do_letreiro'] ?></p>
            </marquee>
        </div>
    </div>

    <!-- JS CDNs -->
    <!-- jQuery -->
    <script src="<?= base_url('theme/plugins/jquery/jquery.js') ?>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script>
        function atualizar()
        {
            $.post(
                "/painel/atualizaSenha",

                function(data, status) {
                    if (status == "success") {
                        var senha_atual = document.getElementById('senha').innerHTML;
                        
                        if(senha_atual != data){
                            document.getElementById('alerta').play(); 
                        }

                        $('#senha').html(data);
                    }
                }
            );

            $.post(
                "/painel/atualizaQuatroUltimasSenhas",

                function(data, status) {
                    if (status == "success") {
                        $('#historico').html(data);
                    }
                }
            );
        }

        setInterval("atualizar()", 1000); // Definindo intervalo que a função será chamada
    </script>
</body>
</html>