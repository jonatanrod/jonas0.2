/* Javascript Login */

$(function main(){
	$("#user").focus();	
	
	function valida_entra(){
		 $("#user").keyup(function(e) {
	       if(e.which == 13) {
	          // Acciones a realizar, por ej: enviar formulario.
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
			//alert(resp);
			//console.log(resp);
			switch(resp){
				case "":
					$('#error_user').slideDown("fast");
					$('#error_inactivo').slideUp("slow");
					break;
				case "No pude conectarme con la base de datos, revisa las variables de conexión por favor.":	
					alert(resp);
					break;
				case "inactivo":
					$('#error_inactivo').slideDown("slow");
					$('#error_user').slideUp("slow");
					break;	
				default:
					$('#error_user').slideUp("slow");
					$('#error_inactivo').slideUp("slow");	
					//alert(resp);
					//$('#general').fadeOut("slow");
					$.ajax({
						type: 'POST',
						url: 'login/transacciones.php',
						data: {
							'transaccion' : 'login'	// Envio variable para que no salga "Para agregar usuario haga click aqui"
						},			
						success: function(resp1){
							alert(resp1);
							/*if(resp!=""){
								$('#sugerencias_nombre_completo').html(resp);
							}*/
						}
					})	
					//location.href='principal3.php';			
					break;	
			}	
		}
	})
}