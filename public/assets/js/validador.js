function notificaUsuario(doc, tipo)
{
	doc.value = "";
	
	// Remove o is-valid do campo caso o usuário sejá notificado que o cpf ou cnpj seja invalido.
	if(tipo == "CPF")
	{
		alert("O CPF digitado é invalido!");
		doc.className = "form-control cpf";
	}
	else
	{
		alert("O CNPJ digitado é invalido!");
		doc.className = "form-control cnpj";
	}

	doc.focus();
}

function validarCPF(id) {
	var doc_cpf = document.getElementById(id);
	cpf = doc_cpf.value;

	if (cpf.length != 14) { // Valida primeiro se o CPF tem 14 digitos (numeros com mascara)
		return "";
	}

	cpf = cpf.replace(/[^\d]+/g,''); // Remove a mascara do CPF

	if(cpf == '')
	{
		return false; // Não retorna mensagem de erro pois o HTML validará se o campo está em branco.
	}	
	// Elimina CPFs invalidos conhecidos	
	if (cpf.length != 11 || 
		cpf == "00000000000" || 
		cpf == "11111111111" || 
		cpf == "22222222222" || 
		cpf == "33333333333" || 
		cpf == "44444444444" || 
		cpf == "55555555555" || 
		cpf == "66666666666" || 
		cpf == "77777777777" || 
		cpf == "88888888888" || 
		cpf == "99999999999")
		{
			// alert("O CPF digitado é invalido!");
			// doc_cpf.value = "";
			// doc_cpf.focus();

			notificaUsuario(doc_cpf, "CPF");
			return false;
		}		
	// Valida 1o digito	
	add = 0;	
	for (i=0; i < 9; i ++)		
		add += parseInt(cpf.charAt(i)) * (10 - i);	
		rev = 11 - (add % 11);	
		if (rev == 10 || rev == 11)		
			rev = 0;	
		if (rev != parseInt(cpf.charAt(9)))
		{
			notificaUsuario(doc_cpf, "CPF");	
			return false;
		}
	// Valida 2o digito	
	add = 0;	
	for (i = 0; i < 10; i ++)		
		add += parseInt(cpf.charAt(i)) * (11 - i);	
	rev = 11 - (add % 11);	
	if (rev == 10 || rev == 11)	
		rev = 0;	
	if (rev != parseInt(cpf.charAt(10)))
	{
		notificaUsuario(doc_cpf, "CPF");
		return false;
	}

	doc_cpf.className += " is-valid"; // Marca o campo de verde para informar que é válido.
	return true; // Retorna TRUE quando o CPF for válido
}

function validarCNPJ(id) {
	var doc_cnpj = document.getElementById(id);
	var cnpj = doc_cnpj.value;

	if (cnpj.length != 18){ // Valida primeiro se o CNPJ tem 18 digitos (numeros com mascara)
		return "";
	}
 
    cnpj = cnpj.replace(/[^\d]+/g,'');
 
    if(cnpj == '') return false;
     
	if (cnpj.length != 14)
	{
		notificaUsuario(doc_cnpj, "CNPJ");
		return false;
	}
        
 
    // Elimina CNPJs invalidos conhecidos
    if (cnpj == "00000000000000" || 
        cnpj == "11111111111111" || 
        cnpj == "22222222222222" || 
        cnpj == "33333333333333" || 
        cnpj == "44444444444444" || 
        cnpj == "55555555555555" || 
        cnpj == "66666666666666" || 
        cnpj == "77777777777777" || 
        cnpj == "88888888888888" || 
		cnpj == "99999999999999")
		{
			notificaUsuario(doc_cnpj, "CNPJ");
			return false;
		}
        
         
    // Valida DVs
    tamanho = cnpj.length - 2
    numeros = cnpj.substring(0,tamanho);
    digitos = cnpj.substring(tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
      soma += numeros.charAt(tamanho - i) * pos--;
      if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
	if (resultado != digitos.charAt(0))
	{
		notificaUsuario(doc_cnpj, "CNPJ");
		return false;
	}
        
         
    tamanho = tamanho + 1;
    numeros = cnpj.substring(0,tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
      soma += numeros.charAt(tamanho - i) * pos--;
      if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
	if (resultado != digitos.charAt(1))
	{
		notificaUsuario(doc_cnpj, "CNPJ");
		return false;
	}

	pegaDadosDoCNPJ(cnpj);

	doc_cnpj.className += " is-valid"; // Marca o campo de verde para informar que é válido.
	return true; // Retorna TRUE quando o CNPJ for válido
}