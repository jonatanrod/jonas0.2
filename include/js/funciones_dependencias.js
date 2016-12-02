/* Script para ventana modal - Tecla Esc */
    window.addEventListener("keyup", function(event){
        var codigo = event.keyCode || event.which;
        if (codigo == 27){
            cerrarVentanaCrearDependencia();
            cerrarVentanaModificarDependencia()
        }
    }, false);
/* Fin script para ventana modal - Tecla Esc */
/******************************************************************************************/
/* Principal ******************************************************************************/
/******************************************************************************************/
/* Script para buscador del administrador de dependencias */
$(function buscador_dependencias(){
	$('#search_dependencias').focus();
	
	$('#search_dependencias').keyup(function buscador_dependencias(){
		var envio = $('#search_dependencias').val();
		$('#logo').html('<h2>Buscador de Dependencias</h2>');

		$.ajax({
			type: 'POST',
			url: 'admin_depe/buscador_dependencias.php',
			data: {
				'search_depe' : envio,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#desplegable_resultados').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador del administrador de dependencias*/
/******************************************************************************************/
/* Agregar Nueva Dependencia **************************************************************/
/******************************************************************************************/
/*Script para ventana modal Agregar Nueva dependencia*/
function abrirVentanaCrearDependencia(){
	$("#ventana").slideDown("slow");
	$("#codigo_dependencia").focus();
}
function cerrarVentanaCrearDependencia(){
	$("#ventana").slideUp("slow");

	$('#sugerencia_codigo_dependencia').html('');
	$('#sugerencia_nombre_dependencia').html('');

	$('#codigo_dependencia').val(null); 
	$('#nombre_dependencia').val(null);
	$('#dependencia_padre').val(null);
	
	$('#codigo_dependencia_ya_existe').slideUp("slow");
	$('#error_codigo_dependencia').slideUp("slow");
	$('#error_nombre_dependencia').slideUp("slow");
	$('#error_nombre_dependencia_padre').slideUp("slow");								
	$('#error_nombre_dependencia_padre2').slideUp("slow");	
	$('#error_nombre_mod_dependencia_padre').slideUp("slow");	
	$('#error_nombre_mod_dependencia_padre2').slideUp("slow");	
	$('#error_nombre_mod_dependencia_padre3').slideUp("slow");	
	$('#nombre_dependencia_ya_existe').slideUp("slow");
	$('#valida_maximo_mod_nombre').slideUp("slow");
	$('#valida_maximo_nombre').slideUp("slow");
	$('#valida_minimo_codigo').slideUp("slow");
	$('#valida_minimo_mod_nombre').slideUp("slow");
	$('#valida_minimo_nombre').slideUp("slow");
	$('.art2').slideUp("slow");
	$('.art3').slideUp("slow");
}
/*Fin script para ventana modal Agregar Nueva Dependencia*/

/*Script para buscar dependencia desde campo codigo Formulario Agregar Nueva Dependencia*/
$(function buscador_codigo_dependencias(){
	$('#codigo_dependencia').keyup(function buscador_codigo_dependencias(){

		var codi = $('#codigo_dependencia').val();
		if(codi.length>2){

		$('#sugerencia_codigo_dependencia').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>');

			$.ajax({
				type: 'POST',
				url: 'admin_depe/buscador_dependencias.php',
				data: {
					'search_codi_depe' : codi,
					'desde_formulario' : '0'
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencia_codigo_dependencia').html(resp);
					}
				}
			})
			//validar_grabar_dependencia();
		}else{
			$('#sugerencia_codigo_dependencia').html('');
		}
	})	
})
/*Fin script para buscar dependencia desde campo codigo Formulario Agregar Nueva Dependencia*/

/*Script para buscar dependencia desde campo "Nombre de la Dependencia" del Formulario Agregar Nueva Dependencia*/
$(function buscador_nombre_dependencias(){	
	$('#nombre_dependencia').keyup(function buscador_nombre_dependencias(){

		var nom_depe = $('#nombre_dependencia').val();
			
		if(nom_depe.length>2){
		/*	$('#sugerencia_nombre_dependencia').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>'); */

			$.ajax({
				type: 'POST',
				url: 'admin_depe/buscador_dependencias.php',
				data: {
					'search_nom_depe' : nom_depe,
					'desde_formulario' : '1'
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencia_nombre_dependencia').html(resp);
					}
				}
			})
		}else{
			$('#sugerencia_nombre_dependencia').html('');
		}		
	})
})
/* Fin script para buscar dependencia desde campo "Nombre de la Dependencia", Formulario Agregar Nueva Dependencia */

/*Script para buscar dependencia_padre desde formulario Agregar Nueva Dependencia*/
$(function buscador_dependencia_padre(){
	$('#dependencia_padre').keyup(function buscador_dependencia_padre(){
		var depe_padre = $('#dependencia_padre').val();
		//$('#sugerencia_dependencia_padre').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>');
				
		$.ajax({
			type: 'POST',
			url: 'admin_depe/buscador_dependencias.php',
			data: {
				'search_depe_padre' : depe_padre,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_dependencia_padre').html(resp);
				}
			}
		})
	})
})
/* Fin script para buscar dependencia_padre desde Formulario Agregar Nueva Dependencia */

/* Inicio funciones para espacios y mayusculas Formulario Agregar Nueva Dependencia */
function espacios_codigo_dependencia(){
	var str = $('#codigo_dependencia').val();
	
	str = str.replace('-','');	str = str.replace('°','');	str = str.replace('!','');
	str = str.replace('|','');	str = str.replace('"','');	str = str.replace('$','');
	str = str.replace('#','');	str = str.replace('%','');	str = str.replace('&','');
	str = str.replace('=','');	str = str.replace('?','');	str = str.replace('¿','');
	str = str.replace('¡','');	str = str.replace('(','');	str = str.replace(')','');
	str = str.replace('{','');	str = str.replace('}','');	str = str.replace('[','');
	str = str.replace(']','');	str = str.replace('.','');	str = str.replace(';','');
	str = str.replace(':','');	str = str.replace('_','');	str = str.replace('~','');
	str = str.replace('@','');	str = str.replace('´','');	str = str.replace("+",'');
	str = str.replace("/","");	str = str.replace("*","");	str = str.replace("'","");
	str = str.replace(',','');	str = str.replace('^','');	str = str.replace('ñ','N');
	str = str.replace('Ñ','N');	str = str.replace('á','A');	str = str.replace('é','E');
	str = str.replace('í','I');	str = str.replace('ó','O');	str = str.replace('ú','U');
	str = str.replace('Á','A');	str = str.replace('É','E');	str = str.replace('Í','I');
	str = str.replace('Ó','O');	str = str.replace('Ú','U');	str = str.replace('<','');
	str = str.replace('>','');	str = str.replace(' ','');	str = str.replace(/\s/g,'');

	$('#codigo_dependencia').val(str.toUpperCase());
}
function espacios_nombre_dependencia(){
	var str2 = $('#nombre_dependencia').val();

	str2 = str2.replace('-','');	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace('.','');	str2 = str2.replace(';','');
	str2 = str2.replace(':','');	str2 = str2.replace('_','');	str2 = str2.replace('~','');
	str2 = str2.replace('@','');	str2 = str2.replace('´','');	str2 = str2.replace("+",'');
	str2 = str2.replace("/","");	str2 = str2.replace("*","");	str2 = str2.replace("'","");
	str2 = str2.replace(',','');	str2 = str2.replace('^','');	str2 = str2.replace('ñ','n');
	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','a');	str2 = str2.replace('é','E');
	str2 = str2.replace('í','i');	str2 = str2.replace('ó','o');	str2 = str2.replace('ú','u');
	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');
	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');
	str2 = str2.replace('>','');	str2 = str2.replace('  ','');

	$('#nombre_dependencia').val(str2.toUpperCase());
}
function espacios_dependencia_padre(){
	var str = $('#dependencia_padre').val();	

	str = str.replace('-','');	str = str.replace('°','');	str = str.replace('!','');
	str = str.replace('|','');	str = str.replace('"','');	str = str.replace('$','');
	str = str.replace('#','');	str = str.replace('%','');	str = str.replace('&','');
	str = str.replace('=','');	str = str.replace('?','');	str = str.replace('¿','');
	str = str.replace('¡','');	str = str.replace('(','');	str = str.replace(')','');
	str = str.replace('{','');	str = str.replace('}','');	str = str.replace('[','');
	str = str.replace(']','');	str = str.replace('.','');	str = str.replace(';','');
	str = str.replace(':','');	str = str.replace('_','');	str = str.replace('~','');
	str = str.replace('@','');	str = str.replace('´','');	str = str.replace("+",'');
	str = str.replace("/","");	str = str.replace("*","");	str = str.replace("'","");
	str = str.replace(',','');	str = str.replace('^','');	str = str.replace('ñ','n');
	str = str.replace('Ñ','N');	str = str.replace('á','a');	str = str.replace('é','E');
	str = str.replace('í','i');	str = str.replace('ó','o');	str = str.replace('ú','u');
	str = str.replace('Á','A');	str = str.replace('É','E');	str = str.replace('Í','I');
	str = str.replace('Ó','O');	str = str.replace('Ú','U');	str = str.replace('<','');
	str = str.replace('>','');	str = str.replace('  ',' ');

	$('#dependencia_padre').val(str.toUpperCase());
}
/* Fin funciones para espacios y mayusculas Formulario Agregar Nueva Dependencia */

/*Función para cargar valor dependencia padre Formulario Agregar Nueva Dependencia */
function cargar_dependencia_padre(nombre_dependencia_padre){
	$('#dependencia_padre').val(nombre_dependencia_padre);
	$('.art3').slideUp("slow");
	$('#error_nombre_dependencia_padre').slideUp("slow");
	$('#error_nombre_dependencia_padre2').slideUp("slow");
}
/*Fin función para cargar valor dependencia padre Formulario Agregar Nueva Dependencia*/

/* Validación que los campos de Formulario Agregar Nueva Dependencia (Submit) */
function validar_grabar_dependencia(){
	var codigo_dependencia =$('#codigo_dependencia').val();
	var nombre_dependencia =$('#nombre_dependencia').val();
	
	if(codigo_dependencia== ""){
		$("#codigo_dependencia_ya_existe").slideUp("slow");
		$("#error_codigo_dependencia").slideDown("slow");
		$("#valida_minimo_codigo").slideUp("slow");

		$("#codigo_dependencia").focus();
		return false;
	}else{		
		if(codigo_dependencia.length<3){
			$("#codigo_dependencia_ya_existe").slideUp("slow");
			$("#error_codigo_dependencia").slideUp("slow");
			$("#valida_minimo_codigo").slideDown("slow");

			$("#codigo_dependencia").focus();
			return false;
		}else{
			if($('.art1').is(":visible")){
				$("#codigo_dependencia_ya_existe").slideDown("slow");
				$("#error_codigo_dependencia").slideUp("slow");
				$("#valida_minimo_codigo").slideUp("slow");

				$("#codigo_dependencia").focus();
				return false;
			}else{
				$("#codigo_dependencia_ya_existe").slideUp("slow");
				$("#error_codigo_dependencia").slideUp("slow");
				$("#valida_minimo_codigo").slideUp("slow");				
			
				if(nombre_dependencia== ""){
					$("#error_nombre_dependencia").slideDown("slow");
					$("#valida_minimo_nombre").slideUp("slow");
					$("#valida_maximo_nombre").slideUp("slow");
					$("#nombre_dependencia_ya_existe").slideUp("slow");

					//$("#nombre_dependencia").focus();
					return false;
				}else{
					if(nombre_dependencia.length<6){
						$("#error_nombre_dependencia").slideUp("slow");
						$("#valida_minimo_nombre").slideDown("slow");
						$("#valida_maximo_nombre").slideUp("slow");
						$("#nombre_dependencia_ya_existe").slideUp("slow");

						$("#nombre_dependencia").focus();
						return false;
					}else{
						if(nombre_dependencia.length>40){
							$("#error_nombre_dependencia").slideUp("slow");
							$("#valida_minimo_nombre").slideUp("slow");
							$("#valida_maximo_nombre").slideDown("slow");
							$("#nombre_dependencia_ya_existe").slideUp("slow");

							$("#nombre_dependencia").focus();
							return false;
						}else{
							if($('.art2').is(":visible")){
								$("#error_nombre_dependencia").slideUp("slow");
								$("#valida_minimo_nombre").slideUp("slow");
								$("#valida_maximo_nombre").slideUp("slow");
								$("#nombre_dependencia_ya_existe").slideDown("slow");

								$("#nombre_dependencia").focus();
								return false;
							}else{
								$("#error_nombre_dependencia").slideUp("slow");
								$("#valida_minimo_nombre").slideUp("slow");
								$("#valida_maximo_nombre").slideUp("slow");
								$("#nombre_dependencia_ya_existe").slideUp("slow");

								if($('.art3').is(":visible")){
									$("#dependencia_padre").focus();
									$('#error_nombre_dependencia_padre2').slideDown("slow");
									$("#error_nombre_dependencia_padre").slideUp("slow");

									return false;
								}else{
									if($("#error_nombre_dependencia_padre").is(":visible")){
										$("#dependencia_padre").focus();
										return false;
									}else{
										return true;
									}																															
								}									
							}				
						}						
					}
				}
			}	
		}
	}	
}
$(function submit_agregar_dependencia(){
	$('#bEnviar_depe').click(function submit_agregar_dependencia(){
		var submit_agregar_dependencia = validar_grabar_dependencia();
		if(submit_agregar_dependencia==false){
			return false;
		}else if(submit_agregar_dependencia==true){
			$('#formulario_agregar_dependencia').submit(); // Realizar la creación de la Dependencia
		}else{
			alert("No se puede agregar la dependencia. Intente nuevamente")
		}										
	});
})

/* Fin validación que los campos de Formulario Agregar Nueva Dependencia (Submit) */

/******************************************************************************************/
/* Modificar Dependencia ******************************************************************/
/******************************************************************************************/
/*Funciones para desplegar ventana modal Modificar Dependencias*/

function abrirVentanaModificarDependencias(){
	$("#ventana2").slideDown("slow");
}
function cerrarVentanaModificarDependencia(){
	$("#ventana2").slideUp("slow");
	$("#valida_minimo_mod_codigo").slideUp("slow");
	$("#error_mod_nombre_dependencia").slideUp("slow");
}
/* Fin funciones para desplegar ventana modal Modificar Dependencias */

/*Script para buscar dependencia desde campo "nombre" Formulario Modificar Dependencia*/
$(function buscador_nombre_mod_dependencias(){
	$('#mod_nombre_dependencia').keyup(function buscador_nombre_mod_dependencias(){
		var mod_nombre_dependencia = $('#mod_nombre_dependencia').val();
		var antiguo_nombre_mod_dependencia=$("#antiguo_nombre_dependencia").val();
		//$('#sugerencia_mod_nombre_dependencia').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>');

		$.ajax({
			type: 'POST',
			url: 'admin_depe/buscador_dependencias.php',
			data: {
				'search_nombre_mod_depe' : mod_nombre_dependencia,
				'search_antiguo_nombre_mod_depe' : antiguo_nombre_mod_dependencia, 
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_mod_nombre_dependencia').html(resp);
				}
			}
		})
	})
})
/* Fin script para buscar dependencia desde campo "nombre" Formulario Modificar Dependencia */

/* Script para buscar dependencia_padre desde formulario Modificar Nueva Dependencia */
$(function buscador_mod_dependencia_padre(){
	$('#mod_dependencia_padre').keyup(function buscador_mod_dependencia_padre(){
		var mod_depe_padre = $('#mod_dependencia_padre').val();
		var antiguo_mod_padre=$("#antiguo_mod_padre").val();
		//$('#sugerencia_dependencia_mod_padre').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>');
				
		$.ajax({
			type: 'POST',
			url: 'admin_depe/buscador_dependencias.php',
			data: {
				'search_mod_depe_padre' : mod_depe_padre,
				'search_antiguo_mod_padre' : antiguo_mod_padre,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_dependencia_mod_padre').html(resp);
				}
			}
		})
	})
})
/* Fin script para buscar dependencia_padre desde Formulario Modificar Dependencia */

/* Alerta error al intentar modificar dependencia Formulario Modificar Dependencia se invoca en buscador_dependencias.php */
function error_modificar_dependencia(){
	alert('El codigo ingresado corresponde a una dependencia que ya existe. No es posible asignar este codigo.')
}
/* Fin alerta error al intentar modificar dependencia Formulario Modificar Dependencia*/

/* Inicio funciones para espacios y mayusculas Formulario Modificar Dependencia */
function espacios_mod_nombre_dependencia(){
	var str = $('#mod_nombre_dependencia').val();

	str = str.replace('-','');
	str = str.replace('°','');
	str = str.replace('!','');
	str = str.replace('|','');
	str = str.replace('"','');
	str = str.replace('$','');
	str = str.replace('#','');
	str = str.replace('%','');
	str = str.replace('&','');
	str = str.replace('=','');
	str = str.replace('?','');
	str = str.replace('¿','');
	str = str.replace('¡','');
	str = str.replace('(','');
	str = str.replace(')','');
	str = str.replace('{','');
	str = str.replace('}','');
	str = str.replace('[','');
	str = str.replace(']','');
	str = str.replace('.','');
	str = str.replace(';','');
	str = str.replace(':','');
	str = str.replace('_','');
	str = str.replace('~','');
	str = str.replace('@','');
	str = str.replace('´','');
	str = str.replace("+",'');
	str = str.replace("/","");
	str = str.replace("*","");
	str = str.replace("'","");
	str = str.replace(',','');
	str = str.replace('^','');
	str = str.replace('ñ','n');
	str = str.replace('Ñ','N');
	str = str.replace('á','a');
	str = str.replace('é','E');
	str = str.replace('í','i');
	str = str.replace('ó','o');
	str = str.replace('ú','u');
	str = str.replace('Á','A');
	str = str.replace('É','E');
	str = str.replace('Í','I');
	str = str.replace('Ó','O');
	str = str.replace('Ú','U');
	str = str.replace('<','');
	str = str.replace('>','');
	str = str.replace('  ',' ');

	$('#mod_nombre_dependencia').val(str);
}
function espacios_mod_dependencia_padre(){
	var str = $('#mod_dependencia_padre').val();	
	str = str.replace('-','');
	str = str.replace('°','');
	str = str.replace('!','');
	str = str.replace('|','');
	str = str.replace('"','');
	str = str.replace('$','');
	str = str.replace('#','');
	str = str.replace('%','');
	str = str.replace('&','');
	str = str.replace('=','');
	str = str.replace('?','');
	str = str.replace('¿','');
	str = str.replace('¡','');
	str = str.replace('(','');
	str = str.replace(')','');
	str = str.replace('{','');
	str = str.replace('}','');
	str = str.replace('[','');
	str = str.replace(']','');
	str = str.replace('.','');
	str = str.replace(';','');
	str = str.replace(':','');
	str = str.replace('_','');
	str = str.replace('~','');
	str = str.replace('@','');
	str = str.replace('´','');
	str = str.replace("+",'');
	str = str.replace("/","");
	str = str.replace("*","");
	str = str.replace("'","");
	str = str.replace(',','');
	str = str.replace('^','');
	str = str.replace('ñ','n');
	str = str.replace('Ñ','N');
	str = str.replace('á','a');
	str = str.replace('é','E');
	str = str.replace('í','i');
	str = str.replace('ó','o');
	str = str.replace('ú','u');
	str = str.replace('Á','A');
	str = str.replace('É','E');
	str = str.replace('Í','I');
	str = str.replace('Ó','O');
	str = str.replace('Ú','U');
	str = str.replace('<','');
	str = str.replace('>','');
	str = str.replace('  ',' ');

	$('#mod_dependencia_padre').val(str);
}
/* Fin funciones para espacios y mayusculas Formulario Modificar Dependencia */

/*Función para cargar valor dependencia padre Formulario Modificar Nueva Dependencia */
function cargar_dependencia_mod_padre(mod_dependencia_padre){
	$('#mod_dependencia_padre').val(mod_dependencia_padre);
	$('.art2').slideUp("slow");
	$('#error_nombre_mod_dependencia_padre').slideUp("slow");
	$('#error_nombre_mod_dependencia_padre2').slideUp("slow");
	$('#error_nombre_mod_dependencia_padre3').slideUp("slow");
}
/*Fin función para cargar valor dependencia padre Formulario Modificar Nueva Dependencia*/

/*Función para cargar datos al formulario de modificación de Dependencia*/
function cargar_modifica_dependencia(codigo_dependencia,nombre_dependencia,dependencia_padre,activa,id_dependencia){

	$('#mod_codigo_dependencia').val(codigo_dependencia);
	$('#antiguo_mod_padre').val(dependencia_padre);
	$('#mod_nombre_dependencia').val(nombre_dependencia);
	$('#antiguo_nombre_dependencia').val(nombre_dependencia);	
	$('#mod_dependencia_padre').val(dependencia_padre);
	$('#mod_activa').val(activa);
	$('#id_dependencia').val(id_dependencia)

	$('.art1').slideUp("slow");
	$('.art2').slideUp("slow");
	$('#cod_dependencia_ya_existe').slideUp("slow");		
	$('#mod_dependencia_ya_existe').slideUp("slow");		

	cerrarVentanaCrearDependencia();
	abrirVentanaModificarDependencias();
}	
/* Fin funcion para cargar datos al formulario de modificacion de Dependencia */

/* Validación que los campos de Formulario Modificar Dependencia (Submit) */
function validar_modificar_dependencia(){

	var antiguo_codigo=$('#antiguo_codigo').val();
	var antiguo_nombre = $('#antiguo_nombre_dependencia').val();// Este valor ya fue cargado en la funcion cargar_modifica_dependencia
	var antiguo_padre=$('#antiguo_mod_padre').val();// Este valor ya fue cargado en la funcion cargar_modifica_dependencia
	var x =$('#mod_dependencia_padre').val();
	var y =$('#mod_nombre_dependencia').val(); // Este valor ya fue cargado en la funcion cargar_modifica_dependencia
	var z =$('#mod_activa').val();

	if(y== ""){
		$("#mod_dependencia_ya_existe").slideUp("slow");
		$("#error_mod_nombre_dependencia").slideDown("slow");
		$("#valida_minimo_mod_nombre").slideUp("slow");
		$("#valida_maximo_mod_nombre").slideUp("slow");

		$("#mod_nombre_dependencia").focus();
		return false;
	}else{
		if(y.length<6){
			$("#mod_dependencia_ya_existe").slideUp("slow");
			$("#error_mod_nombre_dependencia").slideUp("slow");
			$("#valida_minimo_mod_nombre").slideDown("slow");
			$("#valida_maximo_mod_nombre").slideUp("slow");

			$('#mod_nombre_dependencia').focus();
			return false;
		}else{
			if(y.length>40){
				$("#mod_dependencia_ya_existe").slideUp("slow");
				$("#error_mod_nombre_dependencia").slideUp("slow");
				$("#valida_minimo_mod_nombre").slideUp("slow");
				$("#valida_maximo_mod_nombre").slideDown("slow");

				$('#mod_nombre_dependencia').focus();
				return false;
			}else{
				$("#mod_dependencia_ya_existe").slideUp("slow");
				$("#error_mod_nombre_dependencia").slideUp("slow");
				$("#valida_minimo_mod_nombre").slideUp("slow");
				$("#valida_maximo_mod_nombre").slideUp("slow");

				if(antiguo_nombre!=y && $('.art1').is(":visible")){/* Si hay un resultado visible, genera error */
					$("#mod_dependencia_ya_existe").slideDown("slow");
					$("#error_mod_nombre_dependencia").slideUp("slow");
					$("#valida_minimo_mod_nombre").slideUp("slow");
					$("#valida_maximo_mod_nombre").slideUp("slow");

					$('#mod_nombre_dependencia').focus();
					return false;
				}else{
					if(x!=y && $('.art2').is(":visible")){
						$('#error_nombre_mod_dependencia_padre').slideUp("slow");
						$('#error_nombre_mod_dependencia_padre2').slideDown("slow");
						$('#error_nombre_mod_dependencia_padre3').slideUp("slow");
						return false;
					}else{
						if(x==y){
							$('#error_nombre_mod_dependencia_padre').slideUp("slow");
							$('#error_nombre_mod_dependencia_padre2').slideUp("slow");							
							$('#error_nombre_mod_dependencia_padre3').slideDown("slow");
							return false;
						}else{
							if($('#error_nombre_mod_dependencia_padre2').is("visible")){
								alert("se ve padre")
								return false;
							}else{
								return true;
							}
						}			
					}
				}				
			}
		}
	}
}					
$(function submit_modificar_dependencia(){
	$('#enviar_mod_dependencia').click(function submit_modificar_dependencia(){
		if(validar_modificar_dependencia()==false){
			return false;
		}else{
			$('#formulario_modificar_dependencia').submit(); // Realizar la creación de la Dependencia
		}										
	});
})
/* Fin de validación que los campos de Formulario Modificar Dependencia (Submit) */
