/* Javascript Login */

$(function main(){
	$("#user").focus();	
	
	function valida_entra(){
		 $("#user").keyup(function(e) {
	       if(e.which == 13) {
	          entra();
	       }
	    }); 
	}
})
function upper_user(){
	var str = $('#user').val();	
	str = str.replace(' ','');
	$('#user').val(str.toUpperCase());
}
function entra(){
	var user = $("#user").val();
	var passd= $("#pass").val();

	$.ajax({
		type: 'POST',
		url: 'login/index.php',
		data: {
			'user_j' : user,
			'passd_j' : passd
		},			
		success: function(resp){
//			alert("m"+resp+'p')
//			console.log(resp);
			switch(resp){ // Valida la respuesta de login/index.php
				case "No pude conectarme con la base de datos 1, revisa las variables de conexión por favor.":	
					alert(resp);
					break;
				case "false":
					alert("No pude conectarme a la tabla U de la base de datos 1, revisa la base de datos por favor");// Quiere decir que la tabla de usuarios no se ha creado.
					break;	
				case "":
					$('#error_user').slideDown("fast");
					$('#error_inactivo').slideUp("slow");
					break;
				case "inactivo":
					$('#error_inactivo').slideDown("slow");
					$('#error_user').slideUp("slow");
					break;	
				default:       // Ingresa de manera correcta
					$('#error_user').slideUp("slow");
					$('#error_inactivo').slideUp("slow");	
		
					$.ajax({	// Guardo registro de ingreso al sistema para auditoria
						type: 'POST',
						url: 'login/transacciones.php',
						data: {
							'transaccion' : 'login'	
						},			
						success: function(resp1){
							if(resp1=="true"){
								location.href='principal3.php';			
							}else{
								alert(resp1)
							}
						}
					})	
					break;	
			}	
		}
	})
}