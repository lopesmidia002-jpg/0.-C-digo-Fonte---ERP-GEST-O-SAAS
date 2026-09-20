<?php

    function format($valor)
    {
        return number_format($valor, 2, '.', '');
    }
    
    function removeMascara($string)
    {
        return preg_replace("/[^0-9]/", "", $string);
    }

    function converteMoney($valor)
    {
        $valor = str_replace('.', '', $valor);
        $valor = str_replace(',', '.', $valor);

        return $valor;
    }
    
?>