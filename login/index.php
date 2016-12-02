<!--<?php
    $entidad_largo = "Esta es la entidad larga";
    $ruta_raiz="..";
?>
<meta charset = "utf-8">
    
<link href= "../include/estilos.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../imagenes/jonas.png">
<script type = "text/javascript" src = "http://code.jquery.com/jquery-1.10.2.min.js"></script>

<title>Jonas Módulo de validación</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<style type="text/css">
    body {
       background-image: url("../imagenes/sea2.png"); 
    }
</style>

<form name=formulario action='/login/control.php' method=post id="enviar">

<table align="center" width="50%" height="500" border="0" >
    <tr align="center" >
        <th height="10%"><font class = titulos1 >Software de Gestión Documental</font></th>
    </tr>

    <td height="20%" align="center">

    <img src='../imagenes/jonasLogo.png' width="250" height="100">
    </td>


     <tr align="center">
        <td height="65%" valign="top">
        
            <tr width="50%" align="center">
                <td align = "center"> <p><input type="text" id="usuario" name="usuario" class="cuadro_texto"title="Digite su usuario para ingresar" autofocus placeholder ="Digite Usuario" value =""/ >
                <div id = "mensaje1" class = "errores">Dame tu nombre</div></p></td>
                </tr>
                <tr width="50%" align="center" >
                    <td align = "center"><p><input type=password id="contrasena" name="contrasena" class="cuadro_texto" title="Digite la contrase&ntilde;a del usuario" placeholder ="Digite contraseña" value =""/></p></td>
                </tr>
                <tr>
                    <td align = "center"><p><input type="button" class="botones" value="INGRESAR" onclick = "validar()"></p></td>
                </tr>
            </td>
        </tr>
        <tr>
            <td height="20%" align="center">
                <img src='../imagenes/logoEntidad.png' width="250" height="100 ">
            </td>
        </tr>
        <tr>
            <td height="20%" align="center">
                <font class = titulos1 ><?= $entidad_largo ?></font><br>
                <font class = titulos1 >Rep&uacute;blica de Colombia<br></font>
            </td>
        </tr>

    </table>
<script> //validar con Javascript los campos de login y contraseña

    function validar(){
       var validarNombre = document.getElementById("usuario").value;
       var contrasena = document.getElementById("contrasena").value;
       var validarTamanoNombre = validarNombre.length;
       var validarTamanoPass = contrasena.length;
            
            if(validarTamanoNombre < 4){     
                      
                alert("No has escrito nombre. Debe ser un usuario con más de 3 caracteres");
                return;
            }      
            
            if(validarTamanoPass < 3){
                alert("Contraseña inválida. Debe ser mas de 3 caracteres. Revise por favor");
                return;
            }

       document.getElementById("enviar").submit();
    }      
</script>
</body>
-->


<html>
<head>
    <meta charset="UTF-8">
    <title>Login Auditoria</title>
    <link rel="stylesheet" type="text/css" href="../include/css/estilos_entrada.css">
</head>
<body>
    <center>            
        <div id="contenedor">
            <center>
                <br>
                <img src="../imagenes/logo5.png" alt="">           
            </center>           
            <form action="validar_sesion.php" method="post">
                <table>
                    <tr>
                        <td><strong>Usuario : </strong></td>
                        <td> <input type="text" name="user" autofocus placeholder="Digite su usuario"> </td>
                    </tr>
                    <tr>
                        <td><strong>Contraseña: </strong></td>
                        <td><input type="password" name="paswd" placeholder="Digite su contraseña"></td>
                    </tr>
                    <tr><br>
                        <td colspan="2" align="center">
                            <br>
                            <input type="submit" class="boton" name="enviar" value="ENVIAR">
                            <br>
                            <br>
                        </td>
                    </tr>
                </table>
            </form>
        </div>  
    </center>
    
</body>
</html>
