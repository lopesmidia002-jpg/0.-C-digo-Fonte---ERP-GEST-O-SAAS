function verificaNomeCampoGeral(id) {
    var doc = document.getElementById(id);

    if (doc.value == "GERAL" || doc.value == "geral" || doc.value == "CONSUMIDOR FINAL" || doc.value == "consumidor final") {
        alert('Esse nome não pode ser cadastrado! Por favor escolher outro.');
        doc.value = "";
        doc.onfocus();
    }
}

function confirmaAcaoExcluir(msg, rota) {
    if (confirm(msg)) {
        window.location.href = rota;
    }
}

function trocaVirguraPorPonto(id) {
    var valor = document.getElementById(id).value;
    document.getElementById(id).value = valor.replace(',', '.')
}

function uppercase(id)
{
    doc = document.getElementById(id);
    doc.value = doc.value.toUpperCase();
}

function semNumero(id)
{
    var campo = document.getElementById(id);

    if(campo.disabled)
    {
        // campo.value = "";
        campo.disabled = false;
    }
    else
    {
        campo.value = "S/N";
        campo.disabled = true;
    }
}

function selecionaUF(id)
{
    var id_uf = document.getElementById(id).value;

    $.post(
        "/UF/preparaMunicipios", {
            id_uf: id_uf
        },
        function(data, status) {
            if (status == "success") {
                $('#id_municipio').html(data);
            }
        }
    );
}

function verificaUsuarioNobanco(id)
{
    var doc = document.getElementById(id);
    var usuario = doc.value;

    $.post(
        "/login/verificaUsuario", {
            usuario: usuario
        },
        function(data, status) {
            if (status == "success") {
                if(data == "1")
                {
                    alert('Esse usuário não pode ser cadastrado. Por favor, escolha outro.');
                    doc.value = "";
                    doc.focus();
                }
            }
        }
    );
}

function pegaDadosDoCNPJ(cnpj)
{
	$.post(
        "/receitaWS/pegaDadosDoCNPJ", {
            cnpj: cnpj
        },
        function(data, status) {
            if (status == "success") {
                
                var obj = JSON.parse(data);
  
                if(obj.status != "ERROR")
                {
                    $("#input-razao-social").val(obj.nome);

                    $("#cep").val(obj.cep);
                    $("#logradouro").val(obj.logradouro);
                    
                    if(obj.numero == "SN")
                    {
                        $("#numero").val("S/N");
                    }
                    else
                    {
                        $("#numero").val(obj.numero);
                    }

                    $("#complemento").val(obj.complemento);
                    $("#bairro").val(obj.bairro);

                    // Seleciona o UF pelo nome e não pelo option value.
                    $("#id_uf").val($('option:contains("' + obj.uf + '")').val() );
                    $('#id_uf').trigger('change'); // Depois de selecionado mostra a seleção na tela

                    window.setTimeout( function(){
                        // Seleciona o MUNICIPIO pelo nome e não pelo option value.
                        $("#id_municipio").val($('option:contains("' + obj.municipio + '")').val());
                        $('#id_municipio').trigger('change'); // Depois de selecionado mostra a seleção na tela
                    }, 3000 );
                }
            }
        }
    );
}

function converteMoneyUSD(valor)
{
    valor = valor.replace('.', '');
    valor = valor.replace(',', '.');

    return valor;
}

function converteMoneyBRL(valor)
{
    valor = valor.toLocaleString(
                    'pt-BR',
                    {
                        minimumFractionDigits: 2,
                        maximumFractionDigits: 2
                    }
    )

    return valor;
}