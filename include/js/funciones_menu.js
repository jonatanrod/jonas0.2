if (history.forward(1)) {
	location.replace(history.forward(1));
}	
/*Funcion para botones responsive del menu y menu_lateral*/
$(document).ready(main);

function main(){
	var contador_superior = 1;
	var contador_lateral  = 1;
	var contador_menu 	  = 1;
	var contador_rad	  = 1;

	$('.boton_menu').click(function despliega_superior(){ // Boton "Menu" Version Movil
		if(contador_superior == 1){
			$('.menu_superior').animate({
				left:'0'
			});
			contador_superior =0;
			$('#boton_menu').slideDown("slow");
			contador_menu=0;

			if(contador_lateral !=1){
				$('.menu_lat').animate({
				left:'-100%'
				});
			}
		}else {
			contador_superior = 1;
			$('.menu_superior').animate({
				left:'-100%'
			});
		}
	});

	$('.boton_menu_lateral').click(function despliega_lateral(){ // Boton "Menu Lateral" Version Movil
		if(contador_lateral == 1){
			$('.menu_lat').animate({
				left:'0'
			});
			contador_lateral =0;
			
			$('#boton_rad').slideDown("slow");
			contador_rad=0;

			if(contador_superior !=1){
				$('.menu_superior').animate({
				left:'-100%'
				});
			}
		}else {
			contador_lateral = 1;
			$('.menu_lat').animate({
				left:'-100%'
			});
		}
	});

	/*Mostrar y ocultar sumbenus*/
	$('#menu_superior').click(function submenu2(){
		if(contador_menu == 1){
			$('#boton_menu').slideDown("slow");
			contador_menu =0;
			if($("#boton_rad").is(":visible")){
				$('#boton_rad').slideUp("slow");
			}				
		}else {
			contador_menu = 1;
			$('#boton_menu').slideUp("slow");	
		}
	});

	$('#menu_radicacion').click(function submenu3(){
		if(contador_rad==1){
			$('#boton_rad').slideDown("slow");
			contador_rad=0;
			if($("#boton_menu").is(":visible")){
				$('#boton_menu').slideUp("slow");
			}
		}else{
			$('#boton_rad').slideUp("slow");
			contador_rad=1;
		}
	});

	$('#contenido').click(function limpia(){ // Comportamiento al hacer click en el div "contenido"
		//alert("ki"); 
		if(contador_superior != 1){			
			contador_superior = 1;
			$('.menu_superior').animate({
				left:'-100%'
			});
		}
		if(contador_lateral!=1){
			contador_lateral = 1;
			$('.menu_lat').animate({
				left:'-100%'
			});
		}
		contador_menu = 1;
		$('#boton_menu').slideUp("slow"); 	// Cierra menu configuracion
		$('#boton_rad').slideUp("slow");	// Cierra menu radicacion
	});	

}
/*Fin funcion para botones responsive del menu y menu_lateral*/
/************************************************************************/
/*Funcion para que al dar clic cargue el div #contenido*/
/*Carga el administrador de usuarios*/
	function carga_administrador_usuarios() {
		$("#contenido").load("admin_usuarios/index_usuarios.php");
		
		$('.menu_superior').animate({
				left:'-100%'
		});
	};
	/*Fin carga del administrador de usuarios*/

	/*Carga el administrador de dependencias*/
	function carga_administrador_dependencias() {
		$("#contenido").load("admin_depe/index_dependencias.php");
		
		$('.menu_superior').animate({
				left:'-100%'
		});
	};
	/*Fin carga el administrador de dependencias*/
	
	/*Carga el administrador de municipios*/
	function carga_administrador_municipios() {
		$("#contenido").load("admin_muni/index_municipios.php");
		
		$('.menu_superior').animate({
				left:'-100%'
		});
	};
	/*Fin carga el administrador de municipios*/

	/*Carga el Módulo de radicación de entrada*/
	function carga_radicacion_entrada(){
		$("#contenido").load("radicacion_entrada/index_entrada.php");
		$('.menu_lat').animate({
			left:'-100%'
		});		
	};
	/*Fin carga el Módulo de radicación de entrada*/
	/* Carga el Módulo de cambio de contraseña*/
	function cambiar_contrasena(){
		$("#contenido").load("login/cambio_contrasena.php");
	}
	/* Fin Módulo cambio de contraseña*/

	/* Cierra sesion */
	function destruir_sesion(){
		alert("La sesión ha sido cerrada. Ingrese nuevamente usuario y contraseña.")
		window.location.href='login.php';
	}
	/* Fin cierra sesion */

/*Fin funcion para que al dar clic cargue el div #contenido*/

/************************************************************************/


function cambio_pass(){
    var usuario=$('#usuario').val();
    var pass1=$('#new_pass').val();
    var pass2=$('#confirma_pass').val();
    //alert(pass1)
    if(pass1.length< 5){
      alert("La clave debe tener al menos 5 caracteres");  
    }else if(pass1.length>10){
      alert("La clave no puede tener más de 10 caracteres");
    }
    else if(pass1!=pass2){
        alert("Las contraseñas no coinciden, Por favor intente nuevamente.")
    }else if(usuario=="-Seleccionar Usuario-"){
        alert("Seleccione un usuario por favor")
    }else if(pass1==''){
        alert("Ingrese una nueva contraseña")
    }else if (!pass1.match('[a-z]')){
        alert('La clave debe tener al menos una letra minúscula');
    }else if (!pass1.match('[A-Z]')){
        alert('La clave debe tener al menos una letra mayúscula');
    }else if (!pass1.match('[0-9]')){
        alert('La clave debe tener al menos un caracter numérico');
    }else{
        //alert("si pasa")
        $('#envia_pass').submit();
    }
}