<?php 
/* Archivo invocado por ajax funciones_login.js - funcion entra().
 recibe user_j y passd_j por POST */
    session_start();
    include ("conexion2.php");

    $user_j=$_POST['user_j'];
    $passd_j=$_POST['passd_j'];

    $isql ="select * from usuarios where login = trim(upper('$user_j')) and pass = md5('$passd_j')";
    
    $resultado = pg_query($conectado,$isql);

    if($resultado==false){
        echo "false";
    }else{
        if(pg_num_rows ($resultado)>0){

            $linea = pg_fetch_array($resultado);    

            $nombre=$linea['nombre_completo'];
            $nuevo = $linea['usuario_nuevo'];
            $perfil=$linea['perfil'];
            $estado=$linea['estado'];
            $nivel=$linea['nivel_seguridad'];
            $usuario=$linea['login'];
            $pw=$linea['pass'];
            $ventanilla_radicacion=$linea['ventanilla_radicacion'];
            $imagen = $linea['path_foto'];
            $id_usuario = $linea['id_usuario'];
          
            $_SESSION['nombre'] = $nombre;
            $_SESSION['perfil'] = $perfil;
            $_SESSION['nivel'] = $nivel;   
            $_SESSION['login'] = $usuario;  
            $_SESSION['pass'] = $pw; 
            $_SESSION['imagen'] = $imagen; 
            $_SESSION['id_usuario']=$id_usuario;
            $_SESSION['usuario_nuevo']=$nuevo;

            $_SESSION['ultimo_ingreso']=date("Y-n-j H:i:s"); 
        
            if($estado=="INACTIVO"){
                echo "inactivo";
            }else{
                echo "Bienvenido a Jonas";
            }
        }else{
            echo "";
        }          
    }

?>
