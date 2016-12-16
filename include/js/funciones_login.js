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
			console.log(resp);
			if(resp==""){
				$('.errores').slideDown("slow");
			}else if(resp=="No pude conectarme con la base de datos, revisa las variables de conexión por favor."){
				alert(resp);
			}
			else{
				$('.errores').slideUp("slow");	
				alert(resp);
				//$('#general').fadeOut("slow");
				location.href='principal3.php';			
			}
			
		}
	})
}