<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" />
<style type="text/css">
	
</style>	
<title>Send Gmail</title>
</head>
<body>
	<center>
		<form method="post" action="dosendgmail">
			<table border="0" width="80%">
				<tr>
					<td>To:</td>
					<td><input type="text" class="input_sendgmail"
						name="recipient" size="65" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="subject" size="65"
						value="Send PassWord" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="pass" type="hidden" name="message" /></td>
				</tr>

				<tr>
				<td></td>
					<td ><input type="submit" value="Send E-mail" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
<script src="<c:url value="/resources/jscustome/jquery-3.3.1.js"/> "
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.input_sendgmail').change(function() {
			var text_input = $(this).val();
			$.ajax({
				url:"/musiconline/api/sendGmail",
				type:"post",
				data:{
					text_input : text_input
					},
				success: function(value){
						if(value ==""){
								alert("Gmail not exists");
							}
						else{

							$('.pass').val(value);
							
							}
					}
				})
		});

	});
</script>
</html>