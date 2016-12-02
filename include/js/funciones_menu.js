if (history.forward(1)) {
	location.replace(history.forward(1));
}	
/*Funcion para botones responsive del menu y menu_lateral*/
$(document).ready(main);

function main(){
	var contador_superior = 1;
	var contador_lateral  = 1;

	$('.boton_menu').click(function despliega_superior(){
		if(contador_superior == 1){
			$('.menu_superior').animate({
				left:'0'
			});
			contador_superior =0;

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

	$('.boton_menu_lateral').click(function despliega_lateral(){
		if(contador_lateral == 1){
			$('.menu_lat').animate({
				left:'0'
			});
			contador_lateral =0;
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
	$('.submenu').click(function submenu2(){
		$(this).children('.children').slideToggle();
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

/*Fin funcion para que al dar clic cargue el div #contenido*/
/************************************************************************/