/* Javascript Login */

$(function main(){
	$("#user").focus();
	
})

function upper_user(){
	var str = $('#user').val();	
	str = str.replace(' ','');
	$('#user').val(str.toUpperCase());
}