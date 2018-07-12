<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- home banner starts -->
<style>
.count_cart{
	position: absolute;
    z-index: 1;
    /* right: 41px; */
    top: 52%;
    border: 1px solid #fffff;
    border-radius: 45px;
    height: 45px;
    width: 45px;
    left: 8%;
    background-color: #148914;
}
#countSongsCart span{
line-height: 45px;
padding-left: 16px;
}
.homeinfo .player img.graphics {
   
    bottom: 200px;
 
}
</style>
<div id="home" class="homeinfo">
	<div class="row">
		<div class="col-sm-6 col-xs-12">
			<div class="fronttext">
				<h2 class="bgcolor  animated fadeInUpBig">
					<span class="glyphicon glyphicon-headphones"></span> MUSIC
				</h2>
				<br>
				<p class=" animated fadeInUp">There are other and natural causes
					tending toward a diminution of population, but nothing contributes
					so greatly to this end as the fact that no male or female Martian
					is ever voluntarily without a weapon of destruction.</p>
			</div>
		</div>

		<div class="col-sm-5 col-xs-12 col-sm-offset-1">
			<div class="player">
				<img src="<c:url value="/resources/images/music.png"/> "
					class="graphics hidden-xs  animated fadeInRightBig" alt="dj" />
				<!-- 		<iframe width="100%" height="170" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/66392700&amp;color=f2ab00&amp;theme_color=000000&amp;auto_play=true&amp;hide_related=true&amp;show_artwork=false"></iframe> -->

				<!-- LOgin -->
				<c:choose>
					<c:when test="${gmailLogin != null }">
			 				Welcome: ${gmailLogin }
			 				<button  id="logout-session">Logout</button>
					</c:when>
					<c:otherwise>
						<button id="click_login_button"
							onclick="document.getElementById('id01').style.display='block'"
							style="width: auto;">Listen my playlist</button>
						<button id="click_logout_button"
							onclick="document.getElementById('id02').style.display='block'"
							style="width: auto;">Register User</button>
					</c:otherwise>
				</c:choose>

				<%-- Welcome: ${pageContext.request.userPrincipal.name}  --%>
				<a href="/musiconline/page-cart"><img alt="cart" src="/musiconline/resources/album-art/cart.png" width="100px" height="100px"></a>
				<div id="countSongsCart">
				<%-- <c:if test="${countSongInCart > 0} ">
					<div id="idcart" class="count_cart"><span >${countSongInCart }</span></div>
				</c:if>
				<c:if test="${countSongInCart <= 0} ">
					<div id="idcart"><span >${countSongInCart }</span></div>
				</c:if> --%>
				<div id="idcart" ><span >${countSongInCart }</span></div>
				</div>
			</div>
		</div>
		<div id="id01" class="modal">
			<form class="modal-content animate" style="width: 50%;" action="">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="close" title="Close Modal">&times;</span>

				</div>

				<div class="container custome">
				<%-- <form name='loginForm' action="<c:url value='j_spring_security_login' />" method='POST'> --%>
					<label for="uname"><span class="glyphicon glyphicon-user"></span><strong>
							Username</strong></label> <input type="text" id="gmail"
						placeholder="Enter Username" name="uname" required> <label
						for="psw"><span class="glyphicon glyphicon-eye-open"><strong>
								Password</strong></label> <input type="password" id="passwordLogin"
						placeholder="Enter Password" name="pw" required> <br />
					<button id="loginajax" class="h40">
						<span class="glyphicon glyphicon-off"></span> Login
					</button>
					<!-- <input name="submit" type="submit" value="login" /> -->
					 <label> <input
						type="checkbox" checked="checked" name="remember">
						Remember me
					</label>
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<!-- </form> -->
				</div>

				<div class="container custome magrinbottom5"
					style="background-color: #f1f1f1;">

					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<span class="psw">Forgot <a href='<c:url value='/page-SendGmail' />' style="color: black">password?</a></span>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<div class="container custome" style="width: 50%">
				<button style="background-color: #2b2ad3">
					<a
						href="https://www.facebook.com/dialog/oauth?client_id=2548582088699596&redirect_uri=https://localhost:8082/musiconline/login-facebook">Login
						Facebook</a>
				</button>
				<button style="background-color: #ed203e">Login Gmail</button>

			</div>
		</div>




		<!-- LOgin -->

		<style type="text/css">
.modal2 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 99; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}
</style>

		<!-- Register -->
		<div id="id02" class="modal2">
			<form class="modal-content animate" style="width: 50%;" action="">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id02').style.display='none'"
						class="close" title="Close Modal">&times;</span>

				</div>

				<div class="container custome">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-user"></span> Username</label> <input
								type="text" class="form-control" id="username" name="loginusername"
								placeholder="Enter User name">
						</div>
						<div class="form-group">
							<label for="usrname"><span
								class="glyphicon glyphicon-envelope"></span> Gmail</label> <input
								type="email" class="form-control" id="email" name="loginemail"
								placeholder="Enter email">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> Password</label> <input
								type="password" class="form-control" id="psw" name="loginpsw"
								placeholder="Enter password">
						</div>

						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> Login
						</button>
					</form>
					<button style="background-color: #2b2ad3">
						<a
							href="https://www.facebook.com/dialog/oauth?client_id=2548582088699596&redirect_uri=https://localhost:8082/loginfb/login-facebook">Login
							Facebook</a>
					</button>
					<button style="background-color: #ed203e">Login Gmail</button>
				</div>
		</div>

		</form>


		<script>
			// Get the modal
			var modal = document.getElementById('id01');
			var modal2 = document.getElementById('id02');
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
				if (event.target == modal2) {
					modal2.style.display = "none";
				}
			}
		</script>

		<!-- Register -->



	</div>
</div>
<!-- home banner ends -->