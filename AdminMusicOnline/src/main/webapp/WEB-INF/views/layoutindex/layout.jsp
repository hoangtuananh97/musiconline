<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Nghe nhac truc tuyen</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap/css/bootstrap.css"/> " />
<!-- boostrap -->

<link rel="stylesheet" href="<c:url value="/resources/animate.css"/> ">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">

<%--  <script type="text/javascript" src="<c:url value="/resources/resources/js/foundation.min.js"/> "></script>

    <!-- Include Amplitude JS -->
    <script type="text/javascript" src="<c:url value="/resources/scripts/amplitude.js"/> "></script> --%>

<!--
      Include UX functions JS

      NOTE: These are for handling things outside of the scope of AmplitudeJS
    -->
<script type="text/javascript"
	src="<c:url value="/resources/scripts/functions.js"/> "></script>

<!-- Include Style Sheet -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/styleLogin.css"/> ">

<link rel="stylesheet" href="<c:url value="/resources/style.css"/> ">
<link rel="stylesheet" href="<c:url value="/resources/stylePlay.css"/> ">



<title><tiles:getAsString name="title" /></title>
</head>
<body>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=249078091804020&version=v2.0";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<!-- background slider -->
	<div id="myCarousel" class="carousel slide hidden-xs">
		<div class="carousel-inner">
			<div class="active item">
				<img src="<c:url value="/resources/images/back1.jpg"/> " alt="" />
			</div>
			<div class="item">
				<img src="<c:url value="/resources/images/back2.jpg"/> " alt="" />
			</div>
			<div class="item">
				<img src="<c:url value="/resources/images/back3.jpg"/> " alt="" />
			</div>
		</div>
	</div>
	<!-- background slider -->
	<!-- Header Starts -->
	<div class="navbar-wrapper ">
		<tiles:insertAttribute name="header" />

	</div>
	<!-- Header Starts -->
	<!-- overlay -->
	<div class="container overlay">
		<tiles:insertAttribute name="homebanner" />


		<div class="blockblack">
			<tiles:insertAttribute name="about" />

			<tiles:insertAttribute name="playlist" />

			<tiles:insertAttribute name="album" />
			<tiles:insertAttribute name="event" />
			<tiles:insertAttribute name="contact" />
		</div>
	</div>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/resources/js/jquery.js"/> "></script>
	<!-- boostrap -->
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.js"/> "
		type="text/javascript"></script>
	<%--   <script src="<c:url value="/resources/custome.js"/> " type="text/javascript"></script> --%>
	<script src="<c:url value="/resources/scripts/plugins.js"/> "
		type="text/javascript"></script>
	<script src="<c:url value="/resources/scripts/script.js"/> "
		type="text/javascript"></script>
		<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
	

	
	<%--  <script src="<c:url value="/resources/jscustome/jquery-3.3.1.js"/> " type="text/javascript"></script> --%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginajax").click(function(event) {
				event.preventDefault();
				gmail = $("#gmail").val();
				password = $("#passwordLogin").val();
				$.ajax({
					url : "http://localhost:8082/musiconline/api/xlogin",
					type : "get",
					data : {
						gmail : gmail,
						password : password
					},
					success : function(value) {
						if (value == "true") {

							location.reload();
							
						} else if(value =="false") {
							$('#click_logout_button').click();
							
						}

					}
				})
			});

			$('#logout-session').click(function() {

				$.ajax({
					url : "/musiconline/api/xlogout",
					type : "get",
					success : function(value) {
						if (value == "true") {
							location.reload();
						}
					}
				})
			});
			$('#delete-user-song').click(function() {
				var idSong = $('.audio').find('.music').attr('data-id');
				var idUser = $('#sessionIdUser').attr('data-idUser');

				$.ajax({
					url : "/musiconline/api/deleteSongOfUser",
					type : "post",
					data : {
						idSong : idSong,
						idUser : idUser
					},
					success : function(value) {
						if (value == "delete") {
							alert("delete");
							location.reload();
						} else if (value == "deleteError") {
							alert("delete Error");
						} else if (value == "usernull") {
							alert("You must login");
						}
					}
				});
			});

			$('.play-list').find('a').click(function() {
				var id_song = $(this).attr('data-id');
				$.ajax({
					url : "/musiconline/api/updateCountListen",
					type : "post",
					data : {
						id_song : id_song
					},
					success : function(value) {

					}
				})

			})

			
				
			
		});
	</script>
</body>
</html>