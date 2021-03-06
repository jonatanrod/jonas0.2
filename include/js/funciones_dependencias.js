/* Script para ventana modal - Tecla Esc */
window.addEventListener("keyup", function(event){
    var codigo = event.keyCode || event.which;
    if (codigo == 27){
        cerrarVentanaCrearDependencia();
        cerrarVentanaModificarDependencia()
    }
    if(codigo== 8){ // Opcion para restringir que la tecla backspace da atras en el navegador.
    	if (history.forward(1)) {
			location.replace(history.forward(1));
		}	
    }
}, false);
/* Fin script para ventana modal - Tecla Esc */
/******************************************************************************************/
/* Principal ******************************************************************************/
/******************************************************************************************/
/* Script para buscador del administrador de dependencias */
var timerid="";

$('#search_dependencias').focus();
	
$('#search_dependencias').on("input",function(e){ // Accion que se activa cuando se digita #search_dependencias
	$('#desplegable_resultados').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100' class='imagen_logo'><br>Cargando...</h3></center>");
	var envio_dependencia = $(this).val();
		
	if ($(this).data("lastval")!=envio_dependencia) {
		$(this).data("lastval",envio_dependencia);

		clearTimeout(timerid);
		timerid = setTimeout(function(){
			if(envio_dependencia.length>2 && envio_dependencia.length<50){
				$('#logo').html('<h2>Buscador de Dependencias</h2>');
				$.ajax({
					type: 'POST',
					url: 'admin_depe/buscador_dependencias.php',
					data: {
						'search_depe' : envio_dependencia,
						'desde_formulario' : '1'
					},			
					success: function(resp){
						if(resp!=""){
							$('#desplegable_resultados').html(resp);
						}
					}
				})
			}else{
				$('#desplegable_resultados').html('');		
			}
			if(envio_dependencia.length>50){
				$('#desplegable_resultados').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  
		},1000);
	};		
});

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
	$('#sugerencia_dependencia_padre').html('');

	$('#codigo_dependencia').val(null); 
	$('#nombre_dependencia').val(null);
	$('#dependencia_padre').val(null);
	
	$('#codigo_dependencia_ya_existe').slideUp("slow");
	$('#error_codigo_dependencia').slideUp("slow");
	$('#nombre_dependencia_ya_existe').slideUp("slow");
	$('#error_nombre_dependencia').slideUp("slow");
	$('#valida_minimo_nombre').slideUp("slow");
	$('#valida_maximo_nombre').slideUp("slow");
	$('#error_nombre_dependencia_padre').slideUp("slow");								
	$('#error_nombre_dependencia_padre2').slideUp("slow");	

	$('.art2').slideUp("slow");
	$('.art3').slideUp("slow");
}
/*Fin script para ventana modal Agregar Nueva Dependencia*/

/*Script para buscar dependencia desde campo codigo Formulario Agregar Nueva Dependencia*/
$("#codigo_dependencia").on("input",function(e){ // Accion que se activa cuando se digita #codigo_dependencia
    $('#sugerencia_codigo_dependencia').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100' class='imagen_logo'><br>Cargando...</h3></center>"); 				
    var codi = $(this).val();
    
    if($(this).data("lastval")!= codi){
    	$(this).data("lastval",codi);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(codi.length>1 && codi.length<4){
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
			}else{
				$('#sugerencia_codigo_dependencia').html('');
			}	
			if(codi.length>50){
				$('#sugerencia_codigo_dependencia').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
/*Fin script para buscar dependencia desde campo codigo Formulario Agregar Nueva Dependencia*/

/*Script para buscar dependencia desde campo "Nombre de la Dependencia" del Formulario Agregar Nueva Dependencia*/
$("#nombre_dependencia").on("input",function(e){ // Accion que se activa cuando se digita #nombre_dependencia
    $('#sugerencia_nombre_dependencia').html("<center class='imagen_logo'><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>"); 				
    var nom_depe = $(this).val();
    
    if($(this).data("lastval")!= nom_depe){
    	$(this).data("lastval",nom_depe);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(nom_depe.length>1 && nom_depe.length<50){
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
			if(nom_depe.length>50){
				$('#sugerencia_nombre_dependencia').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
/* Fin script para buscar dependencia desde campo "Nombre de la Dependencia", Formulario Agregar Nueva Dependencia */

/*Script para buscar dependencia_padre desde formulario Agregar Nueva Dependencia*/
$("#dependencia_padre").on("input",function(e){ // Accion que se activa cuando se digita #dependencia_padre
    $('#sugerencia_dependencia_padre').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>"); 				
    var depe_padre = $(this).val();
    
    if($(this).data("lastval")!= depe_padre){
    	$(this).data("lastval",depe_padre);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(depe_padre.length<50){
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
			}else{
				$('#sugerencia_dependencia_padre').html('');
			}	
			if(depe_padre.length>50){
				$('#sugerencia_dependencia_padre').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});

/* Fin script para buscar dependencia_padre desde Formulario Agregar Nueva Dependencia */
/* Inicio funciones para espacios y mayusculas Formulario Agregar Nueva Dependencia */
function espacios_formulario_dependencia(input){
	switch(input){
		case 'nombre_dependencia':
			var str = $('#nombre_dependencia').val();
			break;	
		case 'dependencia_padre':
			var str = $('#dependencia_padre').val();	
			break;
		case 'mod_nombre_dependencia':
			var str = $('#mod_nombre_dependencia').val();			
			break;
		case 'mod_dependencia_padre':
			var str = $('#mod_dependencia_padre').val();			
			break;	
		case 'search_dependencias':
			var str = $('#search_dependencias').val();
			break;		
	}
		str = str.replace('-',''); 	str = str.replace('°','');	str = str.replace('!','');
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
		str = str.replace('>','');	str = str.replace('  ','');

	switch(input){
		case 'nombre_dependencia':
			$('#nombre_dependencia').val(str.toUpperCase());
			break;	
		case 'dependencia_padre':
			$('#dependencia_padre').val(str.toUpperCase());
			break;	
		case 'mod_nombre_dependencia':
			$('#mod_nombre_dependencia').val(str.toUpperCase());			
			break;
		case 'mod_dependencia_padre':
			$('#mod_dependencia_padre').val(str.toUpperCase());			
			break;	
		case 'search_dependencias':
			$('#search_dependencias').val(str.toUpperCase());	
			break;			
		}	
}

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
	str = str.replace(',','');	str = str.replace('^','');	str = str.replace('ñ','n');
	str = str.replace('Ñ','N');	str = str.replace('á','A');	str = str.replace('é','E');
	str = str.replace('í','I');	str = str.replace('ó','O');	str = str.replace('ú','U');
	str = str.replace('Á','A');	str = str.replace('É','E');	str = str.replace('Í','I');
	str = str.replace('Ó','O');	str = str.replace('Ú','U');	str = str.replace('<','');
	str = str.replace('>','');	str = str.replace('  ',''); str = str.replace(' ','');

	$('#codigo_dependencia').val(str.toUpperCase());
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
		if($('.imagen_logo').is(":visible")){
			alert("Espere porfa")
		}else{
			alert("Siga pues")
		}
		var submit_agregar_dependencia = validar_grabar_dependencia();
		if(submit_agregar_dependencia==false){
			return false;
		}else if(submit_agregar_dependencia==true){
		//	$('#formulario_agregar_dependencia').submit(); // Realizar la creación de la Dependencia
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
	$("#mod_nombre_dependencia").focus();
}
function cerrarVentanaModificarDependencia(){
	$("#ventana2").slideUp("slow");
	$("#search_dependencias").focus();

	$(".art1").slideUp("slow");
	$(".art2").slideUp("slow");
	$(".art3").slideUp("slow");

	$("#id_dependencia").val("");
	$("#antiguo_mod_padre").val("");
	$("#mod_codigo_dependencia").val("");
	$("#mod_nombre_dependencia").val("");
	$("#antiguo_nombre_dependencia").val("");

	$("#mod_dependencia_ya_existe").slideUp("slow");
	$('#valida_minimo_mod_nombre').slideUp("slow");
	$('#error_nombre_mod_dependencia_padre').slideUp("slow");	
	$('#error_nombre_mod_dependencia_padre2').slideUp("slow");	
	$('#error_nombre_mod_dependencia_padre3').slideUp("slow");	
	$("#error_mod_nombre_dependencia").slideUp("slow");
}
/* Fin funciones para desplegar ventana modal Modificar Dependencias */
/* Script para buscador dependencia por nombre en formulario Modificar Dependencia */
$('#mod_nombre_dependencia').on("input",function(e){ // Accion que se activa cuando se digita #search_dependencias
	$('#sugerencia_mod_nombre_dependencia').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	var search_nombre_mod_depe = $(this).val();
	var search_antiguo_nombre_mod_depe = $("#antiguo_nombre_dependencia").val();
	
	if($(this).data("lastval")!=search_nombre_mod_depe) {
		$(this).data("lastval",search_nombre_mod_depe);

		clearTimeout(timerid);
		timerid = setTimeout(function(){
			if(search_nombre_mod_depe.length>2 && search_nombre_mod_depe.length<50){
				$.ajax({
					type: 'POST',
					url: 'admin_depe/buscador_dependencias.php',
					data: {
						'search_nombre_mod_depe' : search_nombre_mod_depe,
						'search_antiguo_nombre_mod_depe' : search_antiguo_nombre_mod_depe,
						'desde_formulario' : '1'
					},			
					success: function(resp){
						if(resp!=""){
							$('#sugerencia_mod_nombre_dependencia').html(resp);
						}
					}
				})
			}else{
				$('#sugerencia_mod_nombre_dependencia').html('');		
			}
			if(search_nombre_mod_depe.length>50){
				$('#sugerencia_mod_nombre_dependencia').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  
		},1000);
	};		
});
/* Fin script para buscador dependencia por nombre en formulario Modificar Dependencia */

/* Script para buscar dependencia_padre desde formulario Modificar Dependencia */
$('#mod_dependencia_padre').on("input",function(e){ // Accion que se activa cuando se digita #mod_dependencia_padre
	$('#sugerencia_dependencia_mod_padre').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	var mod_depe_padre = $(this).val();
	var antiguo_mod_padre = $("#antiguo_mod_padre").val();
	
	if ($(this).data("lastval")!=mod_depe_padre) {
		$(this).data("lastval",mod_depe_padre);

		clearTimeout(timerid);
		timerid = setTimeout(function(){
			if(mod_depe_padre.length>2 && mod_depe_padre.length<50){
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
			}else{
				$('#sugerencia_dependencia_mod_padre').html('');	
				$('.errores').slideUp('slow');		
			}
			if(mod_depe_padre.length>50){
				$('#sugerencia_dependencia_mod_padre').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  
		},1000);
	};		
});


/* Fin script para buscar dependencia_padre desde Formulario Modificar Dependencia */

/* Alerta error al intentar modificar dependencia Formulario Modificar Dependencia se invoca en buscador_dependencias.php */
function error_modificar_dependencia(){
	alert('El codigo seleccionado corresponde a una dependencia que ya existe. No es posible asignar este codigo.')
}
/* Fin alerta error al intentar modificar dependencia Formulario Modificar Dependencia*/

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
/* Funcion para validar mod_nombre_dependencia */
function validar_mod_nombre_dependencia(){
	var mod_nombre_dependencia =$('#mod_nombre_dependencia').val(); // Este valor ya fue cargado en la funcion cargar_modifica_dependencia
	var antiguo_nombre = $('#antiguo_nombre_dependencia').val();// Este valor ya fue cargado en la funcion cargar_modifica_dependencia

	if(mod_nombre_dependencia==""){
		$("#mod_dependencia_ya_existe").slideUp("slow");
		$("#error_mod_nombre_dependencia").slideDown("slow");
		$("#valida_minimo_mod_nombre").slideUp("slow");
		$("#valida_maximo_mod_nombre").slideUp("slow");
		return false;
	}else{
		if(mod_nombre_dependencia.length<6){
			$("#mod_dependencia_ya_existe").slideUp("slow");
			$("#error_mod_nombre_dependencia").slideUp("slow");
			$("#valida_minimo_mod_nombre").slideDown("slow");
			$("#valida_maximo_mod_nombre").slideUp("slow");
			return false;
		}else{
			if(mod_nombre_dependencia.length>50){
				$("#mod_dependencia_ya_existe").slideUp("slow");
				$("#error_mod_nombre_dependencia").slideUp("slow");
				$("#valida_minimo_mod_nombre").slideUp("slow");
				$("#valida_maximo_mod_nombre").slideDown("slow");
				return false;
			}else{
				if($(".art1").is(":visible")){
					$("#mod_dependencia_ya_existe").slideDown("slow");
					$("#error_mod_nombre_dependencia").slideUp("slow");
					$("#valida_minimo_mod_nombre").slideUp("slow");
					$("#valida_maximo_mod_nombre").slideUp("slow");
					return false;
				}else{
					return true;				
				}
			}
		}
	}	
}
/* Fin funcion para validar mod_nombre_dependencia */
/* Funcion para validar mod_dependencia_padre */
function validar_mod_nombre_dependencia_padre(){
	var mod_nombre_dependencia_padre =$('#mod_dependencia_padre').val();
	var antiguo_padre=$('#antiguo_mod_padre').val();// Este valor ya fue cargado en la funcion cargar_modifica_dependencia
	
	if($(".art2").is(":visible")){
		$("#error_nombre_mod_dependencia_padre").slideUp("slow");
		$("#error_nombre_mod_dependencia_padre2").slideDown("slow");
		$("#error_nombre_mod_dependencia_padre3").slideUp("slow");
		return false;
	}
	if($('#error_nombre_mod_dependencia_padre').is(':visible')){
		return false;
	}else{
		if($('#error_nombre_mod_dependencia_padre2').is(':visible')){
			return false;
		}else{
			if($('#error_nombre_mod_dependencia_padre3').is(':visible')){
				return false;
			}else{
				return true;
			}	
		}
	}
}
/* Fin funcion para validar mod_dependencia_padre */

/* Validación que los campos de Formulario Modificar Dependencia (Submit) */
function validar_modificar_dependencia(){
	var validar_mod_nombre_depe = validar_mod_nombre_dependencia();
	
	if(validar_mod_nombre_depe==false){
		$("#mod_nombre_dependencia").focus()
		return false;
	}else{
		var validar_mod_nombre_depe_padre= validar_mod_nombre_dependencia_padre();
		if(validar_mod_nombre_depe_padre==false){
			$("#mod_dependencia_padre").focus();
			return false;
		}else{
			return true;
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
/* Funciones para agregar a auditoria */
function auditoria(tipo_formulario,nombre_dependencia){
	switch(tipo_formulario){
		case'crear_dependencia':
		var trans = "creado";
			break;
		case'modificar_dependencia':
		var trans ="modificado";	
	}
	$.ajax({	// Guardo registro de ingreso al sistema para auditoria
		type: 'POST',
		url: '../login/transacciones.php',
		data: {
			'transaccion' : tipo_formulario,
			'creado' : 	nombre_dependencia
		},			
		success: function(resp1){
			if(resp1=="true"){
				 alert('La dependencia '+nombre_dependencia+' ha sido '+trans+' correctamente') 
				volver();
			}else{
				alert(resp1)
			}
		}
	})
}
function volver(){
	window.location.href='../principal3.php'
}
/* Fin funciones para agregar a auditoria */
