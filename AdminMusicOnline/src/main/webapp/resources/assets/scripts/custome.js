 $(document).ready(function() {
	$("#loginajax").click(function(){
		
		$.ajax({
			url:"http://localhost:8082/musiconline/api/xlogin",
			type:"get",
			data:{
				gmail:"tu",
				pw:"1234"
			},
			success:function(value){
				alert(value);
			}
		})
	});
});