<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="pt_BR">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title><?= $configuracao['nome_do_app'] ?></title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/fontawesome-free/css/all.css') ?>">
    <!-- SweetAlert2 -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.css') ?>">
    <!-- DataTables -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/datatables-bs4/css/dataTables.bootstrap4.css') ?>">
    <!-- Select2 -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/select2/css/select2.css') ?>">
    <link rel="stylesheet" href="<?= base_url('theme/plugins/select2-bootstrap4-theme/select2-bootstrap4.css') ?>">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/icheck-bootstrap/icheck-bootstrap.css') ?>">

    <!-- Toastr -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/toastr/toastr.min.css') ?>">

    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url('theme/dist/css/adminlte.css') ?>">
    <!-- Style -->
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css') ?>">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- ========= Scripts com prioridade ============= -->
    <!-- jQuery -->
    <script src="<?= base_url('theme/plugins/jquery/jquery.js') ?>"></script>
    <!-- SweetAlert2 -->
    <script src="<?= base_url('theme/plugins/sweetalert2/sweetalert2.js') ?>"></script>
    <!-- OPTIONAL SCRIPTS -->
    <script src="<?= base_url('theme/plugins/chart.js/Chart.min.js') ?>"></script>
</head>

<?php if ($configuracao['arquivo-imagem-de-fundo-login'] != "") : ?>

    <body class="hold-transition login-page" style="background-image: url('<?= base_url('assets/img') . "/" . $configuracao['arquivo-imagem-de-fundo-login'] ?>'); background-size: 100% 100%; background-repeat: no-repeat;">
    <?php else : ?>

        <body class="hold-transition login-page">
        <?php endif; ?>

        <div class="login-box">
            <div class="card">
                <div class="card-body login-card-body">
                    <div class="login-logo">
                        <span style="font-weight: bold;"><?= $configuracao['nome_do_app'] ?></span>
                    </div>
                    <!-- /.login-logo -->
                    <p class="login-box-msg">Acesse sua conta para continuar</p>

                    <form action="/login/autenticar" method="post">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" style="height: 45px" name="usuario" placeholder="Digite seu Usuário" autofocus required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" style="height: 45px" name="senha" placeholder="Digite sua Senha" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn btn-default btn-block">ACESSAR <i class="fas fa-sign-in-alt"></i></button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- Bootstrap 4 -->
        <script src="<?= base_url('theme/plugins/bootstrap/js/bootstrap.bundle.js') ?>"></script>
        <!-- Select2 -->
        <script src="<?= base_url('theme/plugins/select2/js/select2.full.js') ?>"></script>
        <!-- DataTables -->
        <script src="<?= base_url('theme/plugins/datatables/jquery.dataTables.js') ?>"></script>
        <script src="<?= base_url('theme/plugins/datatables-bs4/js/dataTables.bootstrap4.js') ?>"></script>
        <!-- Toastr -->
        <script src="<?= base_url('theme/plugins/toastr/toastr.min.js') ?>"></script>
        <!-- AdminLTE App -->
        <script src="<?= base_url('theme/dist/js/adminlte.js') ?>"></script>
        <script>
            $(function() {
                // -------------- ALERTAS ---------------- //
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 5000
                });

                <?php
                $session = session();
                $alert = $session->getFlashdata('alert');

                if (isset($alert)) : ?>



                    Toast.fire({
                        type: '<?= $alert['type'] ?>',
                        title: '<?= $alert['title'] ?>'
                    })

                <?php endif;
                ?>
            });
        </script>
        </body>

</html>