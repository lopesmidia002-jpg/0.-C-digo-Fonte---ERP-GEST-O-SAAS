<?php $session = session(); ?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?= $session->get('xApp') ?? 'ERP Gestão SaaS'; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <!-- pace-progress -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/pace-progress/themes/purple/pace-theme-flat-top.css') ?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url('theme/dist/css/adminlte.css') ?>">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="<?= base_url('theme/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') ?>">
    <!-- Style -->
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css') ?>">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- ========= Scripts com prioridade ============= -->
    <script src="<?= base_url('theme/plugins/jquery/jquery.js') ?>"></script>
    <script src="<?= base_url('theme/plugins/sweetalert2/sweetalert2.js') ?>"></script>
    <script src="<?= base_url('theme/plugins/chart.js/Chart.min.js') ?>"></script>

    <!-- ========= IMPRESSÃO ========== -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/print.css') ?>" media="print" />

    <?= $this->renderSection('styles') ?>
</head>

<body class="sidebar-mini text-sm layout-fixed layout-navbar-fixed">
    <div class="wrapper">

        <?= $this->include('templates/navbar') ?>
        <?= $this->include('templates/sidebar') ?>

        <?= $this->renderSection('conteudo') ?>

        <?= $this->include('templates/footer') ?>

    </div>
</body>
</html>
