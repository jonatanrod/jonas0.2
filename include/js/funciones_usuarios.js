/* Script para ventana modal - Tecla Esc */
    window.addEventListener("keyup", function(event){
        var codigo = event.keyCode || event.which;
        if (codigo == 27){
            cerrarVentanaCrearUsuarios();
            cerrarVentanaModificarUsuarios()
        }
        if(codigo== 8){ // Opcion para restringir que la tecla backspace da atras en el navegador.
        	if (history.forward(1)) {
				location.replace(history.forward(1));
			}	
        }
    }, false);
/* Fin script para ventana modal - Tecla Esc */

/************************************************************************************************************/
/* Buscador - Administrador de Usuarios *********************************************************************/
/************************************************************************************************************/
$(function buscador_usuarios(){
	
	$('#search_usuario').focus();
	$('#search_usuario').keyup(function buscador_usuarios(){
		var envio_usuario = $('#search_usuario').val();
		if(envio_usuario.length>2 && envio_usuario.length<50){		
			$('#logo').html('<h2>Buscador de Usuarios</h2>');
	
	        $.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_usuario' : envio_usuario,
					'desde_formulario' : '1'
				},			
				success: function(resp){
					if(resp!=""){
						$('#desplegable_resultados').html(resp);
					}
				}
			}); 			 		
		}else{
			$('#desplegable_resultados').html('');
		}
	})
})
/************************************************************************************************************/
/* Fin Buscador - Administrador de Usuarios *****************************************************************/
/************************************************************************************************************/


/************************************************************************************************************/
/* Formulario Agregar Nuevo Usuario *************************************************************************/
/************************************************************************************************************/

/* Script buscador identificacion - Formulario Agregar Nuevo Usuarios */
$(function busca_identificacion(){
		
	$('#identificacion').keyup(function busca_identificacion(){
		var envio_identificacion = $('#identificacion').val();

		if(envio_identificacion.length>2 && envio_identificacion.length<50){		
	
	       $.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_identificacion' : envio_identificacion,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_identificacion').html(resp);
					}
				}
			})	 			 		
		}else{
			$('#sugerencias_identificacion').html('');
		}		
	})
})
/* Fin script buscador identificacion - Formulario Agregar Nuevo Usuarios */
/* Script buscador nombre_completo - Formulario Agregar Nuevo Usuarios */
$(function busca_nombre_completo(){	
	
	$('#nombre_completo').keyup(function busca_identificacion(){
		var envio_nombre_completo = $('#nombre_completo').val();
		
		if(envio_nombre_completo.length>2 && envio_nombre_completo.length<50){		
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_nombre_completo' : envio_nombre_completo,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_nombre_completo').html(resp);
					}
				}
			})				 		
		}else{
			$('#sugerencias_nombre_completo').html('');
		}
	})
})
/* Fin script buscador nombre_completo - Formulario Agregar Nuevo Usuarios */
/* Script buscador login - Formulario Agregar Nuevo Usuarios */
$(function busca_login(){	
	
	$('#login').keyup(function busca_login(){
		var envio_login = $('#login').val();

		if(envio_login.length>2 && envio_login.length<50){		
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_login' : envio_login,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_login').html(resp);
					}
				}
			})		 		
		}else{
			$('#sugerencias_login').html('');
		}	
	})
})
/* Fin script buscador login - Formulario Agregar Nuevo Usuarios */
/* Script buscador dependencia - Formulario Agregar Nuevo Usuarios */
$(function busca_dependencia(){	
	//$('#dependencia').focus();
	
	$('#dependencia').keyup(function busca_dependencia(){
		var envio_dependencia = $('#dependencia').val();

		if(envio_dependencia.length>2 && envio_dependencia.length<50){		
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_dependencia' : envio_dependencia,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_dependencia').html(resp);
					}
				}
			})		 		
		}else{
			$('#sugerencias_dependencia').html('');
		}
	})
})
/* Fin script buscador dependencia - Formulario Agregar Nuevo Usuarios */

/* Script validar si identificacion ya existe */
function valida_identificacion_ya_existe(){
	$("#identificacion").focus();
	$("#error_identificacion_ya_existe").slideDown();
}
/* Fin script validar si identificacion ya existe */
/* Script validar si nombre_completo ya existe */
function valida_nombre_completo_ya_existe(){
	$("#nombre_completo").focus();
	$("#error_nombre_completo_ya_existe").slideDown();
}
/* Fin script validar si nombre_completo ya existe */
/* Script validar si login ya existe */
function valida_login_ya_existe(){
	$("#login").focus();
	$("#error_login_ya_existe").slideDown();
}
/* Fin script validar si login ya existe */

/* Funciones para desplegar ventana modal Agregar Usuarios */
function abrirVentanaCrearUsuarios(){
	$("#ventana").slideToggle("slow");
	$("#identificacion").focus();
}

function cerrarVentanaCrearUsuarios(){
	$("#ventana").slideUp("slow");
	$("#search_usuario").focus();

	$(".art1").slideUp("slow");

	$("#error_no_es_numero").slideUp("slow");
	$("#error_identificacion").slideUp("slow");
	$("#valida_minimo_identificacion").slideUp("slow");
	$("#valida_maximo_identificacion").slideUp("slow");
	$("#error_identificacion_ya_existe").slideUp("slow");

	$("#error_nombre_completo").slideUp("slow");
	$("#valida_minimo_nombre_completo").slideUp("slow");
	$("#valida_maximo_nombre_completo").slideUp("slow");
	$("#error_nombre_completo_ya_existe").slideUp("slow");

	$("#error_login").slideUp();
	$("#valida_minimo_login").slideUp("slow");
	$("#valida_maximo_login").slideUp("slow");
	$("#error_login_ya_existe").slideUp("slow");

	$("#error_mail").slideUp();
	$("#valida_minimo_mail").slideUp("slow");
	$("#valida_maximo_mail").slideUp("slow");
	$("#error_mail_formato").slideUp("slow");

	$("#error_dependencia").slideUp();
	$("#valida_minimo_dependencia").slideUp("slow");
	$("#valida_maximo_dependencia").slideUp("slow");
	$("#error_dependencia_invalida").slideUp("slow");
	$("#error_dependencia_inexistente").slideUp("slow");

	$("#error_perfil").slideUp("slow");	

	$("#error_imagen").slideUp("slow");
	$("#error_imagen_invalida").slideUp("slow");	

	$("#identificacion").val("");
	$("#nombre_completo").val("");
	$("#login").val("");
	$("#mail").val("");
	$("#dependencia").val("");
	$("#perfil").val("USUARIO");
	$("#imagen").val("");

	$("#estado").val("ACTIVO");
	$("#usuario_nuevo").val("SI");
	$("#nivel_seguridad").val("1");

	$("#ventanilla_radicacion").val("NO");
}
/* Fin funciones para desplegar ventana modal Agregar Usuarios */

/* Script espacios identificacion - Formulario Agregar Nuevo Usuario */
function espacios_identificacion(){
	var str = $('#identificacion').val();
	
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
	str = str.replace(',','');	str = str.replace('^','');	str = str.replace('<','');
	str = str.replace('>','');	str = str.replace('  ','');

	$('#identificacion').val(str);

	if (isNaN(str)) {
		$("#error_no_es_numero").slideDown("slow");
	}else{
		$("#error_no_es_numero").slideUp("slow");
	}
}
/* Fin script espacios identificacion - Formulario Agregar Nuevo Usuario */
/* Script espacios nombre_completo - Formulario Agregar Nuevo Usuario */
function espacios_nombre_completo(){
	var str2 = $('#nombre_completo').val();

	str2 = str2.replace('-',''); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace('.','');	str2 = str2.replace(';','');
	str2 = str2.replace(':','');	str2 = str2.replace('_','');	str2 = str2.replace('~','');
	str2 = str2.replace('@','');	str2 = str2.replace('´','');	str2 = str2.replace("+",'');
	str2 = str2.replace("/","");	str2 = str2.replace("*","");	str2 = str2.replace("'","");
	str2 = str2.replace(',','');	str2 = str2.replace('^','');	str2 = str2.replace('ñ','N');
	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');
	str2 = str2.replace('í','I');	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');
	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');
	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');
	str2 = str2.replace('>','');	str2 = str2.replace('  ','');

	$('#nombre_completo').val(str2.toUpperCase());
}
/* Fin script espacios nombre_completo - Formulario Agregar Nuevo Usuario */
/* Script espacios login - Formulario Agregar Nuevo Usuario */
function espacios_login(){
	var str2 = $('#login').val();

	str2 = str2.replace('-',''); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace(';','');	str2 = str2.replace(':','');	
	str2 = str2.replace('_','');	str2 = str2.replace('~','');	str2 = str2.replace('@','');	
	str2 = str2.replace('´','');	str2 = str2.replace("+",'');	str2 = str2.replace("/","");	
	str2 = str2.replace("*","");	str2 = str2.replace("'","");	str2 = str2.replace(',','');	
	str2 = str2.replace('^','');	str2 = str2.replace('ñ','N');	str2 = str2.replace('Ñ','N');	
	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');	str2 = str2.replace('í','I');	
	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');	str2 = str2.replace('Á','A');	
	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');	str2 = str2.replace('Ó','O');	
	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');	str2 = str2.replace('>','');	
	str2 = str2.replace('  ','');

	$('#login').val(str2.toUpperCase());
}
/* Fin script espacios login - Formulario Agregar Nuevo Usuario */
/* Script espacios mail - Formulario Agregar Nuevo Usuario */
function espacios_mail(){
	var str2 = $('#mail').val();

	str2 = str2.replace('ñ','N'); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');
	str2 = str2.replace('í','I');	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');
	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');
	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	str2 = str2.replace('  ','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace(';','');	str2 = str2.replace(':','');
	str2 = str2.replace('~','');	str2 = str2.replace('´','');	str2 = str2.replace("+",'');	
	str2 = str2.replace("/","");	str2 = str2.replace("*","");	str2 = str2.replace("'","");	
	str2 = str2.replace(',','');	str2 = str2.replace('^','');	str2 = str2.replace('<','');	
	str2 = str2.replace('>','');

	$('#mail').val(str2.toUpperCase());
}
function validarEmail(mail) { // Verifica que el formato del input sea usuario@algunmail.com
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(mail) ){
    	$("#error_mail_formato").slideDown();
    	$("#mail").focus();
    	return false;
    }else {	
		$("#error_mail_formato").slideUp();
  	}
}
/* Fin script espacios mail - Formulario Agregar Nuevo Usuario */
/* Script espacios nombre_completo - Formulario Agregar Nuevo Usuario */
function espacios_dependencia(){
	var str2 = $('#dependencia').val();

	str2 = str2.replace('-',''); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace('.','');	str2 = str2.replace(';','');
	str2 = str2.replace(':','');	str2 = str2.replace('_','');	str2 = str2.replace('~','');
	str2 = str2.replace('@','');	str2 = str2.replace('´','');	str2 = str2.replace("+",'');
	str2 = str2.replace("/","");	str2 = str2.replace("*","");	str2 = str2.replace("'","");
	str2 = str2.replace(',','');	str2 = str2.replace('^','');	str2 = str2.replace('ñ','N');
	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');
	str2 = str2.replace('í','I');	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');
	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');
	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');
	str2 = str2.replace('>','');	str2 = str2.replace('  ','');

	$('#dependencia').val(str2.toUpperCase());
}
/* Fin script espacios dependencia - Formulario Agregar Nuevo Usuario */
/* Script cargar campo dependencia - Formulario Agregar Usuarios */
function carga_dependencia(codigo_dependencia, dependencia){
	$("#codigo_dependencia").val(codigo_dependencia);
	$("#dependencia").val(dependencia);
	$('#error_perfil').slideUp('slow');
	$("#sugerencias_dependencia").slideUp("slow");
	$("#error_dependencia_invalida").slideUp("slow");
	$("#perfil").focus();
	valida_perfil();
}
/* Fin script cargar campo dependencia - Formulario Agregar Usuarios */
/* Script que valida si el perfil del usuario esta disponible en la dependencia */
function valida_perfil(){
	var depe_codi = $("#codigo_dependencia").val();
	var perfil=$("#perfil").val();
		
	$("#depe_perfil").html(depe_codi);
	$("#perfil_p").html(perfil);

	$.ajax({
		url:'admin_usuarios/buscador_usuarios.php',
		type: 'POST',
		data: {
			'search_perfil_depe_codi' : depe_codi,
			'search_perfil' : perfil,
			'desde_formulario' : '1'
		},
		success: function(resp){
				if(resp!=""){
				$('#sugerencias_perfil').html(resp);
			}
		}
	})
}
/* Fin script que valida si el perfil del usuario esta disponible en la dependencia */
/* Funcion para validar tipo de archivo - Formulario Agregar Usuario */
function valida_tipo_archivo(){
	var imagen = document.getElementById("imagen").files;
	
	if(imagen.length==0){
		$("#error_imagen").slideDown("slow");
	}else{
		$("#error_imagen").slideUp("slow");
		for(x=0; x<imagen.length; x++){
			if(imagen[x].type!= "image/png" && imagen[x].type!="image/jpg"  && imagen[x].type!="image/jpeg" && imagen[x].type!="image/gif"){
				$("#error_imagen_invalida").slideDown("slow");
				return false;
			}else{
				$("#error_imagen_invalida").slideUp("slow");
			}
		}
	}
}
/* Fin funcion para validar tipo de archivo - Formulario Agregar Usuario */
/*Funcion para insertar datos - Formulario Agregar Usuario*/
function validar_agregar_usuario(){
	
	var identificacion =$('#identificacion').val()
	var nombre_completo =$('#nombre_completo').val()
	var login=$("#login").val();
	var mail=$("#mail").val();
	var dependencia=$("#dependencia").val();
	var imagen=$("#imagen").val();

	if(identificacion==""){
		$("#error_identificacion").slideDown("slow");
		$("#valida_minimo_identificacion").slideUp("slow");
		$("#valida_maximo_identificacion").slideUp("slow");
		$("#error_identificacion_ya_existe").slideUp("slow");

		$("#identificacion").focus();
		return false;
	}else{
		if(identificacion.length<6){
			$("#error_identificacion").slideUp("slow");
			$("#valida_minimo_identificacion").slideDown("slow");
			$("#valida_maximo_identificacion").slideUp("slow");
			$("#error_identificacion_ya_existe").slideUp("slow");

			$("#identificacion").focus();
			return false;
		}else{
			if(identificacion.length>20){
				$("#error_identificacion").slideUp("slow");
				$("#valida_minimo_identificacion").slideUp("slow");
				$("#valida_maximo_identificacion").slideDown("slow");
				$("#error_identificacion_ya_existe").slideUp("slow");

				$("#identificacion").focus();
				return false;
			}else{
				if($("#sugerencia_id").is(":visible")){
					$("#error_identificacion").slideUp("slow");
					$("#valida_minimo_identificacion").slideUp("slow");
					$("#valida_maximo_identificacion").slideUp("slow");
					$("#error_identificacion_ya_existe").slideDown("slow");

					$("#identificacion").focus();
					return false;
				}else{
					if($("#error_no_es_numero").is(":visible")){
						$("#error_identificacion").slideUp("slow");
						$("#valida_minimo_identificacion").slideUp("slow");
						$("#valida_maximo_identificacion").slideUp("slow");
						$("#error_identificacion_ya_existe").slideUp("slow");

						$("#identificacion").focus();
						return false;
					}else{
						$("#error_identificacion").slideUp("slow");
						$("#valida_minimo_identificacion").slideUp("slow");
						$("#valida_maximo_identificacion").slideUp("slow");
						$("#error_identificacion_ya_existe").slideUp("slow");

						$("#nombre_completo").focus();
						if(nombre_completo==""){
							$("#error_nombre_completo").slideDown("slow");
							$("#valida_minimo_nombre_completo").slideUp("slow");
							$("#valida_maximo_nombre_completo").slideUp("slow");
							$("#error_nombre_completo_ya_existe").slideUp("slow");

							$("#nombre_completo").focus();	
							return false;					
						}else{
							if(nombre_completo.length<6){
								$("#error_nombre_completo").slideUp("slow");
								$("#valida_minimo_nombre_completo").slideDown("slow");
								$("#valida_maximo_nombre_completo").slideUp("slow");
								$("#error_nombre_completo_ya_existe").slideUp("slow");

								$("#nombre_completo").focus();
								return false;
							}
							else{
								if(nombre_completo.length>50){
									$("#error_nombre_completo").slideUp("slow");
									$("#valida_minimo_nombre_completo").slideUp("slow");
									$("#valida_maximo_nombre_completo").slideDown("slow");
									$("#error_nombre_completo_ya_existe").slideUp("slow");

									$("#nombre_completo").focus();
									return false;
								}else{
									if($("#sugerencia_nombre_completo").is(":visible")){
										$("#error_nombre_completo").slideUp("slow");
										$("#valida_minimo_nombre_completo").slideUp("slow");
										$("#valida_maximo_nombre_completo").slideUp("slow");
										$("#error_nombre_completo_ya_existe").slideDown("slow");

										$("#nombre_completo").focus();
										return false;
									}else{
										$("#error_nombre_completo").slideUp("slow");
										$("#valida_minimo_nombre_completo").slideUp("slow");
										$("#valida_maximo_nombre_completo").slideUp("slow");
										$("#error_nombre_completo_ya_existe").slideUp("slow");

										$("#login").focus();
										if(login==""){
											$("#error_login").slideDown("slow");
											$("#valida_minimo_login").slideUp("slow");
											$("#valida_maximo_login").slideUp("slow");
											$("#error_login_ya_existe").slideUp("slow");

											$("#login").focus();	
											return false;					
										}else{
											if(login.length<6){
												$("#error_login").slideUp("slow");
												$("#valida_minimo_login").slideDown("slow");
												$("#valida_maximo_login").slideUp("slow");
												$("#error_login_ya_existe").slideUp("slow");

												$("#login").focus();
												return false;
											}
											else{
												if(login.length>30){
													$("#error_login").slideUp("slow");
													$("#valida_minimo_login").slideUp("slow");
													$("#valida_maximo_login").slideDown("slow");
													$("#error_login_ya_existe").slideUp("slow");

													$("#login").focus();
													return false;
												}else{
													if($("#sugerencia_login").is(":visible")){
														$("#error_login").slideUp("slow");
														$("#valida_minimo_login").slideUp("slow");
														$("#valida_maximo_login").slideUp("slow");
														$("#error_login_ya_existe").slideDown("slow");

														$("#login").focus();
														return false;
													}else{
														$("#error_login").slideUp("slow");
														$("#valida_minimo_login").slideUp("slow");
														$("#valida_maximo_login").slideUp("slow");
														$("#error_login_ya_existe").slideUp("slow");

														$("#mail").focus();
														if(mail==""){
															$("#error_mail").slideDown("slow");
															$("#valida_minimo_mail").slideUp("slow");
															$("#valida_maximo_mail").slideUp("slow");
															$("#error_mail_formato").slideUp("slow");

															$("#mail").focus();
															return false;
														}else{
															if(mail.length<6){
																$("#error_mail").slideUp("slow");
																$("#valida_minimo_mail").slideDown("slow");
																$("#valida_maximo_mail").slideUp("slow");
																$("#error_mail_formato").slideUp("slow");

																$("#mail").focus();
																return false;
															}
															else{
																if(mail.length>30){
																	$("#error_mail").slideUp("slow");
																	$("#valida_minimo_mail").slideUp("slow");
																	$("#valida_maximo_mail").slideDown("slow");
																	$("#error_mail_formato").slideUp("slow");

																	$("#mail").focus();
																	return false;
																}else{
																	$("#error_mail").slideUp("slow");
																	$("#valida_minimo_mail").slideUp("slow");
																	$("#valida_maximo_mail").slideUp("slow");
																	$("#error_mail_formato").slideUp("slow");

																	var valida_mail = validarEmail(mail);
																	if(valida_mail==false){
																		return false;
																	}else{ 
																		$("#error_mail").slideUp("slow");
																		$("#valida_minimo_mail").slideUp("slow");
																		$("#valida_maximo_mail").slideUp("slow");
																			
																		$("#dependencia").focus();
																		
																		if(dependencia==""){
																			$("#error_dependencia").slideDown("slow");
																			$("#valida_minimo_dependencia").slideUp("slow");
																			$("#valida_maximo_dependencia").slideUp("slow");
																			$("#error_dependencia_invalida").slideUp("slow");
																			$("#error_dependencia_inexistente").slideUp("slow");

																			$("#dependencia").focus();	
																			return false;					
																		}else{
																			if(dependencia.length<6){
																				$("#error_dependencia").slideUp("slow");
																				$("#valida_minimo_dependencia").slideDown("slow");
																				$("#valida_maximo_dependencia").slideUp("slow");
																				$("#error_dependencia_invalida").slideUp("slow");
																				$("#error_dependencia_inexistente").slideUp("slow");

																				$("#dependencia").focus();
																				return false;
																			}
																			else{
																				if(dependencia.length>50){
																					$("#error_dependencia").slideUp();
																					$("#valida_minimo_dependencia").slideUp("slow");
																					$("#valida_maximo_dependencia").slideDown("slow");
																					$("#error_dependencia_invalida").slideUp("slow");
																					$("#error_dependencia_inexistente").slideUp("slow");

																					$("#dependencia").focus();
																					return false;
																				}else{
																					if($("#sugerencia_dependencia").is(":visible")){
																						$("#error_dependencia").slideUp("slow");
																						$("#valida_minimo_dependencia").slideUp("slow");
																						$("#valida_maximo_dependencia").slideUp("slow");
																						$("#error_dependencia_invalida").slideDown("slow");
																						$("#error_dependencia_inexistente").slideUp("slow");

																						$("#dependencia").focus();
																						return false;
																					}else{
																						if($("#error_dependencia_inexistente").is(":visible")){
																							$("#error_dependencia").slideUp();
																							$("#valida_minimo_dependencia").slideUp("slow");
																							$("#valida_maximo_dependencia").slideUp("slow");
																							$("#error_dependencia_invalida").slideUp("slow");

																							$("#dependencia").focus();
																							return false
																						}else{
																							if($("#codigo_dependencia").val()==""){
																								$("#error_dependencia").slideDown("slow");
																								$("#dependencia").focus();
																								return false
																							}else{
																								$("#error_dependencia").slideUp("slow");
																								$("#valida_minimo_dependencia").slideUp("slow");
																								$("#valida_maximo_dependencia").slideUp("slow");
																								$("#error_dependencia_invalida").slideUp("slow");
																								$("#error_dependencia_inexistente").slideUp("slow");
																								
																								$("#perfil").focus();

																								if($("#error_perfil").is(":visible")){
																									$("#perfil").focus();
																									return false;
																								}else{
																									if(imagen==""){
																										$("#error_imagen").slideDown("slow");

																										$("#imagen").focus()
																										return false;
																									}else{
																										$("#error_imagen").slideUp("slow");
																										if($("#error_imagen_invalida").is(":visible")){
																											$("#error_imagen").slideUp("slow")
																											return false;
																										}else{
																											$("#error_imagen").slideUp("slow");
																											$("#error_imagen_invalida").slideUp("slow");
																											return true;																													return true;
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

$(function submit_agregar_usuario(){
	$('#bCrearUsuario').click(function submit_agregar_usuario(){
		var submit_agregar_usuario = validar_agregar_usuario();
		if(submit_agregar_usuario==false){
			return false;
		}else if(submit_agregar_usuario==true){ // Realizar la creación de Usuario
				
			$.ajax({
				url:'admin_usuarios/query_usuarios.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					$('#formulario_agregar_usuario').submit(); // Realizar la creación del usuario
					$("#contenido").load("admin_usuarios/index_usuarios.php");	
				}
			})
		}else{
			alert("No se puede agregar el usuario. Intente nuevamente")
		}										
	});
})
/*Fin funcion para insertar datos de usuario*/
/************************************************************************************************************/
/* Fin Formulario Agregar Nuevo Usuario *********************************************************************/
/************************************************************************************************************/

/************************************************************************************************************/
/* Modificar Usuarios ***************************************************************************************/
/************************************************************************************************************/

/* Funciones para desplegar ventana modal Modificar Usuarios */

function abrirVentanaModificarUsuarios(){
	$("#ventana2").slideDown("slow");
}

function cerrarVentanaModificarUsuarios(){
	$("#ventana2").slideUp("slow");
	$("#search_usuario").focus();

	$(".art1").slideUp("slow");

	$("#error_no_es_mod_numero").slideUp("slow");
	$("#error_mod_identificacion").slideUp("slow");
	$("#valida_minimo_mod_identificacion").slideUp("slow");
	$("#valida_maximo_mod_identificacion").slideUp("slow");
	$("#error_mod_identificacion_ya_existe").slideUp("slow");
	
	$("#error_mod_nombre_completo").slideUp("slow");
	$("#valida_minimo_mod_nombre_completo").slideUp("slow");
	$("#valida_maximo_mod_nombre_completo").slideUp("slow");
	$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

	$("#error_mod_login").slideUp();
	$("#valida_minimo_mod_login").slideUp("slow");
	$("#valida_maximo_mod_login").slideUp("slow");
	$("#error_mod_login_ya_existe").slideUp("slow");

	$("#error_mod_mail").slideUp();
	$("#valida_minimo_mod_mail").slideUp("slow");
	$("#valida_maximo_mod_mail").slideUp("slow");
	$("#error_mod_mail_formato").slideUp("slow");

	$("#error_mod_dependencia").slideUp();
	$("#valida_minimo_mod_dependencia").slideUp("slow");
	$("#valida_maximo_mod_dependencia").slideUp("slow");
	$("#error_mod_dependencia_invalida").slideUp("slow");
	$("#error_mod_dependencia_inexistente").slideUp("slow");

	$("#error_mod_perfil").slideUp("slow");	

	$("#error_mod_imagen_invalida").slideUp("slow");	
	
	$("#mod_id_usuario").val("");
	$("#ant_mod_identificacion").val("");
	$("#mod_identificacion").val("");

	$("#ant_mod_nombre_completo").val("");
	$("#mod_nombre_completo").val("");
	
	$("#ant_mod_login").val("");
	$("#mod_login").val("");

	$("#mod_mail").val("");
	
	$("#mod_codigo_dependencia").val("");
	$("#mod_ant_mod_nom_depe").val("");
	$("#mod_nombre_dependencia").val("");

	$("#imagen2").val("");

	$("#mod_perfil").val("USUARIO");
	$("#mod_estado").val("ACTIVO");
	$("#mod_usuario_nuevo").val("SI");
	$("#mod_nivel_seguridad").val("1");

	$("#mod_ventanilla_radicacion").val("NO");
}
/* Fin funciones para desplegar ventana modal Modificar Usuarios*/


function cargar_modifica_usuario(identificacion,nombre_completo,login,mail,codigo_dependencia,
	nombre_dependencia,perfil,estado,usuario_nuevo,nivel_seguridad,id_usuario,ventanilla_radicacion){

	$('#mod_identificacion').val(identificacion);
	$('#ant_mod_identificacion').val(identificacion);
	$('#mod_nombre_completo').val(nombre_completo);
	$('#ant_mod_nombre_completo').val(nombre_completo);
	$('#mod_login').val(login);
	$("#ant_mod_login").val(login);
	$('#mod_mail').val(mail);
	$('#mod_codigo_dependencia').val(codigo_dependencia);
	$('#mod_nombre_dependencia').val(nombre_dependencia);
	$("#mod_ant_mod_nom_depe").val(nombre_dependencia);
	$('#mod_perfil').val(perfil);
	$('#mod_estado').val(estado);
	$('#mod_usuario_nuevo').val(usuario_nuevo);
	$('#mod_nivel_seguridad').val(nivel_seguridad);
	$('#mod_id_usuario').val(id_usuario);
	$('#mod_ventanilla_radicacion').val(ventanilla_radicacion);

	abrirVentanaModificarUsuarios();
	$(".art1").slideUp("slow");
	$("#mod_identificacion").focus();
}
/* Script cargar campo mod_dependencia - Formulario Modificar Usuarios */
/*function carga_mod_dependencia(codigo_mod_dependencia, mod_dependencia){
	$("#mod_codigo_dependencia").val(codigo_mod_dependencia);
	$("#mod_nombre_dependencia").val(mod_dependencia);
	$("#sugerencias_mod_dependencia").slideUp("slow");
	$("#error_mod_dependencia_invalida").slideUp("slow");

	$("#mod_perfil").focus()
}
/* Fin script cargar campo mod_dependencia - Formulario Modificar Usuarios */
/* Script buscador identificacion - Formulario Modificar Nuevo Usuarios */
$(function busca_mod_identificacion(){
		
	$('#mod_identificacion').keyup(function busca_mod_identificacion(){
		var envio_mod_identificacion = $('#mod_identificacion').val();
		var envio_ant_mod_id =$("#ant_mod_identificacion").val();

		if(envio_mod_identificacion.length>3){	
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_mod_id' : envio_mod_identificacion,
					'search_ant_mod_id' : envio_ant_mod_id,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_mod_identificacion').html(resp);
					}
				}
			})	
		}else{
			$('#sugerencias_mod_identificacion').html('');
		}
	})
})
function id_anterior(documento_usuario){
	$('#mod_identificacion').val(documento_usuario);
	$('#sugerencias_mod_identificacion').html('');
	$('#error_mod_identificacion').slideUp('slow');
	$('#valida_minimo_mod_identificacion').slideUp('slow');
	$('#valida_maximo_mod_identificacion').slideUp('slow');
	$('#error_mod_identificacion_ya_existe').slideUp('slow');

	$('#mod_nombre_completo').focus();
}
/* Fin script buscador identificacion - Formulario Modificar Nuevo Usuarios */
/* Script buscador nombre_completo - Formulario Modificar Nuevo Usuarios */
$(function busca_mod_nombre_completo(){
	
	$('#mod_nombre_completo').keyup(function busca_mod_nombre_completo(){
		var envio_mod_nombre_completo = $('#mod_nombre_completo').val();
		var envio_ant_mod_nombre =$("#ant_mod_nombre_completo").val();

		if(envio_mod_nombre_completo.length>3){	
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_mod_nombre_completo' : envio_mod_nombre_completo,
					'search_ant_mod_nom' : envio_ant_mod_nombre,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_mod_nombre_completo').html(resp);
					}
				}
			})	
		}else{
			$('#sugerencias_mod_nombre_completo').html('');
		}
	})
})
function nombre_anterior(mod_nombre_completo){
	$('#mod_nombre_completo').val(mod_nombre_completo);
	$('#sugerencias_mod_nombre_completo').html('');
	$('#error_mod_nombre_completo').slideUp('slow');
	$('#valida_minimo_mod_nombre_completo').slideUp('slow');
	$('#valida_maximo_mod_nombre_completo').slideUp('slow');
	$('#error_mod_nombre_completo_ya_existe').slideUp('slow');

	$('#mod_login').focus();
}
/* Fin script buscador nombre_completo - Formulario Modificar Nuevo Usuarios */
/* Script buscador mod_login - Formulario Modificar Usuario */
$(function busca_mod_login(){	
	
	$('#mod_login').keyup(function busca_mod_login(){
		var envio_mod_login =$('#mod_login').val();
		var envio_ant_mod_login=$('#ant_mod_login').val();

		if(envio_mod_login.length>1){			
			$.ajax({
				type: 'POST',
				url: 'admin_usuarios/buscador_usuarios.php',
				data: {
					'search_mod_login' : envio_mod_login,
					'search_ant_mod_login' : envio_ant_mod_login,
					'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
				},			
				success: function(resp){
					if(resp!=""){
						$('#sugerencias_mod_login').html(resp);
					}
				}
			})	
		}else{
			$('#sugerencias_mod_login').html('');			
		}

	})
})
function login_anterior(login){
	$('#mod_login').val(login);
	$('#sugerencias_mod_login').html('');
	$('#error_mod_login').slideUp('slow');
	$('#valida_minimo_mod_login').slideUp('slow');
	$('#valida_maximo_mod_login').slideUp('slow');
	$('#error_mod_login_ya_existe').slideUp('slow');

	$('#mod_mail').focus();
}
/* Fin script buscador mod_login - Formulario Modificar Usuario */
/* Script buscador mod_dependencia - Formulario Modificar Usuarios */
/*$(function busca_mod_dependencia(){	
	$('#mod_nombre_dependencia').focus();
	
	$('#mod_nombre_dependencia').keyup(function busca_mod_dependencia(){
		var envio_mod_dependencia = $('#mod_nombre_dependencia').val();
		var search_ant_mod_depe=$("#mod_ant_mod_nom_depe").val();
		$.ajax({
			type: 'POST',
			url: 'admin_usuarios/buscador_usuarios.php',
			data: {
				'search_mod_dependencia' : envio_mod_dependencia,
				'search_ant_mod_depe' : search_ant_mod_depe,
				'desde_formulario' : '1' // Envio variable para que no salga "Para agregar usuario haga click aqui"
			},			
			success: function(resp){
				if(resp!=""){
					$('#sugerencias_mod_dependencia').html(resp);
				}
			}
		})	
	})
})
/* Fin script buscador mod_dependencia - Formulario Modificar Usuarios */

/* Script validar si identificacion ya existe - Formulario Modificar Usuario */
function valida_mod_identificacion_ya_existe(){
	$("#mod_identificacion").focus();
	$("#error_mod_identificacion_ya_existe").slideDown();
}
/* Fin script validar si identificacion ya existe - Formulario Modificar Usuario */
/* Script validar si nombre_completo ya existe - Formulario Modificar Usuario */
function valida_mod_nombre_completo_ya_existe(){
	$("#mod_nombre_completo").focus();
	$("#error_mod_nombre_completo_ya_existe").slideDown();
}
/* Fin script validar si nombre_completo ya existe - Formulario Modificar Usuario */
/* Script validar si mod_login ya existe - Formulario Modificar Usuario */
function valida_mod_login_ya_existe(){
	$("#mod_login").focus();
	$("#error_mod_login_ya_existe").slideDown();
}
/* Fin script validar si mod_login ya existe - Formulario Modificar Usuario */
/* Script que valida si el mod_perfil del usuario esta disponible en la dependencia - Formulario Modificar Usuario*/
/*function valida_mod_perfil(){
	var mod_depe_codi = $("#mod_codigo_dependencia").val();
	var mod_perfil=$("#mod_perfil").val();
		
	$("#depe_mod_perfil").html(mod_depe_codi);
	$("#mod_perfil_p").html(mod_perfil);

	$.ajax({
		url:'admin_usuarios/buscador_usuarios.php',
		type: 'POST',
		data: {
			'search_mod_perfil_depe_codi' : mod_depe_codi,
			'search_mod_perfil' : mod_perfil,
			'desde_formulario' : '1'
		},
		success: function(resp){
				if(resp!=""){
				$('#sugerencias_mod_perfil').html(resp);
			}
		}
	})
	
}
/* Fin script que valida si el mod_perfil del usuario esta disponible en la dependencia - Formulario Modificar Usuario*/




/* Script espacios mod_identificacion - Formulario Modificar Usuario */
function espacios_mod_identificacion(){
	var str = $('#mod_identificacion').val();
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
	str = str.replace(',','');	str = str.replace('^','');	str = str.replace('<','');
	str = str.replace('>','');	str = str.replace('  ','');

	if (isNaN(str)) {
		$("#error_no_es_mod_numero").slideDown("slow");
	}else{
		$("#error_no_es_mod_numero").slideUp("slow");
	}
	$('#mod_identificacion').val(str);
}
/* Fin script espacios mod_identificacion - Formulario Modificar Usuario */
/* Script espacios mod_nombre_completo - Formulario Modificar Usuario */
function espacios_mod_nombre_completo(){
	var str2 = $('#mod_nombre_completo').val();

	str2 = str2.replace('-',''); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace('.','');	str2 = str2.replace(';','');
	str2 = str2.replace(':','');	str2 = str2.replace('_','');	str2 = str2.replace('~','');
	str2 = str2.replace('@','');	str2 = str2.replace('´','');	str2 = str2.replace("+",'');
	str2 = str2.replace("/","");	str2 = str2.replace("*","");	str2 = str2.replace("'","");
	str2 = str2.replace(',','');	str2 = str2.replace('^','');	str2 = str2.replace('ñ','N');
	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');
	str2 = str2.replace('í','I');	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');
	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');
	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');
	str2 = str2.replace('>','');	str2 = str2.replace('  ','');

	$('#mod_nombre_completo').val(str2.toUpperCase());
}
/* Fin script espacios mod_nombre_completo - Formulario Modificar Usuario */
/* Script espacios mod_login - Formulario Modificar Usuario */
function espacios_mod_login(){
	var str2 = $('#mod_login').val();

	str2 = str2.replace('-',''); 	str2 = str2.replace('°','');	str2 = str2.replace('!','');
	str2 = str2.replace('|','');	str2 = str2.replace('"','');	str2 = str2.replace('$','');
	str2 = str2.replace('#','');	str2 = str2.replace('%','');	str2 = str2.replace('&','');
	str2 = str2.replace('=','');	str2 = str2.replace('?','');	str2 = str2.replace('¿','');
	str2 = str2.replace('¡','');	str2 = str2.replace('(','');	str2 = str2.replace(')','');
	str2 = str2.replace('{','');	str2 = str2.replace('}','');	str2 = str2.replace('[','');
	str2 = str2.replace(']','');	str2 = str2.replace(';','');	str2 = str2.replace(':','');	
	str2 = str2.replace('_','');	str2 = str2.replace('~','');	str2 = str2.replace('@','');	
	str2 = str2.replace('´','');	str2 = str2.replace("+",'');	str2 = str2.replace("/","");	
	str2 = str2.replace("*","");	str2 = str2.replace("'","");	str2 = str2.replace(',','');	
	str2 = str2.replace('^','');	str2 = str2.replace('ñ','N');	str2 = str2.replace('Ñ','N');	
	str2 = str2.replace('á','A');	str2 = str2.replace('é','E');	str2 = str2.replace('í','I');	
	str2 = str2.replace('ó','O');	str2 = str2.replace('ú','U');	str2 = str2.replace('Á','A');	
	str2 = str2.replace('É','E');	str2 = str2.replace('Í','I');	str2 = str2.replace('Ó','O');	
	str2 = str2.replace('Ú','U');	str2 = str2.replace('<','');	str2 = str2.replace('>','');	
	str2 = str2.replace('  ','');

	$('#mod_login').val(str2.toUpperCase());
}
/* Fin script espacios mod_login - Formulario Modificar Usuario */
/* Script espacios mod_mail - Formulario Modificar Usuario */
/*function espacios_mod_mail(){
	var str2 = $('#mod_mail').val();

	str2 = str2.replace('ñ','N');	str2 = str2.replace('Ñ','N');	str2 = str2.replace('á','A');	
	str2 = str2.replace('é','E');	str2 = str2.replace('í','I');	str2 = str2.replace('ó','O');	
	str2 = str2.replace('ú','U');	str2 = str2.replace('Á','A');	str2 = str2.replace('É','E');	
	str2 = str2.replace('Í','I');	str2 = str2.replace('Ó','O');	str2 = str2.replace('Ú','U');	
	str2 = str2.replace('  ','');

	$('#mod_mail').val(str2.toUpperCase());
}
function validar_mod_email(mod_mail) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(mod_mail) ){
    	$("#error_mod_mail_formato").slideDown();
    	$("#mod_mail").focus();
    	return false;
    }else {	
		$("#error_mod_mail_formato").slideUp();
  	}
}
/* Fin script espacios mod_mail - Formulario Modificar Usuario */
//espacios_mod_mail 

/* Script para validar campo mod_identificacion - Formulario Modificar Usuario */
function validar_mod_identificacion(mod_identificacion){
	if(mod_identificacion==""){
		$("#error_mod_identificacion").slideDown("slow");
		$("#valida_minimo_mod_identificacion").slideUp("slow");
		$("#valida_maximo_mod_identificacion").slideUp("slow");
		$("#error_mod_identificacion_ya_existe").slideUp("slow");

		$("#mod_identificacion").focus();
		return false;
	}else{
		if(mod_identificacion.length<6){
			$("#error_mod_identificacion").slideUp("slow");
			$("#valida_minimo_mod_identificacion").slideDown("slow");
			$("#valida_maximo_mod_identificacion").slideUp("slow");
			$("#error_mod_identificacion_ya_existe").slideUp("slow");

			$("#mod_identificacion").focus();
			return false;
		}else{
			if(mod_identificacion.length>20){
				$("#error_mod_identificacion").slideUp("slow");
				$("#valida_minimo_mod_identificacion").slideUp("slow");
				$("#valida_maximo_mod_identificacion").slideDown("slow");
				$("#error_mod_identificacion_ya_existe").slideUp("slow");

				$("#mod_identificacion").focus();
				return false;
			}else{
				if($("#sugerencia_mod_id").is(":visible")){
					$("#error_mod_identificacion").slideUp("slow");
					$("#valida_minimo_mod_identificacion").slideUp("slow");
					$("#valida_maximo_mod_identificacion").slideUp("slow");
					$("#error_mod_identificacion_ya_existe").slideDown("slow");

					$("#mod_identificacion").focus();
					return false;
				}else{
					if($("#error_no_es_mod_numero").is(":visible")){
						$("#error_mod_identificacion").slideUp("slow");
						$("#valida_minimo_mod_identificacion").slideUp("slow");
						$("#valida_maximo_mod_identificacion").slideUp("slow");
						$("#error_mod_identificacion_ya_existe").slideUp("slow");

						$("#mod_identificacion").focus();
						return false;
					}else{
						$("#error_mod_identificacion").slideUp("slow");
						$("#valida_minimo_mod_identificacion").slideUp("slow");
						$("#valida_maximo_mod_identificacion").slideUp("slow");
						$("#error_mod_identificacion_ya_existe").slideUp("slow");
						return true;
					}
				}
			}
		}
	}					

}	
/* Fin script para validar campo mod_identificacion - Formulario Modificar Usuario */

/* Script para validar campo mod_nombre_completo - Formulario Modificar Usuario */
function validar_mod_nom_completo(mod_nombre_completo){
	if(mod_nombre_completo==""){
		$("#error_mod_nombre_completo").slideDown("slow");
		$("#valida_minimo_mod_nombre_completo").slideUp("slow");
		$("#valida_maximo_mod_nombre_completo").slideUp("slow");
		$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

		$("#mod_nombre_completo").focus();	
		return false;					
	}else{
		if(mod_nombre_completo.length<6){
			$("#error_mod_nombre_completo").slideUp("slow");
			$("#valida_minimo_mod_nombre_completo").slideDown("slow");
			$("#valida_maximo_mod_nombre_completo").slideUp("slow");
			$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

			$("#mod_nombre_completo").focus();
			return false;
		}else{
			if(mod_nombre_completo.length>30){
				$("#error_mod_nombre_completo").slideUp("slow");
				$("#valida_minimo_mod_nombre_completo").slideUp("slow");
				$("#valida_maximo_mod_nombre_completo").slideDown("slow");
				$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

				$("#mod_nombre_completo").focus();
				return false;
			}else{
				if($("#sugerencia_mod_nom").is(":visible")){
					$("#error_mod_nombre_completo").slideUp("slow");
					$("#valida_minimo_mod_nombre_completo").slideUp("slow");
					$("#valida_maximo_mod_nombre_completo").slideUp("slow");
					$("#error_mod_nombre_completo_ya_existe").slideDown("slow");

					$("#mod_nombre_completo").focus();
					return false;
				}else{
					$("#error_mod_nombre_completo").slideUp("slow");
					$("#valida_minimo_mod_nombre_completo").slideUp("slow");
					$("#valida_maximo_mod_nombre_completo").slideUp("slow");
					$("#error_mod_nombre_completo_ya_existe").slideUp("slow");
					return true;
				}
			}
		}	
	}
}	
/* Fin script para validar campo mod_nombre_completo - Formulario Modificar Usuario */

/* Script para validar campo mod_login - Formulario Modificar Usuario */
function validar_modif_login(mod_login){
	if(mod_login==""){
	$("#error_mod_login").slideDown("slow");
	$("#valida_minimo_mod_login").slideUp("slow");
	$("#valida_maximo_mod_login").slideUp("slow");
	$("#error_mod_login_ya_existe").slideUp("slow");

	$("#mod_login").focus();	
	return false;					
	}else{
		if(mod_login.length<6){
			$("#error_mod_login").slideUp("slow");
			$("#valida_minimo_mod_login").slideDown("slow");
			$("#valida_maximo_mod_login").slideUp("slow");
			$("#error_mod_login_ya_existe").slideUp("slow");

			$("#mod_login").focus();
			return false;
		}
		else{
			if(mod_login.length>30){
				$("#error_mod_login").slideUp("slow");
				$("#valida_minimo_mod_login").slideUp("slow");
				$("#valida_maximo_mod_login").slideDown("slow");
				$("#error_mod_login_ya_existe").slideUp("slow");

				$("#mod_login").focus();
				return false;
			}else{
				if($("#sugerencia_mod_login").is(":visible")){
					$("#error_mod_login").slideUp("slow");
					$("#valida_minimo_mod_login").slideUp("slow");
					$("#valida_maximo_mod_login").slideUp("slow");
					$("#error_mod_login_ya_existe").slideDown("slow");

					$("#mod_login").focus();
					return false;
				}else{
					$("#error_mod_login").slideUp("slow");
					$("#valida_minimo_mod_login").slideUp("slow");
					$("#valida_maximo_mod_login").slideUp("slow");
					$("#error_mod_login_ya_existe").slideUp("slow");
					return true;
				}
			}
		}		
	}
}	
/* Fin script para validar campo mod_login - Formulario Modificar Usuario */
/* Script para validar campo mod_mail - Formulario Modificar Usuario */
/*function validar_modif_email(mod_mail){
	if(mod_mail==""){
		$("#error_mod_mail").slideDown("slow");
		$("#valida_minimo_mod_mail").slideUp("slow");
		$("#valida_maximo_mod_mail").slideUp("slow");
		$("#error_mod_mail_formato").slideUp("slow");

		$("#mod_mail").focus();
		return false;
	}else{
		if(mod_mail.length<6){
			$("#error_mod_mail").slideUp("slow");
			$("#valida_minimo_mod_mail").slideDown("slow");
			$("#valida_maximo_mod_mail").slideUp("slow");
			$("#error_mod_mail_formato").slideUp("slow");

			$("#mod_mail").focus();
			return false;
		}else{
			if(mod_mail.length>30){
				$("#error_mod_mail").slideUp("slow");
				$("#valida_minimo_mod_mail").slideUp("slow");
				$("#valida_maximo_mod_mail").slideDown("slow");
				$("#error_mod_mail_formato").slideUp("slow");

				$("#mod_mail").focus();
				return false;
			}else{
				$("#error_mod_mail").slideUp("slow");
				$("#valida_minimo_mod_mail").slideUp("slow");
				$("#valida_maximo_mod_mail").slideUp("slow");
				$("#error_mod_mail_formato").slideUp("slow");

				var valida_mod_mail = validar_mod_email(mod_mail);
				if(valida_mod_mail==false){
					return false;
				}else{ 
					$("#error_mod_mail").slideUp("slow");
					$("#valida_minimo_mod_mail").slideUp("slow");
					$("#valida_maximo_mod_mail").slideUp("slow");
						
					$("#mod_nombre_dependencia").focus();
					return true;
				}
			}
		}
	}
}	
/* Fin script para validar campo mod_mail - Formulario Modificar Usuario */
/* Script para validar campo mod_dependencia - Formulario Modificar Usuario */
/*function validar_modif_dep(mod_depe){			
	if(mod_depe==""){
		$("#error_mod_dependencia").slideDown("slow");
		$("#valida_minimo_mod_dependencia").slideUp("slow");
		$("#valida_maximo_mod_dependencia").slideUp("slow");
		$("#error_mod_dependencia_invalida").slideUp("slow");
		$("#error_mod_dependencia_inexistente").slideUp("slow");

		$("#mod_dependencia").focus();	
		return false;					
	}else{
		if(mod_depe.length<6){
			$("#error_mod_dependencia").slideUp("slow");
			$("#valida_minimo_mod_dependencia").slideDown("slow");
			$("#valida_maximo_mod_dependencia").slideUp("slow");
			$("#error_mod_dependencia_invalida").slideUp("slow");
			$("#error_mod_dependencia_inexistente").slideUp("slow");

			$("#mod_dependencia").focus();
			return false;
		}else{
			if(mod_depe.length>50){
				$("#error_mod_dependencia").slideUp();
				$("#valida_minimo_mod_dependencia").slideUp("slow");
				$("#valida_maximo_mod_dependencia").slideDown("slow");
				$("#error_mod_dependencia_invalida").slideUp("slow");
				$("#error_mod_dependencia_inexistente").slideUp("slow");

				$("#mod_dependencia").focus();
				return false;
			}else{
				if($("#sugerencia_mod_dependencia").is(":visible")){
					$("#error_mod_dependencia").slideUp("slow");
					$("#valida_minimo_mod_dependencia").slideUp("slow");
					$("#valida_maximo_mod_dependencia").slideUp("slow");
					$("#error_mod_dependencia_invalida").slideDown("slow");
					$("#error_mod_dependencia_inexistente").slideUp("slow");

					$("#mod_dependencia").focus();
					return false;
				}else{
					if($("#error_mod_dependencia_inexistente").is(":visible")){
						$("#error_mod_dependencia").slideUp();
						$("#valida_minimo_mod_dependencia").slideUp("slow");
						$("#valida_maximo_mod_dependencia").slideUp("slow");
						$("#error_mod_dependencia_invalida").slideUp("slow");

						$("#mod_dependencia").focus();
						return false
					}else{
						$("#error_mod_dependencia").slideUp();
						$("#valida_minimo_mod_dependencia").slideUp("slow");
						$("#valida_maximo_mod_dependencia").slideUp("slow");
						$("#error_mod_dependencia_invalida").slideUp("slow");
						$("#error_mod_dependencia_inexistente").slideUp("slow");

						$("#mod_perfil").focus();
					}
				}		
			}
		}
	}			
}
/* Fin script para validar campo mod_dependencia - Formulario Modificar Usuario */

/* Funcion para modificar Usuarios */
function validar_modificar_usuario(){
	var mod_identificacion =$('#mod_identificacion').val();
	var validar_mod_id = validar_mod_identificacion(mod_identificacion);

	var mod_nombre_completo=$("#mod_nombre_completo").val();
	var validar_mod_nombre_completo= validar_mod_nom_completo(mod_nombre_completo);
	
	var mod_login=$("#mod_login").val();
	var validar_mod_login= validar_modif_login(mod_login);
	
/*
	var mod_mail=$("#mod_mail").val();
	var validar_mod_email= validar_modif_email(mod_mail);
	
	var mod_depe=$("#mod_nombre_dependencia").val();
	var validar_modif_depe=validar_modif_dep(mod_depe);
*/
	if(validar_mod_id==false){
		$("#mod_identificacion").focus()
		return false;
	}else{
		if(validar_mod_nombre_completo==false){
			$("#mod_nombre_completo").focus();
			return false;
		}else{
			
			if(validar_mod_login==false){
				$("#mod_login").focus();
				return false;
			}else{
		/*		if(validar_mod_email==false){
					$("#mod_email").focus();
					return false;
				}else{
					if(validar_modif_depe==false){
						$("#mod_nombre_dependencia").focus();
						return false;
					}else{
						if($("#error_mod_perfil").is(":visible")){
							$("#mod_perfil").focus();
							return false;
						}else{*/
							return true;
							/*
						}
					}
				}
		*/
			}
		}
	}
}

$(function submit_modificar_usuario(){
	$('#bModificarUsuario').click(function submit_modificar_usuario(){
		var submit_modificar_usuario = validar_modificar_usuario();
		if(submit_modificar_usuario==false){
			return false;
		}else if(submit_modificar_usuario==true){ // Realizar la modificacion de Usuario
			alert("Ya estoy actualizando");
			/*	
			$.ajax({
				url:'admin_usuarios/query_usuarios.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					$('#formulario_modificar_usuario').submit(); // Realizar la modificacion del usuario
					$("#contenido").load("admin_usuarios/index_usuarios.php");	
				}
			})
			*/
		}else{
			alert("No se puede modificar el usuario. Intente nuevamente")
		}										
	});
})

/************************************************************************************************************/
/* Fin Modificar Usuarios ***********************************************************************************/
/************************************************************************************************************/