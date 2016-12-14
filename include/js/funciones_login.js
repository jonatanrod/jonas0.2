/* Javascript Login */

$(function main(){
	$("#user").focus();
	
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
			}else{
				$('.errores').slideUp("slow");	
				$('#general').fadeOut("slow");
				location.href='principal3.php';			
			}
			
		}
	})
}