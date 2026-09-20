/**
 * ERP Gestão SaaS - Funções Javascript & Interações Modernas
 */

function verificaNomeCampoGeral(id) {
    var doc = document.getElementById(id);
    if (!doc) return;

    var val = doc.value.trim().toUpperCase();
    if (val === "GERAL" || val === "CONSUMIDOR FINAL") {
        if (typeof Swal !== 'undefined') {
            Swal.fire({
                type: 'warning',
                title: 'Nome reservado',
                text: 'Esse nome não pode ser cadastrado! Por favor, escolha outro.'
            });
        } else {
            alert('Esse nome não pode ser cadastrado! Por favor, escolha outro.');
        }
        doc.value = "";
        doc.focus();
    }
}

/**
 * Confirmação de exclusão moderna com SweetAlert2
 */
function confirmaAcaoExcluir(msg, rota) {
    if (typeof Swal !== 'undefined') {
        Swal.fire({
            title: 'Confirmar exclusão?',
            text: msg || 'Esta ação não poderá ser revertida!',
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#e71d36',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Sim, excluir',
            cancelButtonText: 'Cancelar'
        }).then(function(result) {
            if (result.value) {
                window.location.href = rota;
            }
        });
    } else {
        if (confirm(msg)) {
            window.location.href = rota;
        }
    }
}

function trocaVirguraPorPonto(id) {
    var doc = document.getElementById(id);
    if (doc) {
        doc.value = doc.value.replace(',', '.');
    }
}

function uppercase(id) {
    var doc = document.getElementById(id);
    if (doc) {
        doc.value = doc.value.toUpperCase();
    }
}

function semNumero(id) {
    var campo = document.getElementById(id);
    if (!campo) return;

    if (campo.disabled) {
        campo.disabled = false;
        campo.value = "";
    } else {
        campo.value = "S/N";
        campo.disabled = true;
    }
}

function selecionaUF(id) {
    var doc = document.getElementById(id);
    if (!doc) return;

    var id_uf = doc.value;

    $.post("/UF/preparaMunicipios", { id_uf: id_uf }, function(data, status) {
        if (status === "success") {
            $('#id_municipio').html(data);
        }
    });
}

function verificaUsuarioNobanco(id) {
    var doc = document.getElementById(id);
    if (!doc) return;

    var usuario = doc.value.trim();
    if (!usuario) return;

    $.post("/login/verificaNomeDeUsuario", { usuario: usuario }, function(data, status) {
        if (status === "success" && data === "1") {
            if (typeof Swal !== 'undefined') {
                Swal.fire({
                    type: 'error',
                    title: 'Usuário indisponível',
                    text: 'Esse nome de usuário já está em uso. Por favor, escolha outro.'
                });
            } else {
                alert('Esse usuário não pode ser cadastrado. Por favor, escolha outro.');
            }
            doc.value = "";
            doc.focus();
        }
    });
}

function pegaDadosDoCNPJ(cnpj) {
    if (!cnpj) return;
    cnpj = cnpj.replace(/\D/g, '');
    if (cnpj.length !== 14) return;

    if (typeof Swal !== 'undefined') {
        Swal.fire({
            title: 'Consultando Receita...',
            text: 'Aguarde enquanto buscamos os dados do CNPJ.',
            allowOutsideClick: false,
            onBeforeOpen: function() {
                Swal.showLoading();
            }
        });
    }

    $.post("/receitaWS/pegaDadosDoCNPJ", { cnpj: cnpj }, function(data, status) {
        if (typeof Swal !== 'undefined') {
            Swal.close();
        }

        if (status === "success") {
            try {
                var obj = typeof data === 'object' ? data : JSON.parse(data);

                if (obj.status !== "ERROR") {
                    $("#input-razao-social").val(obj.nome || '');
                    $("#nome_fantasia").val(obj.fantasia || obj.nome || '');
                    $("#cep").val(obj.cep ? obj.cep.replace(/\D/g, '') : '');
                    $("#logradouro").val(obj.logradouro || '');
                    $("#numero").val(obj.numero === "SN" ? "S/N" : (obj.numero || ''));
                    $("#complemento").val(obj.complemento || '');
                    $("#bairro").val(obj.bairro || '');
                    $("#fone").val(obj.telefone ? obj.telefone.split('/')[0].trim() : '');

                    if (obj.uf) {
                        var optUf = $('option:contains("' + obj.uf + '")');
                        if (optUf.length) {
                            $("#id_uf").val(optUf.val()).trigger('change');
                        }
                    }

                    window.setTimeout(function() {
                        if (obj.municipio) {
                            var optMun = $('option:contains("' + obj.municipio + '")');
                            if (optMun.length) {
                                $("#id_municipio").val(optMun.val()).trigger('change');
                            }
                        }
                    }, 2000);

                    if (typeof Swal !== 'undefined') {
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 3500
                        });
                        Toast.fire({
                            type: 'success',
                            title: 'Dados do CNPJ preenchidos com sucesso!'
                        });
                    }
                } else {
                    if (typeof Swal !== 'undefined') {
                        Swal.fire({
                            type: 'error',
                            title: 'Consulta falhou',
                            text: obj.message || 'CNPJ não encontrado na Receita Federal.'
                        });
                    }
                }
            } catch (e) {
                console.error("Erro ao analisar resposta da Receita:", e);
            }
        }
    });
}

function converteMoneyUSD(valor) {
    if (!valor) return "0.00";
    valor = String(valor).replace(/\./g, '').replace(',', '.');
    return valor;
}

function converteMoneyBRL(valor) {
    if (isNaN(valor)) return "0,00";
    return Number(valor).toLocaleString('pt-BR', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}