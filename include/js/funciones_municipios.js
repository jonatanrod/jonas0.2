/* Script para ventana modal - Tecla Esc */
    window.addEventListener("keyup", function(event){
        var codigo = event.keyCode || event.which;
        if (codigo == 27){
            cerrarVentanaCrearMunicipios();
            cerrarVentanaModificarMunicipios()
        }
    }, false);
/* Fin script para ventana modal - Tecla Esc */

/*Funciones para limpiar el formulario*/
function limpia_formulario_agregar(){
	$('#pais').val("");
	$('#departamento').val("");
	$('#municipio').val("");

	$(".art").slideUp("slow");

	$("#error_pais").slideUp("slow");
	$("#error_pais_minimo").slideUp("slow");
	$("#error_pais_maximo").slideUp("slow");
	$("#error_pais_invalido").slideUp("slow");

	$("#error_departamento").slideUp("slow");
	$("#error_departamento_minimo").slideUp("slow");
	$("#error_departamento_maximo").slideUp("slow");
	$("#error_departamento_invalido").slideUp("slow");
	
	$("#error_municipio").slideUp("slow");
	$("#error_municipio_minimo").slideUp("slow");
	$("#error_municipio_maximo").slideUp("slow");
	$("#error_municipio_invalido").slideUp("slow");

	$("#pais").focus();
}
/*Fin funciónes para limpiar el formulario*/

/*Funciones para desplegar ventana modal municipios*/
function abrirVentanaCrearMunicipios(){
	$("#ventana").slideDown("slow");
}
function cerrarVentanaCrearMunicipios(){
	$("#ventana").slideUp("slow");
	$(".art").slideUp("slow");

	$("#error_pais").slideUp("slow");
	$("#error_pais_minimo").slideUp("slow");
	$("#error_pais_maximo").slideUp("slow");
	$("#error_pais_invalido").slideUp("slow");

	$("#error_departamento").slideUp("slow");
	$("#error_departamento_minimo").slideUp("slow");
	$("#error_departamento_maximo").slideUp("slow");
	$("#error_departamento_invalido").slideUp("slow");
	
	$("#error_municipio").slideUp("slow");
	$("#error_municipio_minimo").slideUp("slow");
	$("#error_municipio_maximo").slideUp("slow");
	$("#error_municipio_invalido").slideUp("slow");
}
/*Fin funciones para desplegar ventana modal municipios*/

/*Script buscador - Administrador de Municipios*/
$(function buscador_municipios(){
	$('#search').focus();
	
	$('#search').keyup(function buscador_municipios(){
		var envio = $('#search').val();
		$('#logo').html('<h2>Buscador de Municipios</h2>');
		$('#desplegable_resultados').html('<h2><img src="imagenes/loading.gif" alt="" /></h2>');

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search' : envio,
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
/*Fin script buscador - Administrador de Municipios*/
/*Script para buscador de Pais - Formulario Agregar Nuevo Municipio */
$(function buscador_pais(){
	$('#pais').focus();
	
	$('#pais').keyup(function buscador_pais(){
		var envio_continente=$("#continente").val();
		var envio_pais = $('#pais').val();

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_pais' : envio_pais,
				'search_continente': envio_continente,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_pais').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador de Pais - Formulario Agregar Nuevo Municipio */
/*Script para buscador de departamento - Formulario Agregar Nuevo Municipio */
$(function buscador_departamento(){
	$('#departamento').focus();
	
	$('#departamento').keyup(function buscador_departamento(){
		var envio_pais=$("#pais").val();
		var envio_departamento = $('#departamento').val();

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_departamento' : envio_departamento,
				'search_pais2': envio_pais,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_departamento').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador de departamento - Formulario Agregar Nuevo Municipio */
/*Script para buscador de municipio - Formulario Agregar Nuevo Municipio */
$(function buscador_municipio(){
	$('#municipio').focus();
	
	$('#municipio').keyup(function buscador_municipio(){
		var envio_municipio=$("#municipio").val();
		var envio_departamento = $('#departamento').val();

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_departamento2' : envio_departamento,
				'search_municipio': envio_municipio,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_municipio').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador de municipio - Formulario Agregar Nuevo Municipio */
/* Script cargar pais - Formulario Agregar Nuevo Municipio */
function cargar_pais(nombre_pais){
	$(".art").slideUp("slow");

	$("#error_pais").slideUp("slow");
	$("#error_pais_minimo").slideUp("slow");
	$("#error_pais_maximo").slideUp("slow");
	$("#error_pais_invalido").slideUp("slow");

	$("#error_departamento").slideUp("slow");
	$("#error_departamento_minimo").slideUp("slow");
	$("#error_departamento_maximo").slideUp("slow");
	$("#error_departamento_invalido").slideUp("slow");
	
	$("#error_municipio").slideUp("slow");
	$("#error_municipio_minimo").slideUp("slow");
	$("#error_municipio_maximo").slideUp("slow");
	$("#error_municipio_invalido").slideUp("slow");

	$("#pais").val(nombre_pais);
	$("#departamento").val("");
	$("#municipio").val("");
	$("#departamento").focus();
}
/* Fin script cargar pais - Formulario Agregar Nuevo Municipio */
/* Script cargar departamento - Formulario Agregar Nuevo Municipio */
function cargar_departamento(nombre_departamento){
	$(".art").slideUp("slow");

	$("#error_pais").slideUp("slow");
	$("#error_pais_minimo").slideUp("slow");
	$("#error_pais_maximo").slideUp("slow");
	$("#error_pais_invalido").slideUp("slow");

	$("#error_departamento").slideUp("slow");
	$("#error_departamento_minimo").slideUp("slow");
	$("#error_departamento_maximo").slideUp("slow");
	$("#error_departamento_invalido").slideUp("slow");
	
	$("#error_municipio").slideUp("slow");
	$("#error_municipio_minimo").slideUp("slow");
	$("#error_municipio_maximo").slideUp("slow");
	$("#error_municipio_invalido").slideUp("slow");

	$("#departamento").val(nombre_departamento);
	$("#municipio").val("");
	$("#municipio").focus();
}
/* Fin script cargar departamento - Formulario Agregar Nuevo Municipio */
/* Script cargar municipio - Formulario Agregar Nuevo Municipio */
function error_municipio_ya_existe(){
	$(".art").slideUp("slow");

	$("#error_pais").slideUp("slow");
	$("#error_pais_minimo").slideUp("slow");
	$("#error_pais_maximo").slideUp("slow");
	$("#error_pais_invalido").slideUp("slow");

	$("#error_departamento").slideUp("slow");
	$("#error_departamento_minimo").slideUp("slow");
	$("#error_departamento_maximo").slideUp("slow");
	$("#error_departamento_invalido").slideUp("slow");
	
	$("#error_municipio").slideUp("slow");
	$("#error_municipio_minimo").slideUp("slow");
	$("#error_municipio_maximo").slideUp("slow");
	$("#error_municipio_invalido").slideUp("slow");

	$("#municipio_ya_existe").slideDown();
}
/* Fin script cargar municipio - Formulario Agregar Nuevo Municipio */
/* Script espacios pais - Formulario Agregar Nuevo Municipio */
function espacios_pais(){
	var str = $('#pais').val();	
	str = str.replace('-','');	str = str.replace('°','');
	str = str.replace('!','');	str = str.replace('|','');	str = str.replace('"','');
	str = str.replace('$','');	str = str.replace('#','');	str = str.replace('%','');
	str = str.replace('&','');	str = str.replace('=','');	str = str.replace('?','');
	str = str.replace('¿','');	str = str.replace('¡','');	str = str.replace('(','');
	str = str.replace(')','');	str = str.replace('{','');	str = str.replace('}','');
	str = str.replace('[','');	str = str.replace(']','');	str = str.replace('.','');
	str = str.replace(';','');	str = str.replace(':','');	str = str.replace('_','');
	str = str.replace('~','');	str = str.replace('@','');	str = str.replace('´','');
	str = str.replace("+",'');	str = str.replace("/","");	str = str.replace("*","");
	str = str.replace("'","");	str = str.replace(',','');	str = str.replace('^','');
	str = str.replace('ñ','N');	str = str.replace('Ñ','N');	str = str.replace('á','A');
	str = str.replace('é','E');	str = str.replace('í','I');	str = str.replace('ó','O');
	str = str.replace('ú','U');	str = str.replace('Á','A');	str = str.replace('É','E');
	str = str.replace('Í','I');	str = str.replace('Ó','O');	str = str.replace('Ú','U');
	str = str.replace('<','');	str = str.replace('>','');	str = str.replace('  ','');

	$('#pais').val(str.toUpperCase());
}
/* Fin script espacios pais - Formulario Agregar Nuevo Municipio */
/* Script espacios departamento - Formulario Agregar Nuevo Municipio */
function espacios_departamento(){
	var str = $('#departamento').val();
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
	str = str.replace('>','');	str = str.replace('  ','');

	$('#departamento').val(str.toUpperCase());
}
/* Fin script espacios departamento - Formulario Agregar Nuevo Municipio */
/* Script espacios Municipio - Formulario Agregar Nuevo Municipio */
function espacios_municipio(){
	var str = $('#municipio').val();
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
	str = str.replace('>','');	str = str.replace('  ','');

	$('#municipio').val(str.toUpperCase());
}
/* Fin script espacios Municipio - Formulario Agregar Nuevo Municipio */

/*Funcion para insertar datos de municipios*/
function validar_agregar_municipio(){
	
	var continente =$('#continente').val()
	var pais =$('#pais').val()
	var departamento =$('#departamento').val()
	var municipio =$('#municipio').val()

	if(pais==""){
		$("#error_pais").slideDown("slow");
		$("#error_pais_minimo").slideUp("slow");
		$("#error_pais_maximo").slideUp("slow");
		$("#error_pais_invalido").slideUp("slow");
		$("#pais").focus();
		return false;
	}else{
		if(pais.length<3){
			$("#error_pais").slideUp("slow");
			$("#error_pais_minimo").slideDown("slow");
			$("#error_pais_maximo").slideUp("slow");
			$("#error_pais_invalido").slideUp("slow");
			$("#pais").focus();
			return false;
		}else{
			if(pais.length>30){
				$("#error_pais").slideUp("slow");
				$("#error_pais_minimo").slideUp("slow");
				$("#error_pais_maximo").slideDown("slow");
				$("#error_pais_invalido").slideUp("slow");
				$("#pais").focus();
				return false;
			}else{
				if($("#resultado_pais").is(":visible")){
					$("#error_pais").slideUp("slow");
					$("#error_pais_minimo").slideUp("slow");
					$("#error_pais_maximo").slideUp("slow");
					$("#error_pais_invalido").slideDown("slow");
					$("#pais").focus();
					return false;
				}else{
					$("#error_pais").slideUp("slow");
					$("#error_pais_minimo").slideUp("slow");
					$("#error_pais_maximo").slideUp("slow");
					$("#error_pais_invalido").slideUp("slow");

					if(departamento==""){
						$("#error_departamento").slideDown("slow");
						$("#error_departamento_minimo").slideUp("slow");
						$("#error_departamento_maximo").slideUp("slow");
						$("#error_departamento_invalido").slideUp("slow");
						$("#departamento").focus();
						return false;
					}else{
						if(departamento.length<3){
							$("#error_departamento").slideUp("slow");
							$("#error_departamento_minimo").slideDown("slow");
							$("#error_departamento_maximo").slideUp("slow");
							$("#error_departamento_invalido").slideUp("slow");
							$("#departamento").focus();
							return false;
						}else{
							if(departamento.length>30){
								$("#error_departamento").slideUp("slow");
								$("#error_departamento_minimo").slideUp("slow");
								$("#error_departamento_maximo").slideDown("slow");
								$("#error_departamento_invalido").slideUp("slow");
								$("#departamento").focus();
								return false;
							}else{
								if($("#resultado_departamento").is(":visible")){
									$("#error_departamento").slideUp("slow");
									$("#error_departamento_minimo").slideUp("slow");
									$("#error_departamento_maximo").slideUp("slow");
									$("#error_departamento_invalido").slideDown("slow");
									$("#departamento").focus();
									return false;
								}else{
									$("#error_departamento").slideUp("slow");
									$("#error_departamento_minimo").slideUp("slow");
									$("#error_departamento_maximo").slideUp("slow");
									$("#error_departamento_invalido").slideUp("slow");

									if(municipio==""){
										$("#error_municipio").slideDown("slow");
										$("#error_municipio_minimo").slideUp("slow");
										$("#error_municipio_maximo").slideUp("slow");
										$("#error_municipio_invalido").slideUp("slow");
										$("#municipio_ya_existe").slideUp("slow");
										$("#municipio").focus();
										return false;
									}else{
										if(municipio.length<3){
											$("#error_municipio").slideUp("slow");
											$("#error_municipio_minimo").slideDown("slow");
											$("#error_municipio_maximo").slideUp("slow");
											$("#error_municipio_invalido").slideUp("slow");
											$("#municipio_ya_existe").slideUp("slow");
											$("#municipio").focus();
											return false;
										}else{
											if(municipio.length>30){
												$("#error_municipio").slideUp("slow");
												$("#error_municipio_minimo").slideUp("slow");
												$("#error_municipio_maximo").slideDown("slow");
												$("#error_municipio_invalido").slideUp("slow");
												$("#municipio_ya_existe").slideUp("slow");
												$("#municipio").focus();
												return false;
											}else{
												if($("#resultado_municipio").is(":visible")){
													$("#error_municipio").slideUp("slow");
													$("#error_municipio_minimo").slideUp("slow");
													$("#error_municipio_maximo").slideUp("slow");
													$("#error_municipio_invalido").slideDown("slow");
													$("#municipio_ya_existe").slideUp("slow");
													$("#municipio").focus();
													return false;
												}else{
													if($("#municipio_ya_existe").is(":visible")){
														$("#error_municipio").slideUp("slow");
														$("#error_municipio_minimo").slideUp("slow");
														$("#error_municipio_maximo").slideUp("slow");
														$("#error_municipio_invalido").slideUp("slow");
													$("#municipio").focus();
													return false;
													}else{
														$("#error_municipio").slideUp("slow");
														$("#error_municipio_minimo").slideUp("slow");
														$("#error_municipio_maximo").slideUp("slow");
														$("#error_municipio_invalido").slideUp("slow");
														$("#municipio_ya_existe").slideUp("slow");
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
			}
		}
	}
}

$(function submit_agregar_municipio(){
	$('#bEnviar').click(function submit_agregar_municipio(){
		var submit_agregar_municipio = validar_agregar_municipio();
		if(submit_agregar_municipio==false){
			return false;
		}else if(submit_agregar_municipio==true){ // Realizar la creación del municipio
		/*	var continente =$('#continente').val();
			var pais =$('#pais').val();
			var departamento =$('#departamento').val();
			var municipio =$('#municipio').val();

			var data = 'continente='+continente+'&pais='+pais+'&departamento='+departamento+'&municipio='+municipio;
		*/
			$.ajax({
				url:'admin_muni/query_municipios.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					$('#formulario_agregar_municipio').submit(); // Realizar la creación del municipio
					$("#ventana").slideUp("slow");
					$("#contenido").load("admin_muni/index_municipios.php");
				}
			})
		}else{
			alert("No se puede agregar el municipio. Intente nuevamente")
		}										
	});
})
/*Fin funcion para insertar datos de municipios*/
/******************************************************************************************/
/* Modificar Municipios *******************************************************************/
/******************************************************************************************/
/*Funciones para desplegar ventana modal Modificar Municipio*/
function abrirVentanaModificarMunicipios(){
	$("#ventana2").slideDown("slow");
}
function cerrarVentanaModificarMunicipios(){
	$("#ventana2").slideUp("slow");
}
/*Fin funciones para desplegar ventana modal Modificar Municipio*/

/* Función para cargar datos al formulario de Modificación de Municipio */
function cargar_modifica_municipio(nombre_municipio,nombre_departamento,nombre_pais,nombre_continente){
	$('#mod_continente').val(nombre_continente);
	$('#mod_pais').val(nombre_pais);
	$('#mod_departamento').val(nombre_departamento);
	$('#mod_municipio').val(nombre_municipio);

	$('#ant_continente').val(nombre_continente);
	$('#ant_pais').val(nombre_pais);
	$('#ant_departamento').val(nombre_departamento);
	$('#ant_municipio').val(nombre_municipio);

	$("#error_mod_pais").slideUp("slow");
	$("#error_mod_pais_minimo").slideUp("slow");
	$("#error_mod_pais_maximo").slideUp("slow");
	$("#error_mod_pais_invalido").slideUp("slow");

	$("#error_mod_departamento").slideUp("slow");
	$("#error_mod_departamento_minimo").slideUp("slow");
	$("#error_mod_departamento_maximo").slideUp("slow");
	$("#error_mod_departamento_invalido").slideUp("slow");
	
	$("#error_mod_municipio").slideUp("slow");
	$("#error_mod_municipio_minimo").slideUp("slow");
	$("#error_mod_municipio_maximo").slideUp("slow");
	$("#error_mod_municipio_invalido").slideUp("slow");

	abrirVentanaModificarMunicipios();
	$("#mod_pais").focus();
}

/*Script para buscador de Pais - Formulario Modificar Municipio */
$(function buscador_mod_pais(){
	$('#mod_pais').focus();
	
	$('#mod_pais').keyup(function buscador_mod_pais(){
		var envio_mod_continente=$("#mod_continente").val();
		var ant_pais=$("#ant_pais").val();
		var envio_mod_pais = $('#mod_pais').val();

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_mod_pais' : envio_mod_pais,
				'search_mod_continente': envio_mod_continente,
				'search_ant_pais': ant_pais,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_mod_pais').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador de Pais - Formulario Modificar Municipio */

/*Script para buscador Departamento - Formulario Modificar Municipio */
$(function buscador_mod_departamento(){
	$('#mod_departamento').focus();
	
	$('#mod_departamento').keyup(function buscador_mod_departamento(){
		var envio_mod_departamento=$("#mod_departamento").val();
		var ant_departamento=$("#ant_departamento").val();
		var envio_mod_pais2 = $('#mod_pais').val();
		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_mod_pais2' : envio_mod_pais2,
				'search_mod_departamento': envio_mod_departamento,
				'search_ant_departamento': ant_departamento,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_mod_departamento').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador Departamento - Formulario Modificar Municipio */
/*Script para buscador municipio - Formulario Modificar Municipio */
$(function buscador_mod_municipio(){
	$('#mod_municipio').focus();
	
	$('#mod_municipio').keyup(function buscador_mod_municipio(){
		var envio_mod_municipio=$("#mod_municipio").val();
		var ant_municipio=$("#ant_municipio").val();
		var envio_mod_departamento2 = $('#mod_departamento').val();
		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search_mod_departamento2' : envio_mod_departamento2,
				'search_mod_municipio': envio_mod_municipio,
				'search_ant_municipio': ant_municipio,
				'desde_formulario' : '1'
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_mod_municipio').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador municipio - Formulario Modificar Municipio */

/* Script cargar pais - Formulario Modificar Municipio */
function cargar_mod_pais(nombre_mod_pais){
	$(".art").slideUp("slow");

	$("#error_mod_pais").slideUp("slow");
	$("#error_mod_pais_minimo").slideUp("slow");
	$("#error_mod_pais_maximo").slideUp("slow");
	$("#error_mod_pais_invalido").slideUp("slow");

	$("#error_mod_departamento").slideUp("slow");
	$("#error_mod_departamento_minimo").slideUp("slow");
	$("#error_mod_departamento_maximo").slideUp("slow");
	$("#error_mod_departamento_invalido").slideUp("slow");
	
	$("#error_mod_municipio").slideUp("slow");
	$("#error_mod_municipio_minimo").slideUp("slow");
	$("#error_mod_municipio_maximo").slideUp("slow");
	$("#error_mod_municipio_invalido").slideUp("slow");

	$("#mod_pais").val(nombre_mod_pais);
	$("#mod_departamento").val("");
	$("#mod_municipio").val("");
	$("#mod_departamento").focus();
}
/* Fin script cargar pais - Formulario Modificar Municipio */
/* Script cargar departamento - Formulario Modificar Municipio */
function cargar_mod_departamento(nombre_mod_departamento){
	$(".art").slideUp("slow");

	$("#error_mod_pais").slideUp("slow");
	$("#error_mod_pais_minimo").slideUp("slow");
	$("#error_mod_pais_maximo").slideUp("slow");
	$("#error_mod_pais_invalido").slideUp("slow");

	$("#error_mod_departamento").slideUp("slow");
	$("#error_mod_departamento_minimo").slideUp("slow");
	$("#error_mod_departamento_maximo").slideUp("slow");
	$("#error_mod_departamento_invalido").slideUp("slow");
	
	$("#error_mod_municipio").slideUp("slow");
	$("#error_mod_municipio_minimo").slideUp("slow");
	$("#error_mod_municipio_maximo").slideUp("slow");
	$("#error_mod_municipio_invalido").slideUp("slow");

	$("#mod_departamento").val(nombre_mod_departamento);
	$("#mod_municipio").focus();
}
/* Fin script cargar departamento - Formulario Modificar Municipio */
/* Script cargar municipio - Formulario Modificar Municipio */
function cargar_mod_municipio(nombre_mod_municipio){
	$(".art").slideUp("slow");

	$("#error_mod_pais").slideUp("slow");
	$("#error_mod_pais_minimo").slideUp("slow");
	$("#error_mod_pais_maximo").slideUp("slow");
	$("#error_mod_pais_invalido").slideUp("slow");

	$("#error_mod_departamento").slideUp("slow");
	$("#error_mod_departamento_minimo").slideUp("slow");
	$("#error_mod_departamento_maximo").slideUp("slow");
	$("#error_mod_departamento_invalido").slideUp("slow");
	
	$("#error_mod_municipio").slideUp("slow");
	$("#error_mod_municipio_minimo").slideUp("slow");
	$("#error_mod_municipio_maximo").slideUp("slow");
	$("#error_mod_municipio_invalido").slideUp("slow");

	$("#mod_municipio").val(nombre_mod_municipio);
	$("#mod_municipio").focus();
}
/* Fin script cargar municipio - Formulario Modificar Municipio */
/* Script espacios mod_pais - Formulario Modificar Municipio */
function espacios_mod_pais(){
	var str = $('#mod_pais').val();
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
	str = str.replace('>','');	str = str.replace('  ','');

	$('#mod_pais').val(str.toUpperCase());
}
/* Fin script espacios pais - Formulario Modificar Municipio */
/* Script espacios departamento - Formulario Modificar Municipio */
function espacios_mod_departamento(){
	var str = $('#mod_departamento').val();
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
	str = str.replace('>','');	str = str.replace('  ','');

	$('#mod_departamento').val(str.toUpperCase());
}
/* Fin script espacios departamento - Formulario Modificar Municipio */
/* Script espacios Municipio - Formulario Modificar Municipio */
function espacios_mod_municipio(){
	var str = $('#mod_municipio').val();
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
	str = str.replace('>','');	str = str.replace('  ','');
	
	$('#mod_municipio').val(str.toUpperCase());
}
/* Fin script espacios Municipio - Formulario Modificar Municipio */
/* Funcion para limpiar el formulario */
function limpia_formulario_modificacion(){
	$('#mod_pais').val("");
	$('#mod_departamento').val("");
	$('#mod_municipio').val("");

	$(".art").slideUp("slow");

	$("#error_mod_pais").slideUp("slow");
	$("#error_mod_pais_minimo").slideUp("slow");
	$("#error_mod_pais_maximo").slideUp("slow");
	$("#error_mod_pais_invalido").slideUp("slow");

	$("#error_mod_departamento").slideUp("slow");
	$("#error_mod_departamento_minimo").slideUp("slow");
	$("#error_mod_departamento_maximo").slideUp("slow");
	$("#error_mod_departamento_invalido").slideUp("slow");
	
	$("#error_mod_municipio").slideUp("slow");
	$("#error_mod_municipio_minimo").slideUp("slow");
	$("#error_mod_municipio_maximo").slideUp("slow");
	$("#error_mod_municipio_invalido").slideUp("slow");

	$("#mod_pais").focus();
}
/* Fin funcion para limpiar el formulario */
/* Validación que los campos de Formulario Modificar Municipio (Submit) */
function validar_modificar_municipio(){

	var ant_pais=$('#ant_pais').val();
	var ant_departamento = $('#ant_departamento').val();// Este valor ya fue cargado en la funcion cargar_modifica_municipio
	var ant_municipio=$('#ant_municipio').val();// Este valor ya fue cargado en la funcion cargar_modifica_municipio
	var x =$('#mod_pais').val();
	var y =$('#mod_departamento').val(); // Este valor ya fue cargado en la funcion cargar_modifica_municipio
	var z =$('#mod_municipio').val();

	if(x== ""){
		$("#error_mod_pais").slideDown("slow");
		$("#error_mod_pais_invalido").slideUp("slow");
		$("#error_mod_pais_minimo").slideUp("slow");
		$("#error_mod_pais_maximo").slideUp("slow");

		$("#mod_pais").focus();
		return false;
	}else{
		if(x.length<3){
			$("#error_mod_pais").slideUp("slow");
			$("#error_mod_pais_invalido").slideUp("slow");
			$("#error_mod_pais_minimo").slideDown("slow");
			$("#error_mod_pais_maximo").slideUp("slow");

			$("#mod_pais").focus();
			return false;
		}else{
			if(x.length>30){
				$("#error_mod_pais").slideUp("slow");
				$("#error_mod_pais_invalido").slideUp("slow");
				$("#error_mod_pais_minimo").slideUp("slow");
				$("#error_mod_pais_maximo").slideDown("slow");

				$("#mod_pais").focus();
				return false;
			}else{
				if(ant_pais!=x && $('#resultado_mod_pais').is(":visible")){/* Si hay un resultado visible, genera error */
					$("#error_mod_pais").slideUp("slow");
					$("#error_mod_pais_invalido").slideDown("slow");
					$("#error_mod_pais_minimo").slideUp("slow");
					$("#error_mod_pais_maximo").slideUp("slow");
	
					$('#mod_pais').focus();
					return false;
				}else{
					if(y== ""){
						$("#error_mod_departamento").slideDown("slow");
						$("#error_mod_departamento_invalido").slideUp("slow");
						$("#error_mod_departamento_minimo").slideUp("slow");
						$("#error_mod_departamento_maximo").slideUp("slow");

						$("#mod_departamento").focus();
						return false;
					}else{
						if(y.length<3){
							$("#error_mod_departamento").slideUp("slow");
							$("#error_mod_departamento_invalido").slideUp("slow");
							$("#error_mod_departamento_minimo").slideDown("slow");
							$("#error_mod_departamento_maximo").slideUp("slow");

							$("#mod_departamento").focus();
							return false;
						}else{
							if(y.length>30){
								$("#error_mod_departamento").slideUp("slow");
								$("#error_mod_departamento_invalido").slideUp("slow");
								$("#error_mod_departamento_minimo").slideUp("slow");
								$("#error_mod_departamento_maximo").slideDown("slow");

								$("#mod_departamento").focus();
								return false;
							}else{
								if(ant_departamento!=y && $('#resultado_mod_departamento').is(":visible")){/* Si hay un resultado visible, genera error */
									$("#error_mod_departamento").slideUp("slow");
									$("#error_mod_departamento_invalido").slideDown("slow");
									$("#error_mod_departamento_minimo").slideUp("slow");
									$("#error_mod_departamento_maximo").slideUp("slow");
					
									$('#mod_departamento').focus();
									return false;
								}else{
									$("#error_mod_departamento").slideUp("slow");
									$("#error_mod_departamento_invalido").slideUp("slow");
									$("#error_mod_departamento_minimo").slideUp("slow");
									$("#error_mod_departamento_maximo").slideUp("slow");

									if(z==""){
										$("#error_mod_municipio").slideDown("slow");
										$("#error_mod_municipio_invalido").slideUp("slow");
										$("#error_mod_municipio_minimo").slideUp("slow");
										$("#error_mod_municipio_maximo").slideUp("slow");

										$("#mod_municipio").focus();
										return false;
									}else{
										if(z.length<3){
											$("#error_mod_municipio").slideUp("slow");
											$("#error_mod_municipio_invalido").slideUp("slow");
											$("#error_mod_municipio_minimo").slideDown("slow");
											$("#error_mod_municipio_maximo").slideUp("slow");

											$("#mod_municipio").focus();
											return false;
										}else{
											if(z.length>30){
												$("#error_mod_municipio").slideUp("slow");
												$("#error_mod_municipio_invalido").slideUp("slow");
												$("#error_mod_municipio_minimo").slideUp("slow");
												$("#error_mod_municipio_maximo").slideDown("slow");

												$("#mod_municipio").focus();
												return false;
											}else{
												if($('#resultado_mod_municipio').is(":visible")){/* Si hay un resultado visible, genera error */
													$("#error_mod_municipio").slideUp("slow");
													$("#error_mod_municipio_invalido").slideDown("slow");
													$("#error_mod_municipio_minimo").slideUp("slow");
													$("#error_mod_municipio_maximo").slideUp("slow");
													$('#mod_municipio').focus();
													return false;
												}else{
													$("#error_mod_municipio").slideUp("slow");
													$("#error_mod_municipio_invalido").slideUp("slow");
													$("#error_mod_municipio_minimo").slideUp("slow");
													$("#error_mod_municipio_maximo").slideUp("slow");
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
		}
	}
}					

$(function submit_modificar_municipio(){
	$('#enviar_mod').click(function submit_agregar_municipio(){
		var submit_modificar_municipio = validar_modificar_municipio();
		if(submit_modificar_municipio==false){
			return false;
		}else if(submit_modificar_municipio==true){ // Realizar la creación del municipio

			$.ajax({
				url:'admin_muni/query_municipios.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					alert("El municipio ha sido modificado correctamente.");
					$("#formulario_modificar_municipio").submit();
					$("#ventana2").slideUp("slow");
					$("#contenido").load("admin_muni/index_municipios.php");
				}
			})
		}else{
			alert("No se puede modificar el municipio. Intente nuevamente")
		}										
	});
})
/* Fin de validación que los campos de Formulario Modificar Municipio (Submit) */
