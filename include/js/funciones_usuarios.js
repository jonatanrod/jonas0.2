/* Script para ventana modal - Tecla Esc */
    window.addEventListener("keydown", function(event){
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
var timerid="";
$(function buscador_usuarios(){
	$("#search_usuario").focus();

	$("#search_usuario").on("input",function(e){ // Accion que se activa cuando se digita #search_usuario
		$('#desplegable_resultados').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
        var envio_usuario = $(this).val();
	    
	    if($(this).data("lastval")!= envio_usuario){
	    	$(this).data("lastval",envio_usuario);
                    
   			clearTimeout(timerid);
   			timerid = setTimeout(function() {
         		//alert("valor "+envio_usuario);

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
				if(envio_usuario.length>50){
					$('#desplegable_resultados').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
				}  				 
   			},1000);
	    };
	});
});
/************************************************************************************************************/
/* Fin Buscador - Administrador de Usuarios *****************************************************************/
/************************************************************************************************************/

/************************************************************************************************************/
/* Formulario Agregar Nuevo Usuario *************************************************************************/
/************************************************************************************************************/

/* Script buscador identificacion - Formulario Agregar Nuevo Usuarios */
$("#identificacion").on("input",function(e){ // Accion que se activa cuando se digita #identificacion
    $('#sugerencias_identificacion').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>"); 				
    oculta_errores();
    var envio_identificacion = $(this).val();
    
    if($(this).data("lastval")!= envio_identificacion){
    	$(this).data("lastval",envio_identificacion);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {

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
			if(envio_identificacion.length>50){
				$('#sugerencias_identificacion').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
/* Fin script buscador identificacion - Formulario Agregar Nuevo Usuarios */
/* Script buscador nombre_completo - Formulario Agregar Nuevo Usuarios */
$("#nombre_completo").on("input",function(e){ // Accion que se activa cuando se digita #identificacion
	$('#sugerencias_nombre_completo').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
    oculta_errores();
    var envio_nombre_completo = $(this).val();
    
    if($(this).data("lastval")!= envio_nombre_completo){
    	$(this).data("lastval",envio_nombre_completo);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
	 		//alert("valor "+envio_nombre_completo);

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
			if(envio_nombre_completo.length>50){
				$('#sugerencias_nombre_completo').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
/* Fin script buscador nombre_completo - Formulario Agregar Nuevo Usuarios */
/* Script buscador login - Formulario Agregar Nuevo Usuarios */
$("#login").on("input",function(e){ // Accion que se activa cuando se digita #identificacion
	$('#sugerencias_login').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
    oculta_errores();
    var envio_login = $(this).val();
    
    if($(this).data("lastval")!= envio_login){
    	$(this).data("lastval",envio_login);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
	 		//alert("valor "+envio_login);

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
			if(envio_login.length>50){
				$('#sugerencias_login').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
/* Fin script buscador login - Formulario Agregar Nuevo Usuarios */
/* Script buscador dependencia - Formulario Agregar Nuevo Usuarios */
$("#dependencia").on("input",function(e){ // Accion que se activa cuando se digita #identificacion
	$('#sugerencias_dependencia').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
    oculta_errores();
    var envio_dependencia = $(this).val();
    
    if($(this).data("lastval")!= envio_dependencia){
    	$(this).data("lastval",envio_dependencia);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
	 		//alert("valor "+envio_dependencia);

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
			if(envio_dependencia.length>50){
				$('#sugerencias_dependencia').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
});
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

	oculta_errores();

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
/* Script para ocultar errores y continuar consulta - Formulario Agregar Usuario */
function oculta_errores(){
	//$("#error_no_es_numero").slideUp("slow");
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
}
/* Fin script para ocultar errores y continuar consulta - Formulario Agregar Usuario */
/* Funcion para restringir caraceres especiales en formulario Usuarios. */
function espacios_formulario_usuarios(input){
	switch(input){
		case 'search_usuario':
			var str = $('#search_usuario').val();	
			break;
		case 'identificacion':
			var str = $('#identificacion').val();
			if (isNaN(str)) {
				$("#error_no_es_numero").slideDown("slow");
			}else{
				$("#error_no_es_numero").slideUp("slow");
			}
			break;
		case 'nombre_completo':
			var str = $('#nombre_completo').val();	
			break;	
		case 'login':
			var str = $('#login').val();
			break;	
		case 'dependencia':
			var str = $('#dependencia').val();
			break;	
		case 'mod_identificacion':
			var str = $('#mod_identificacion').val();

			if (isNaN(str)) {
				$("#error_no_es_mod_numero").slideDown("slow");
			}else{
				$("#error_no_es_mod_numero").slideUp("slow");
			}
			break;
		case 'mod_nombre_completo':
			var str = $('#mod_nombre_completo').val();
			break;	
		case 'mod_login':
			var str = $('#mod_login').val();
			break;	
		case 'mod_nombre_dependencia':
			var str = $('#mod_nombre_dependencia').val();
			break;		
	}
		str = str.replace('-',''); 	str = str.replace('°','');	str = str.replace('!','');
		str = str.replace('|','');	str = str.replace('"','');	str = str.replace('$','');
		str = str.replace('#','');	str = str.replace('%','');	str = str.replace('&','');
		str = str.replace('=','');	str = str.replace('?','');	str = str.replace('¿','');
		str = str.replace('¡','');	str = str.replace('(','');	str = str.replace(')','');
		str = str.replace('{','');	str = str.replace('}','');	str = str.replace('[','');
		str = str.replace(']','');	str = str.replace(';','');
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
		case 'search_usuario':
			$('#search_usuario').val(str.toUpperCase());
			break;
		case 'identificacion':
			$('#identificacion').val(str);
			break;	
		case 'nombre_completo':
			$('#nombre_completo').val(str.toUpperCase());	
			break;
		case 'login':
			$('#login').val(str.toUpperCase());
			break;	
		case 'dependencia':
			$('#dependencia').val(str.toUpperCase());
			break;	
		case 'mod_identificacion':
			$('#mod_identificacion').val(str);
			break;	
		case 'mod_nombre_completo':
			$('#mod_nombre_completo').val(str.toUpperCase());
			break;	
		case 'mod_login':
			$('#mod_login').val(str.toUpperCase());
			break;
		case 'mod_nombre_dependencia':
			$('#mod_nombre_dependencia').val(str.toUpperCase());
			break;		
	}	
}
/* Fin funcion para restringir caraceres especiales en formulario Usuarios. */

/* Script espacios mail - Formulario Agregar Nuevo Usuario */
function espacios_mail(tipo_form){
	switch(tipo_form){
		case 'agregar_usuario':
			var str2 = $('#mail').val();
			break;
		case 'modificar_usuario':
			var str2 = $('#mod_mail').val();
		break;
	}

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

	switch(tipo_form){
		case 'agregar_usuario':
			$('#mail').val(str2.toUpperCase());
			break;
		case 'modificar_usuario':
			$('#mod_mail').val(str2.toUpperCase());
			break;
	}
}
/* Fin script espacios mail - Formulario Agregar Nuevo Usuario */

/* Script cargar campo dependencia - Formulario Agregar Usuarios */
function carga_dependencia(codigo_dependencia, dependencia){
	oculta_errores();
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

/* Funcion validar identificacion para hacer submit */
function validar_identificacion(){
	var identificacion =$('#identificacion').val()
	if(identificacion==""){
		$("#error_identificacion").slideDown("slow");
		$("#valida_minimo_identificacion").slideUp("slow");
		$("#valida_maximo_identificacion").slideUp("slow");
		$("#error_identificacion_ya_existe").slideUp("slow");
		return false;
	}else{	
		if(identificacion.length<6){
			$("#error_identificacion").slideUp("slow");
			$("#valida_minimo_identificacion").slideDown("slow");
			$("#valida_maximo_identificacion").slideUp("slow");
			$("#error_identificacion_ya_existe").slideUp("slow");
			return false;
		}else{
			if(identificacion.length>20){
				$("#error_identificacion").slideUp("slow");
				$("#valida_minimo_identificacion").slideUp("slow");
				$("#valida_maximo_identificacion").slideDown("slow");
				$("#error_identificacion_ya_existe").slideUp("slow");
				return false;
			}else{
				if($("#sugerencia_id").is(":visible")){
					$("#error_identificacion").slideUp("slow");
					$("#valida_minimo_identificacion").slideUp("slow");
					$("#valida_maximo_identificacion").slideUp("slow");
					$("#error_identificacion_ya_existe").slideDown("slow");
					return false;
				}else{
					if($("#error_no_es_numero").is(":visible")){
						$("#error_identificacion").slideUp("slow");
						$("#valida_minimo_identificacion").slideUp("slow");
						$("#valida_maximo_identificacion").slideUp("slow");
						$("#error_identificacion_ya_existe").slideUp("slow");
						return false;
					}else{
						$("#error_identificacion").slideUp("slow");
						$("#valida_minimo_identificacion").slideUp("slow");
						$("#valida_maximo_identificacion").slideUp("slow");
						$("#error_identificacion_ya_existe").slideUp("slow");
						return true;
					}
				}
			}
		}
	}				
}
/* Fin funcion validar identificacion para hacer submit */
/* Funcion validar nombre para hacer submit */
function validar_nombre(){
	var nombre_completo =$('#nombre_completo').val()

	if(nombre_completo==""){
		$("#error_nombre_completo").slideDown("slow");
		$("#valida_minimo_nombre_completo").slideUp("slow");
		$("#valida_maximo_nombre_completo").slideUp("slow");
		$("#error_nombre_completo_ya_existe").slideUp("slow");
		return false;					
	}else{
		if(nombre_completo.length<6){
			$("#error_nombre_completo").slideUp("slow");
			$("#valida_minimo_nombre_completo").slideDown("slow");
			$("#valida_maximo_nombre_completo").slideUp("slow");
			$("#error_nombre_completo_ya_existe").slideUp("slow");
			return false;
		}else{
			if(nombre_completo.length>50){
				$("#error_nombre_completo").slideUp("slow");
				$("#valida_minimo_nombre_completo").slideUp("slow");
				$("#valida_maximo_nombre_completo").slideDown("slow");
				$("#error_nombre_completo_ya_existe").slideUp("slow");
				return false;
			}else{
				if($("#sugerencia_nombre_completo").is(":visible")){
					$("#error_nombre_completo").slideUp("slow");
					$("#valida_minimo_nombre_completo").slideUp("slow");
					$("#valida_maximo_nombre_completo").slideUp("slow");
					$("#error_nombre_completo_ya_existe").slideDown("slow");
					return false;
				}else{
					$("#error_nombre_completo").slideUp("slow");
					$("#valida_minimo_nombre_completo").slideUp("slow");
					$("#valida_maximo_nombre_completo").slideUp("slow");
					$("#error_nombre_completo_ya_existe").slideUp("slow");
					return true;
				}
			}
		}
	}			
}
/* Fin funcion validar nombre para hacer submit */
/* Funcion validar login para hacer submit */
function validar_login(){
	var login=$("#login").val();

	if(login==""){
		$("#error_login").slideDown("slow");
		$("#valida_minimo_login").slideUp("slow");
		$("#valida_maximo_login").slideUp("slow");
		$("#error_login_ya_existe").slideUp("slow");
		return false;					
	}else{
		if(login.length<6){
			$("#error_login").slideUp("slow");
			$("#valida_minimo_login").slideDown("slow");
			$("#valida_maximo_login").slideUp("slow");
			$("#error_login_ya_existe").slideUp("slow");
			return false;
		}
		else{
			if(login.length>30){
				$("#error_login").slideUp("slow");
				$("#valida_minimo_login").slideUp("slow");
				$("#valida_maximo_login").slideDown("slow");
				$("#error_login_ya_existe").slideUp("slow");
				return false;
			}else{
				if($("#sugerencia_login").is(":visible")){
					$("#error_login").slideUp("slow");
					$("#valida_minimo_login").slideUp("slow");
					$("#valida_maximo_login").slideUp("slow");
					$("#error_login_ya_existe").slideDown("slow");
					return false;
				}else{
					$("#error_login").slideUp("slow");
					$("#valida_minimo_login").slideUp("slow");
					$("#valida_maximo_login").slideUp("slow");
					$("#error_login_ya_existe").slideUp("slow");
					return true;
				}
			}
		}
	}				
}
/* Fin funcion validar login para hacer submit */
/* Funcion para validar email para hacer submit */
function validar_correo_electronico(){
	var mail=$("#mail").val();
	if(mail==""){
		$("#error_mail").slideDown("slow");
		$("#valida_minimo_mail").slideUp("slow");
		$("#valida_maximo_mail").slideUp("slow");
		$("#error_mail_formato").slideUp("slow");
		return false;
	}else{
		if(mail.length<6){
			$("#error_mail").slideUp("slow");
			$("#valida_minimo_mail").slideDown("slow");
			$("#valida_maximo_mail").slideUp("slow");
			$("#error_mail_formato").slideUp("slow");
			return false;
		}
		else{
			if(mail.length>30){
				$("#error_mail").slideUp("slow");
				$("#valida_minimo_mail").slideUp("slow");
				$("#valida_maximo_mail").slideDown("slow");
				$("#error_mail_formato").slideUp("slow");
				return false;
			}else{
				$("#error_mail").slideUp("slow");
				$("#valida_minimo_mail").slideUp("slow");
				$("#valida_maximo_mail").slideUp("slow");
				$("#error_mail_formato").slideUp("slow");
				return true;
			}
		}
	}									
}
/* Fin funcion para validar email para hacer submit */
/* Funcion para validar formato de email (usuario@algunmail.com) */
function validar_correo_electronico2(){
	var mail=$("#mail").val();
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	
    if ( !expr.test(mail) ){
    	$("#error_mail_formato").slideDown();
    	$("#mail").focus();
    	return false;
    }else {	
		$("#error_mail_formato").slideUp();
		$("#error_mail").slideUp("slow");
		$("#valida_minimo_mail").slideUp("slow");
		$("#valida_maximo_mail").slideUp("slow");
		return true;
	}
}
/* Fin funcion para validar formato de email (usuario@algunmail.com) */
/* Funcion para validar dependencia para hacer submit */
function validar_dependencia(){
	var dependencia=$("#dependencia").val();
	if(dependencia==""){
		$("#error_dependencia").slideDown("slow");
		$("#valida_minimo_dependencia").slideUp("slow");
		$("#valida_maximo_dependencia").slideUp("slow");
		$("#error_dependencia_invalida").slideUp("slow");
		$("#error_dependencia_inexistente").slideUp("slow");
		return false;					
	}else{
		if(dependencia.length<6){
			$("#error_dependencia").slideUp("slow");
			$("#valida_minimo_dependencia").slideDown("slow");
			$("#valida_maximo_dependencia").slideUp("slow");
			$("#error_dependencia_invalida").slideUp("slow");
			$("#error_dependencia_inexistente").slideUp("slow");
			return false;
		}
		else{
			if(dependencia.length>50){
				$("#error_dependencia").slideUp();
				$("#valida_minimo_dependencia").slideUp("slow");
				$("#valida_maximo_dependencia").slideDown("slow");
				$("#error_dependencia_invalida").slideUp("slow");
				$("#error_dependencia_inexistente").slideUp("slow");
				return false;
			}else{
				if($("#sugerencia_dependencia").is(":visible")){
					$("#error_dependencia").slideUp("slow");
					$("#valida_minimo_dependencia").slideUp("slow");
					$("#valida_maximo_dependencia").slideUp("slow");
					$("#error_dependencia_invalida").slideDown("slow");
					$("#error_dependencia_inexistente").slideUp("slow");
					return false;
				}else{
					if($("#error_dependencia_inexistente").is(":visible")){
						$("#error_dependencia").slideUp();
						$("#valida_minimo_dependencia").slideUp("slow");
						$("#valida_maximo_dependencia").slideUp("slow");
						$("#error_dependencia_invalida").slideUp("slow");
						return false
					}else{
						if($("#codigo_dependencia").val()==""){
							$("#error_dependencia").slideDown("slow");
							return false
						}else{
							$("#error_dependencia").slideUp("slow");
							$("#valida_minimo_dependencia").slideUp("slow");
							$("#valida_maximo_dependencia").slideUp("slow");
							$("#error_dependencia_invalida").slideUp("slow");
							$("#error_dependencia_inexistente").slideUp("slow");
							return true;
						}
					}
				}
			}
		}
	}												
}
/* Fin funcion para validar dependencia para hacer submit */
/* Funcion para validar perfil para hacer submit */
function validar_perfil(){
	var imagen=$("#imagen").val();
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
/* Fin funcion para validar perfil para hacer submit */
/*Funcion para insertar datos - Formulario Agregar Usuario*/
function validar_agregar_usuario(){
	var validar_id =validar_identificacion();

	if(validar_id==false){
		$("#identificacion").focus()
		return false;
	}else{
		var validar_nom = validar_nombre();
		if(validar_nom==false){
			$("#nombre_completo").focus();
			return false;
		}else{
			var validar_log=validar_login();
			if(validar_log==false){
				$("#login").focus();
				return false;
			}else{
				var validar_mail=validar_correo_electronico();
				if(validar_mail==false){
					$("#mail").focus();
					return false;
				}else{
					var validar_mail_formato=validar_correo_electronico2();
					if(validar_mail_formato==false){
						$("#mail").focus();
						return false;
					}else{
						var validar_depe=validar_dependencia();
						if(validar_depe==false){
							$("#dependencia").focus();
							return false;	
						}else{
							var validar_per=validar_perfil();
							if(validar_per==false){
								$("#perfil").focus();
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

$(function submit_agregar_usuario(){
	$('#bCrearUsuario').click(function submit_agregar_usuario(){
		var submit_agregar_usuario = validar_agregar_usuario();
		if(submit_agregar_usuario==false){
			return false;
		}else{ // Realizar la creación de Usuario
			$('#formulario_agregar_usuario').submit(); // Realizar la creación del usuario
			$("#contenido").load("admin_usuarios/index_usuarios.php");	
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
	$('#mod_nombre_dependencia').focus();
}

function cerrarVentanaModificarUsuarios(){
	$("#ventana2").slideUp("slow");
	$("#search_usuario").focus();

	$(".art1").slideUp("slow");

	$("#error_no_es_mod_numero").slideUp("slow");
	oculta_mod_errores();

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
function carga_mod_dependencia(codigo_mod_dependencia, mod_dependencia){
	$("#mod_codigo_dependencia").val(codigo_mod_dependencia);
	$("#mod_nombre_dependencia").val(mod_dependencia);
	$("#sugerencias_mod_dependencia").slideUp("slow");
	$("#error_mod_dependencia_invalida").slideUp("slow");

	$("#mod_perfil").focus()
	valida_mod_perfil();
}
/* Fin script cargar campo mod_dependencia - Formulario Modificar Usuarios */
/* Script para ocultar errores y continuar consulta - Formulario Agregar Usuario */
function oculta_mod_errores(){
	$("#error_mod_identificacion").slideUp("slow");
	$("#valida_minimo_mod_identificacion").slideUp("slow");
	$("#valida_maximo_mod_identificacion").slideUp("slow");
	$("#error_mod_identificacion_ya_existe").slideUp("slow");
	
	$("#error_mod_nombre_completo").slideUp("slow");
	$("#valida_minimo_mod_nombre_completo").slideUp("slow");
	$("#valida_maximo_mod_nombre_completo").slideUp("slow");
	$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

	$("#error_mod_login").slideUp("slow");
	$("#valida_minimo_mod_login").slideUp("slow");
	$("#valida_maximo_mod_login").slideUp("slow");
	$("#error_mod_login_ya_existe").slideUp("slow");

	$("#error_mod_mail").slideUp("slow");
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
}
/* Script buscador identificacion - Formulario Modificar Nuevo Usuarios */		
$("#mod_identificacion").on("input",function(e){ // Accion que se activa cuando se digita #mod_identificacion
    $('#sugerencias_mod_identificacion').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	oculta_mod_errores();
	var envio_mod_identificacion = $(this).val();	
	var envio_ant_mod_id =$("#ant_mod_identificacion").val();

	if($(this).data("lastval")!= envio_mod_identificacion){
    	$(this).data("lastval",envio_mod_identificacion);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(envio_mod_identificacion.length>2 && envio_mod_identificacion.length<50){
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
				$('.errores').slideUp('slow');
			}	
			if(envio_mod_identificacion.length>50){
				$('#sugerencias_mod_identificacion').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
})

function id_anterior(documento_usuario){ // Funcion que se activa cuando se digita el mismo numero de documento que tenía.
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
$("#mod_nombre_completo").on("input",function(e){ // Accion que se activa cuando se digita #mod_nombre_completo
    $('#sugerencias_mod_nombre_completo').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	oculta_mod_errores();
	var envio_mod_nombre_completo = $(this).val();	
	var envio_ant_mod_nombre =$("#ant_mod_nombre_completo").val();

	if($(this).data("lastval")!= envio_mod_nombre_completo){
    	$(this).data("lastval",envio_mod_nombre_completo);
                
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(envio_mod_nombre_completo.length>2 && envio_mod_nombre_completo.length<50){
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
				$('.errores').slideUp('slow');
			}	
			if(envio_mod_nombre_completo.length>50){
				$('#sugerencias_mod_nombre_completo').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
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
$("#mod_login").on("input",function(e){ // Accion que se activa cuando se digita #mod_login
    $('#sugerencias_mod_login').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	oculta_mod_errores();
	var envio_mod_login = $(this).val();	
	var envio_ant_mod_login =$("#ant_mod_login").val();

	if($(this).data("lastval")!= envio_mod_login){
    	$(this).data("lastval",envio_mod_login);
            
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(envio_mod_login.length>2 && envio_mod_login.length<50){

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
				$('.errores').slideUp('slow');
			}	
			if(envio_mod_login.length>50){
				$('#sugerencias_mod_login').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
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

$("#mod_nombre_dependencia").on("input",function(e){ // Accion que se activa cuando se digita #mod_nombre_dependencia
	$('#sugerencias_mod_dependencia').html("<center><h3><img src='imagenes/logo.gif' alt='Cargando...' width='100'><br>Cargando...</h3></center>");
	oculta_mod_errores();
	var envio_mod_dependencia = $(this).val();	
	var search_ant_mod_depe =$("#mod_ant_mod_nom_depe").val();

	if($(this).data("lastval")!= envio_mod_dependencia){
    	$(this).data("lastval",envio_mod_dependencia);
            
		clearTimeout(timerid);
		timerid = setTimeout(function() {
     		if(envio_mod_dependencia.length>2 && envio_mod_dependencia.length<50){

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
			}else{
				$('#sugerencias_mod_dependencia').html('');
				$('.errores').slideUp('slow');
			}	
			if(envio_mod_dependencia.length>50){
				$('#sugerencias_mod_dependencia').html('<h4>La busqueda debe tener 50 caracteres maximo. Revise por favor</h4>');
			}  				 
		},1000);
    };
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
function valida_mod_perfil(){
	var mod_depe_codi = $("#mod_codigo_dependencia").val();
	var mod_perfil=$("#mod_perfil").val();
	var ant_mod_login=$("#ant_mod_nombre_completo").val();
		
	$("#depe_mod_perfil").html(mod_depe_codi);
	$("#mod_perfil_p").html(mod_perfil);

	$.ajax({
		url:'admin_usuarios/buscador_usuarios.php',
		type: 'POST',
		data: {
			'search_mod_perfil_depe_codi' : mod_depe_codi,
			'search_mod_perfil' : mod_perfil,
			'ant_mod_login' : ant_mod_login,
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
/* Funcion para validar tipo de archivo - Formulario Agregar Usuario */
function valida_mod_tipo_archivo(){
	var imagen = document.getElementById("imagen2").files;
	
	if(imagen.length==0){
		//$("#error_imagen").slideDown("slow");
	}else{
		//$("#error_imagen").slideUp("slow");
		for(x=0; x<imagen.length; x++){
			if(imagen[x].type!= "image/png" && imagen[x].type!="image/jpg"  && imagen[x].type!="image/jpeg" && imagen[x].type!="image/gif"){
				$("#error_mod_imagen_invalida").slideDown("slow");
				return false;
			}else{
				$("#error_mod_imagen_invalida").slideUp("slow");
			}
		}
	}
}
/* Fin funcion para validar tipo de archivo - Formulario Agregar Usuario */
/* Script para validar campo mod_identificacion - Formulario Modificar Usuario */
function validar_mod_identificacion(){
	var mod_identificacion =$('#mod_identificacion').val();

	if(mod_identificacion==""){
		$("#error_mod_identificacion").slideDown("slow");
		$("#valida_minimo_mod_identificacion").slideUp("slow");
		$("#valida_maximo_mod_identificacion").slideUp("slow");
		$("#error_mod_identificacion_ya_existe").slideUp("slow");

		return false;
	}else{
		if(mod_identificacion.length<6){
			$("#error_mod_identificacion").slideUp("slow");
			$("#valida_minimo_mod_identificacion").slideDown("slow");
			$("#valida_maximo_mod_identificacion").slideUp("slow");
			$("#error_mod_identificacion_ya_existe").slideUp("slow");

			return false;
		}else{
			if(mod_identificacion.length>20){
				$("#error_mod_identificacion").slideUp("slow");
				$("#valida_minimo_mod_identificacion").slideUp("slow");
				$("#valida_maximo_mod_identificacion").slideDown("slow");
				$("#error_mod_identificacion_ya_existe").slideUp("slow");

				return false;
			}else{
				if($("#sugerencia_mod_id").is(":visible")){
					$("#error_mod_identificacion").slideUp("slow");
					$("#valida_minimo_mod_identificacion").slideUp("slow");
					$("#valida_maximo_mod_identificacion").slideUp("slow");
					$("#error_mod_identificacion_ya_existe").slideDown("slow");

					return false;
				}else{
					if($("#error_no_es_mod_numero").is(":visible")){
						$("#error_mod_identificacion").slideUp("slow");
						$("#valida_minimo_mod_identificacion").slideUp("slow");
						$("#valida_maximo_mod_identificacion").slideUp("slow");
						$("#error_mod_identificacion_ya_existe").slideUp("slow");

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
function validar_mod_nom_completo(){
	var mod_nombre_completo=$("#mod_nombre_completo").val();

	if(mod_nombre_completo==""){
		$("#error_mod_nombre_completo").slideDown("slow");
		$("#valida_minimo_mod_nombre_completo").slideUp("slow");
		$("#valida_maximo_mod_nombre_completo").slideUp("slow");
		$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

		return false;					
	}else{
		if(mod_nombre_completo.length<6){
			$("#error_mod_nombre_completo").slideUp("slow");
			$("#valida_minimo_mod_nombre_completo").slideDown("slow");
			$("#valida_maximo_mod_nombre_completo").slideUp("slow");
			$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

			return false;
		}else{
			if(mod_nombre_completo.length>50){
				$("#error_mod_nombre_completo").slideUp("slow");
				$("#valida_minimo_mod_nombre_completo").slideUp("slow");
				$("#valida_maximo_mod_nombre_completo").slideDown("slow");
				$("#error_mod_nombre_completo_ya_existe").slideUp("slow");

				return false;
			}else{
				if($("#sugerencia_mod_nom").is(":visible")){
					$("#error_mod_nombre_completo").slideUp("slow");
					$("#valida_minimo_mod_nombre_completo").slideUp("slow");
					$("#valida_maximo_mod_nombre_completo").slideUp("slow");
					$("#error_mod_nombre_completo_ya_existe").slideDown("slow");

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
function validar_modif_login(){
	var mod_login=$("#mod_login").val();

	if(mod_login==""){
		$("#error_mod_login").slideDown("slow");
		$("#valida_minimo_mod_login").slideUp("slow");
		$("#valida_maximo_mod_login").slideUp("slow");
		$("#error_mod_login_ya_existe").slideUp("slow");

		return false;					
	}else{
		if(mod_login.length<6){
			$("#error_mod_login").slideUp("slow");
			$("#valida_minimo_mod_login").slideDown("slow");
			$("#valida_maximo_mod_login").slideUp("slow");
			$("#error_mod_login_ya_existe").slideUp("slow");

			return false;
		}
		else{
			if(mod_login.length>30){
				$("#error_mod_login").slideUp("slow");
				$("#valida_minimo_mod_login").slideUp("slow");
				$("#valida_maximo_mod_login").slideDown("slow");
				$("#error_mod_login_ya_existe").slideUp("slow");

				return false;
			}else{
				if($("#sugerencia_mod_login").is(":visible")){
					$("#error_mod_login").slideUp("slow");
					$("#valida_minimo_mod_login").slideUp("slow");
					$("#valida_maximo_mod_login").slideUp("slow");
					$("#error_mod_login_ya_existe").slideDown("slow");

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
function validar_modif_email(){
	var mod_mail=$("#mod_mail").val();

	if(mod_mail==""){
		$("#error_mod_mail").slideDown("slow");
		$("#valida_minimo_mod_mail").slideUp("slow");
		$("#valida_maximo_mod_mail").slideUp("slow");
		$("#error_mod_mail_formato").slideUp("slow");

		return false;
	}else{
		if(mod_mail.length<6){
			$("#error_mod_mail").slideUp("slow");
			$("#valida_minimo_mod_mail").slideDown("slow");
			$("#valida_maximo_mod_mail").slideUp("slow");
			$("#error_mod_mail_formato").slideUp("slow");

			return false;
		}else{
			if(mod_mail.length>30){
				$("#error_mod_mail").slideUp("slow");
				$("#valida_minimo_mod_mail").slideUp("slow");
				$("#valida_maximo_mod_mail").slideDown("slow");
				$("#error_mod_mail_formato").slideUp("slow");

				return false;
			}else{
				$("#error_mod_mail").slideUp("slow");
				$("#valida_minimo_mod_mail").slideUp("slow");
				$("#valida_maximo_mod_mail").slideUp("slow");
				$("#error_mod_mail_formato").slideUp("slow");

				return true
			}
		}
	}
}	
/* Fin script para validar campo mod_mail - Formulario Modificar Usuario */
/* Script para validar formato mod_mail - Formulario Modificar Usuario */
function validar_modif_email2(){
	var mod_mail=$("#mod_mail").val();
	
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	
    if ( !expr.test(mod_mail) ){
    	$("#error_mod_mail_formato").slideDown();
    	$("#mod_mail").focus();
    	return false;
    }else {	
		$("#error_mod_mail_formato").slideUp();
		$("#error_mod_mail").slideUp("slow");
		$("#valida_minimo_mod_mail").slideUp("slow");
		$("#valida_maximo_mod_mail").slideUp("slow");

		return true;
	}
}
/* Script para validar formato mod_mail - Formulario Modificar Usuario */

/* Script para validar campo mod_dependencia - Formulario Modificar Usuario */
function validar_modif_dep(){			
	var mod_depe=$("#mod_nombre_dependencia").val();

	if(mod_depe==""){
		$("#error_mod_dependencia").slideDown("slow");
		$("#valida_minimo_mod_dependencia").slideUp("slow");
		$("#valida_maximo_mod_dependencia").slideUp("slow");
		$("#error_mod_dependencia_invalida").slideUp("slow");
		$("#error_mod_dependencia_inexistente").slideUp("slow");

		return false;					
	}else{
		if(mod_depe.length<6){
			$("#error_mod_dependencia").slideUp("slow");
			$("#valida_minimo_mod_dependencia").slideDown("slow");
			$("#valida_maximo_mod_dependencia").slideUp("slow");
			$("#error_mod_dependencia_invalida").slideUp("slow");
			$("#error_mod_dependencia_inexistente").slideUp("slow");

			return false;
		}else{
			if(mod_depe.length>50){
				$("#error_mod_dependencia").slideUp();
				$("#valida_minimo_mod_dependencia").slideUp("slow");
				$("#valida_maximo_mod_dependencia").slideDown("slow");
				$("#error_mod_dependencia_invalida").slideUp("slow");
				$("#error_mod_dependencia_inexistente").slideUp("slow");

				return false;
			}else{
				if($("#sugerencia_mod_dependencia").is(":visible")){
					$("#error_mod_dependencia").slideUp("slow");
					$("#valida_minimo_mod_dependencia").slideUp("slow");
					$("#valida_maximo_mod_dependencia").slideUp("slow");
					$("#error_mod_dependencia_invalida").slideDown("slow");
					$("#error_mod_dependencia_inexistente").slideUp("slow");

					return false;
				}else{
					if($("#error_mod_dependencia_inexistente").is(":visible")){
						$("#error_mod_dependencia").slideUp();
						$("#valida_minimo_mod_dependencia").slideUp("slow");
						$("#valida_maximo_mod_dependencia").slideUp("slow");
						$("#error_mod_dependencia_invalida").slideUp("slow");

						return false
					}else{
						$("#error_mod_dependencia").slideUp();
						$("#valida_minimo_mod_dependencia").slideUp("slow");
						$("#valida_maximo_mod_dependencia").slideUp("slow");
						$("#error_mod_dependencia_invalida").slideUp("slow");
						$("#error_mod_dependencia_inexistente").slideUp("slow");

						return true;
					}
				}		
			}
		}
	}			
}
/* Fin script para validar campo mod_dependencia - Formulario Modificar Usuario */
/* Funcion para validar mod_perfil para hacer submit */
function validar_mod_perfil(){
	if($("#error_mod_perfil").is(":visible")){
		return false;
	}else{
		if($("#error_mod_imagen_invalida").is(":visible")){
			return false;
		}else{
			$("#error_mod_imagen_invalida").slideUp("slow");
			return true;																													return true;
		}		
	}	
}
/* Fin funcion para validar mod_perfil para hacer submit */

/* Funcion para modificar Usuarios */
function validar_modificar_usuario(){
	var validar_mod_id = validar_mod_identificacion();
	
	if(validar_mod_id==false){
		$("#mod_identificacion").focus()
		return false;
	}else{
		var validar_mod_nombre_completo= validar_mod_nom_completo();
		if(validar_mod_nombre_completo==false){
			$("#mod_nombre_completo").focus();
			return false;
		}else{
			var validar_mod_login= validar_modif_login();
			if(validar_mod_login==false){
				$("#mod_login").focus();
				return false;
			}else{
				var validar_mod_email= validar_modif_email();
				if(validar_mod_email==false){
					$("#mod_mail").focus();
					return false;
				}else{
					var validar_formato_email=validar_modif_email2();
					if(validar_formato_email==false){
						$("#mod_mail").focus();
						return false;
					}else{
						var validar_modif_depe=validar_modif_dep();
						if(validar_modif_depe==false){
							$("#mod_nombre_dependencia").focus();
							return false;
						}else{
							var validar_modif_perfil=validar_mod_perfil();
							if(validar_modif_perfil==false){
								$("#mod_perfil").focus();
								return false
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

$(function submit_modificar_usuario(){
	$('#bModificarUsuario').click(function submit_modificar_usuario(){
		var submit_modificar_usuario = validar_modificar_usuario();
		if(submit_modificar_usuario==false){
			return false;
		}else{ // Realizar la modificacion de Usuario
			$('#formulario_modificar_usuario').submit(); // Realizar la modificacion del usuario
			$("#contenido").load("admin_usuarios/index_usuarios.php");		
		}										
	});
})
/* Funciones para guardar en base de datos auditoria de modificacion o creacion de usuarios */
function auditoria(tipo_formulario,login){
	switch(tipo_formulario){
		case'crear_usuario':
		var trans = "creado";
			break;
		case'modificar_usuario':
		var trans ="modificado";
			break;	
	}
	$.ajax({	// Guardo registro de ingreso al sistema para auditoria
		type: 'POST',
		url: '../login/transacciones.php',
		data: {
			'transaccion' : tipo_formulario,
			'creado' : 	login
		},			
		success: function(resp1){
			if(resp1=="true"){
				alert("El Usuario ha sido "+trans+" correctamente");
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
/* Fin funciones para guardar en base de datos auditoria de modificacion o creacion de usuarios */

/************************************************************************************************************/
/* Fin Modificar Usuarios ***********************************************************************************/
/************************************************************************************************************/

/************************************************************************************************************/
/* Inicio Modificar Contraseña ******************************************************************************/
/************************************************************************************************************/
function modificar_pass_usuario(){
	var id_usuario = $('#id_usuario').val();
	var pass1 = $('#pass1').val();
	var pass2 = $('#pass2').val();

	if(pass1.length<6){
		$('#valida_pass_vacio').slideDown("slow");
		$('#pass1').focus();
	}else{
		$('#valida_pass_vacio').slideUp("slow");
		if(pass1!=pass2){
			$('#valida_pass_confirmacion').slideDown("slow");
			$('#pass2').focus();
		}else{
			$('#valida_pass_confirmacion').slideUp("slow");

			$.ajax({
				url:'login/modifica_pass.php',
				type: 'POST',
				data: {
					'id_usuario':id_usuario,
					'pass':pass2 
				},
				success: function(resp){
					$.ajax({	// Guardo registro de ingreso al sistema para auditoria
						type: 'POST',
						url: 'login/transacciones.php',
						data: {
							'transaccion' : 'cambio_pass'	
						},			
						success: function(resp1){
							if(resp1=="true"){
								alert(resp)
								location.href='principal3.php';			
							}else{
								alert(resp1)
						//		break;
							}
						}
					})	
				}
			})	
		}
	}
}

/************************************************************************************************************/
/* Fin Modificar Contraseña *********************************************************************************/
/************************************************************************************************************/