<!-- Main Footer -->
<footer id="footer" class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
        Versão 1.0.1
    </div>
    <!-- Default to the left -->
    <?php $session = session() ?>
    <strong><?= $session->get('xApp') . " :: " . $session->get('xFant') ?> &copy; <?= date('Y') ?> </strong> - Todos os direitos reservados.
</footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- Bootstrap 4 -->
<script src="<?= base_url('theme/plugins/bootstrap/js/bootstrap.bundle.js') ?>"></script>
<!-- Select2 -->
<script src="<?= base_url('theme/plugins/select2/js/select2.full.js') ?>"></script>
<!-- DataTables -->
<script src="<?= base_url('theme/plugins/datatables/jquery.dataTables.js') ?>"></script>
<script src="<?= base_url('theme/plugins/datatables-bs4/js/dataTables.bootstrap4.js') ?>"></script>
<!-- Bootstrap Switch -->
<script src="<?= base_url('theme/plugins/bootstrap-switch/js/bootstrap-switch.min.js') ?>"></script>
<!-- overlayScrollbars -->
<script src="<?= base_url('theme/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') ?>"></script>
<!-- pace-progress -->
<script src="<?= base_url('theme/plugins/pace-progress/pace.min.js') ?>"></script>
<!-- AdminLTE App -->
<script src="<?= base_url('theme/dist/js/adminlte.js') ?>"></script>
<!-- Scripts internos do sistema -->
<script src="<?= base_url('assets/js/funcoes.js') ?>"></script>
<!-- ViaCep -->
<script src="<?= base_url('assets/js/viaCep.js') ?>"></script>
<!-- Plugin Mascaras -->
<script src="<?= base_url('assets/js/jquery.mask.js') ?>"></script>
<!-- Scripts Mascaras -->
<script src="<?= base_url('assets/js/mascaras.js') ?>"></script>
<!-- Scripts validação CPF e CNPJ -->
<script src="<?= base_url('assets/js/validador.js') ?>"></script>
<script>
    $(function() {
        <?php
            $session = session();
            $alert = $session->getFlashdata('alert');

            if (isset($alert)) : ?>

                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 5000
                });

                Toast.fire({
                    type: '<?= $alert['type'] ?>',
                    title: '<?= $alert['title']?>'
                })
                
            <?php endif;
        ?>

        // DataTables
        $("#example1").DataTable();
        $("#example1-2").DataTable();
        $("#example1-3").DataTable();
        $("#example1-4").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
        });

        //Initialize Select2 Elements
        $('.select2').select2()

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })

    });

    function confirmaAcaoExcluir(msg, rota) {
        if (confirm(msg)) {
            window.location.href = rota;
        }
    }

    function trocaVirguraPorPonto(id) {
        var valor = document.getElementById(id).value;
        document.getElementById(id).value = valor.replace(',', '.')
    }

    <?php if(isset($link) && isset($link['subItem'])): ?>
        document.getElementById('<?= $link['li'] ?>').className = "nav-item has-treeview menu-open";
        document.getElementById('<?= $link['item'] ?>').className = "nav-link active";
        document.getElementById('<?= $link['subItem'] ?>').className = "nav-link active";
    <?php else: ?>
        document.getElementById('<?= $link['item'] ?>').className = "nav-link active";
    <?php endif; ?>
</script>
</body>

</html>