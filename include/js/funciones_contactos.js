/**/
if (history.forward(1)) {
	location.replace(history.forward(1));
}
/* Script para ventana modal - Tecla Esc */
    window.addEventListener("keyup", function(event){
        var codigo = event.keyCode || event.which;
        if (codigo == 27){
            cerrarVentanaAgregarContacto();
            cerrar_ventana_modifica_remitente()
        }
    }, false);
/* Fin script para ventana modal - Tecla Esc */
/* Funcion para buscar remitente desde formulario principal */

/*Script para buscador contactos*/
$(function buscador_remitente(){
	$('#search_remitente').focus();

	$('#search_remitente').keyup(function buscador_remitente(){
		var envio2 = $('#search_remitente').val();

		$('#logo').html('<h2>Radicación de Entrada</h2>');
		$('#resultados').html('<img src="imagenes/loading.gif" alt="" />');

		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php' ,
			data: (
				'search_remitente='+envio2+'&permiso_agregar_usuarios=SI'
			),
			success: function(resp){
				if(resp!=""){
					$('#sugerencias_remitente').html(resp);
				}
			}
		})
	})
/* Funcion para remitente desde nombre completo Formulario Agregar Nuevo Contacto */
	$('#nombre_contacto').keyup(function buscador_remitente(){
		var nombre_contacto = $('#nombre_contacto').val();
		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: (
				'nombre_contacto='+nombre_contacto+'&permiso_agregar_usuarios=SI'
			),
		
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_nombre_contacto').html(resp);
				}
			}
		})
	})
/*Funcion para remitente desde nit contacto*/
	$('#nit_contacto').keyup(function buscador_remitente(){
		var nit_contacto = $('#nit_contacto').val();
		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: ('search_nit='+nit_contacto+'&permiso_agregar_usuarios=SI'),

			success: function(resp){
				if(resp!=""){
					$('#sugerencia_nit_contacto').html(resp);
				}
			}
		})
	})
/*Funcion para ubicacion desde ubicacion_contacto*/
	$('#ubicacion_contacto').keyup(function buscador_remitente(){
		var search_muni = $('#ubicacion_contacto').val();

		$('#sugerencia_ubicacion').slideDown("slow");

		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: ('search_muni='+search_muni+'&desde_formulario=1'),//cambiar desde_formulario por "permiso_agregar_usuarios=SI"
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_ubicacion').html(resp);
				}
			}
		})
	})

/*Funciones para el formulario de modificar datos de remitente*/
	$('#nombre_contacto_mod').keyup(function buscador_remitente(){
		var nombre_contacto_mod = $('#nombre_contacto_mod').val();

		$('#sugerencia_nombre_contacto_mod').slideDown("slow");

		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: ('search_remitente='+nombre_contacto_mod+'&permiso_agregar_usuarios=SI'),
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_nombre_contacto_mod').html(resp);
				}
			}
		})
	})
/*Funcion para remitente desde nit contacto_mod*/
	$('#nit_contacto_mod').keyup(function buscador_remitente(){
		var nit_contacto_mod = $('#nit_contacto_mod').val();
		$("#error_nit_contacto_mod").slideUp("slow");

		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: ('search_remitente='+nit_contacto_mod+'&permiso_agregar_usuarios=SI'),			
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_nit_contacto_mod').html(resp);
				}
			}
		})
	})
/*Funcion para ubicacion desde ubicacion_contacto_mod*/
	$('#ubicacion_contacto_mod').keyup(function buscador_remitente(){
		var search_muni_mod = $('#ubicacion_contacto_mod').val();

		$('#sugerencia_ubicacion_mod').slideDown("slow");

		$.ajax({
			type: 'POST',
			url:  'radicacion_entrada/buscador_remitente.php',
			data: ('search_muni_mod='+search_muni_mod+'&permiso_agregar_usuarios=SI'),
			success: function(resp){
				if(resp!=""){
					$('#sugerencia_ubicacion_mod').html(resp);
				}
			}
		})
	})

})
/* Fin script para buscador contactos */

/* Funciones para desplegar ventana modal contacto */
function abrir_ventana_agregar_contacto(){
	$("#ventana_modificar_remitente").slideUp("slow");
	$("#ventana_agregar_contacto").slideDown("slow");
	$('#nombre_contacto').focus();
}
function cerrarVentanaAgregarContacto(){
	$("#ventana_agregar_contacto").slideUp("slow");
	$("#contenido").load("radicacion_entrada/index_entrada.php");
}
function abrir_ventana_modifica_remitente(){
	$("#ventana_modificar_remitente").slideDown("slow");
}
function cerrar_ventana_modifica_remitente(){
	$("#ventana_modificar_remitente").slideUp("slow");
}

/*Fin funciones para desplegar ventana modal contacto*/
/*Funciones para cargar datos en formulario nuevo contacto*/
function cargar_formulario_radicacion_entrada(nombre_contacto,nit_contacto,ubicacion_contacto,direccion_contacto,telefono_contacto,mail_contacto,representante_legal,codigo_contacto)
{
	$('#contenido').load('radicacion_entrada/entrada.php',{var1:nombre_contacto, var2:nit_contacto, var3:ubicacion_contacto, var4:direccion_contacto, var5:telefono_contacto, var6:mail_contacto, var7:representante_legal, var8:codigo_contacto})
}
function cargar_valor_municipio(nombre_municipio,nombre_departamento,nombre_pais,nombre_continente){
	$('#ubicacion_contacto').val(nombre_municipio+'('+nombre_departamento+') '+nombre_pais+'-'+nombre_continente)
	$('#sugerencia_ubicacion').slideUp("slow");
	$('#error_ubicacion_contacto').slideUp("slow");
	$('#error_no_selecciona_ubicacion').slideUp("slow");
	$('#direccion_contacto').focus();
}
function cargar_valor_municipio_mod(nombre_municipio_mod,nombre_departamento_mod,nombre_pais_mod,nombre_continente_mod){
	$('#ubicacion_contacto_mod').val(nombre_municipio_mod+'('+nombre_departamento_mod+') '+nombre_pais_mod+'-'+nombre_continente_mod)
	$('#sugerencia_ubicacion_mod').slideUp("slow");
	$('#error_ubicacion_contacto_mod').slideUp("slow");
}
/*Carga el administrador de municipios*/
function carga_administrador_municipios() {
	$("#contenido").load("admin_muni/index_municipios.php");
	
	$('.menu_superior').animate({
			left:'-100%'
	});
};
/*Fin carga el administrador de municipios*/
/*Funciones para dejar input en mayusculas y eliminar los espacios*/
function espacios_nombre(){
	var str = $('#nombre_contacto').val();
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
	str = str.replace('ñ','N');
	str = str.replace('Ñ','N');
	str = str.replace('á','A');
	str = str.replace('é','E');
	str = str.replace('í','I');
	str = str.replace('ó','O');
	str = str.replace('ú','U');
	str = str.replace('Á','A');
	str = str.replace('É','E');
	str = str.replace('Í','I');
	str = str.replace('Ó','O');
	str = str.replace('Ú','U');
	str = str.replace('<','');
	str = str.replace('>','');
	str = str.replace('  ','');

	$('#nombre_contacto').val(str.toUpperCase());
}
function espacios_nit(){
	var str = $('#nit_contacto').val();
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
	str = str.replace('ñ','N');
	str = str.replace('Ñ','N');
	str = str.replace('á','A');
	str = str.replace('é','E');
	str = str.replace('í','I');
	str = str.replace('ó','O');
	str = str.replace('ú','U');
	str = str.replace('Á','A');
	str = str.replace('É','E');
	str = str.replace('Í','I');
	str = str.replace('Ó','O');
	str = str.replace('Ú','U');
	str = str.replace('<','');
	str = str.replace('>','');
	str = str.replace('  ','');

	$('#nit_contacto').val(str.toUpperCase());
}
function espacios_direccion(){
	var str = $('#direccion_contacto').val();
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
	str = str.replace('ñ','N');
	str = str.replace('Ñ','N');
	str = str.replace('á','A');
	str = str.replace('é','E');
	str = str.replace('í','I');
	str = str.replace('ó','O');
	str = str.replace('ú','U');
	str = str.replace('Á','A');
	str = str.replace('É','E');
	str = str.replace('Í','I');
	str = str.replace('Ó','O');
	str = str.replace('Ú','U');
	str = str.replace('<','');
	str = str.replace('>','');
	str = str.replace('CRA','CARRERA');
	str = str.replace('CR','CARRERA');
	str = str.replace('KRA','CARRERA');
	str = str.replace('KR','CARRERA');
	str = str.replace('CLL','CALLE');
	str = str.replace('CL','CALLE');
	str = str.replace('DG','DIAGONAL');
	str = str.replace('TV','TRANSVERSAL');

	$('#direccion_contacto').val(str.toUpperCase());
}
function espacios_nit_mod(){//Falta por modificar
	var str = $('#nit_contacto_mod').val();
	str = str.replace('-','',str);
	str = str.replace('°','',str);
	str = str.replace('#','',str);
	str = str.replace("'","",str);	
	str = str.replace("|","",str);
	str = str.replace("/","",str);
	str = str.replace("*","",str);	
	str = str.replace(',','',str);
	str = str.replace(/\s/g, '');

	$('#nit_contacto_mod').val(str.toUpperCase());
}
function espacios_direccion_mod(){ // Falta por modificar
	var str = $('#direccion_contacto').val();
	str = str.replace('-','',str);
	str = str.replace('°','',str);
	str = str.replace('#','',str);
	str = str.replace("'","",str);
	str = str.replace("/","",str);
	str = str.replace("*","",str);
	str = str.replace('|','',str);	
	str = str.replace(',','',str);
	
	$('#direccion_contacto').val(str.toUpperCase());
}
/*Fin funciones para dejar input en mayusculas y eliminar los espacios*/
/*Fin funciones para cargar datos en formulario nuevo contacto*/

/*Funcion para volver atras en radicacion entrada*/
function atras(){
	$('#contenido').load('radicacion_entrada/index_entrada.php')
}
/*Fin funcion para volver atras en radicacion entrada*/

/*Script para buscador de municipios en Formulario Agregar Contacto*/
$(function buscador_municipios_para_contacto(){
	$('#ubicacion_contacto').submit(function buscador_municipios_para_contacto(h){
		h.preventDefault();
	})
	$('#ubicacion_contacto').keyup(function buscador_municipios_para_contacto(){
		var envio = $('#ubicacion_contacto').val();
		$('#logo').html('<h2>Buscador de Municipios</h2>');
		//$('#resultados').html('<h2><img src="/imagenes/loading.gif" alt="" /></h2>');
		//$('#contenido').load('radicacion_entrada/entrada.php',{var1:nombre_contacto, var2:nit_contacto, var3:ubicacion_contacto, var4:direccion_contacto, var5:telefono_contacto, var6:mail_contacto, var7:representante_legal, var8:codigo_contacto})

		$.ajax({
			type: 'POST',
			url: 'admin_muni/buscador_municipios.php',
			data: {
				'search' : envio,
				'formulario_nuevo_contacto' : '1'
			},
				success: function(resp){
				if(resp!=""){
					$('#resultado').html(resp);
				}
			}
		})
	})
})
/*Fin script para buscador de municipios en Formulario Agregar Contacto*/

/* Funcion para Grabar Usuarios */
function validar_grabar_contacto(){
	return true;
}	
$(function submit_grabar_contacto(){
	$('#grabar_contacto').click(function submit_grabar_contacto(){
		var submit_grabar_contacto = validar_grabar_contacto();
		if(submit_grabar_contacto==false){
			return false;
		}else if(submit_grabar_contacto==true){ // Realizar la creación de Contacto
				
			$.ajax({
				url:'radicacion_entrada/query_contactos.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					alert("envía el formulario")
					//$('#form_datos_contacto').submit(); // Realizar la creación del contacto
					//$("#contenido").load("admin_usuarios/index_usuarios.php");	
				}
			})
		}else{
			alert("No se puede modificar el usuario. Intente nuevamente")
		}										
	});
})
/* Fin funcion para Grabar Usuarios */












function enviar_modificacion_contacto(){
	$("#enviar_modificacion_contacto").click(function enviar_modificacion_contacto(){
		var nombre_contacto = $('#nombre_contacto').val()
		var nit_contacto = $('#nit_contacto').val()
		var ubicacion_contacto =$('#ubicacion_contacto').val()
		var direccion_contacto =$('#direccion_contacto').val()
		var email=$('#email_contacto').val()

		if(nombre_contacto== ""){
			$("#error_nombre_contacto").slideDown("slow");
			return false;
		}else{
			$("#error_nombre_contacto").slideUp("slow");
			if(nit_contacto==""){
				$("#error_nit_contacto").slideDown("slow");
				return false;
			}else{
				$("#error_nit_contacto").slideUp("slow");
				if(ubicacion_contacto==""){
					$('#error_ubicacion_contacto').slideDown("slow");
						
					//Aqui debo corregir el comportamiento
					// de la validación geográfica del contacto. Siempre tiene un valor, 
					//entonces hay que definir un comportamiento particular
					
				}else{
					if(direccion_contacto==""){
						$("#error_direccion_contacto").slideDown("slow");
						return false;
					}else{
						$("#error_direccion_contacto").slideUp("slow");
						if(email==""){
							$("#error_email_contacto").slideDown("slow");
							return false;
						}else{
							$("#error_email_contacto").slideUp("slow");
						}
					}

					buscador_municipios_para_contacto();
					$('#error_ubicacion_contacto').slideUp("slow");
					
				}
			}
		} 
	})
}
/*Fin script para buscador de municipios en Formulario Agregar Contacto*/






/* Funcion para modificar Usuarios */
function validar_modificar_usuario(){
	var mod_identificacion =$('#mod_identificacion').val();
	var validar_mod_id = validar_mod_identificacion(mod_identificacion);
	var mod_nombre_completo=$("#mod_nombre_completo").val();
	var validar_mod_nombre_completo= validar_mod_nom_completo(mod_nombre_completo);
	var mod_login=$("#mod_login").val();
	var validar_mod_login= validar_modif_login(mod_login);
	var mod_mail=$("#mod_mail").val();
	var validar_mod_email= validar_modif_email(mod_mail);
	var mod_depe=$("#mod_nombre_dependencia").val();
	var validar_modif_depe=validar_modif_dep(mod_depe);

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
				if(validar_mod_email==false){
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
						}else{
							return true;
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
		}else if(submit_modificar_usuario==true){ // Realizar la creación de Usuario
				
			$.ajax({
				url:'admin_usuarios/query_usuarios.php',
				type: 'POST',
				data: 'data',
				success: function(resp){
					alert("envía el formulario")
					//$('#formulario_modificar_usuario').submit(); // Realizar la creación del usuario
					//$("#contenido").load("admin_usuarios/index_usuarios.php");	
				}
			})
		}else{
			alert("No se puede modificar el usuario. Intente nuevamente")
		}										
	});
})
/* Fin funcion para modificar Usuarios */