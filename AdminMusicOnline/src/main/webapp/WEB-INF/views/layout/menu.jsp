<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div class="navbar-header">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#main-menu" aria-controls="main-menu"
				aria-expanded="false" aria-label="Toggle navigation">
				<i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="./"><img
				src="<c:url value="/resources/images/logo.png"/> " alt="Logo"></a> <a
				class="navbar-brand hidden" href="./"><img
				src="<c:url value="/resources/images/logo2.png"/> "alt="Logo"></a>
		</div>
		<div id="main-menu"
			class="main-menu collapse navbar-collapse hienthind">
			<ul class="nav navbar-nav bonnd">
				<ul>
					<li class="hienlen"><a href="index.html"> <i
							class="menu-icon fa fa-dashboard"></i>Dashboard
					</a></li>
				</ul>
				<h3 class="menu-title">UI elements</h3>
				<!-- /.menu-title -->
				<li class="menu-item-has-children dropdown "><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-dashboard"></i> <a
							href="index.html"> Dashboard </a></li>
						<li><i class="fa fa-table"></i><a href="#">User-Data</a></li>
						<li><i class="fa fa-table"></i><a href="#">areas-Data</a></li>
						<li><i class="fa fa-table"></i><a href="#">artists-Data</a></li>
						<li><i class="fa fa-table"></i><a href="<c:url value="/admin/addnewsong"/> ">song-Data</a></li>
						<li><i class="fa fa-table"></i><a href="<c:url value="/admin/page-bill"/> ">Bill-Data</a></li>
						<li><i class="fa fa-table"></i><a href="#">song_of_user-Data</a></li>
						<li><i class="fa fa-table"></i><a href="#">Type-Data</a></li>
					</ul></li>

				<h3 class="menu-title">Extras</h3>
				<!-- /.menu-title -->
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-sign-in"></i><a
							href="<c:url value="/page-login"/> ">Login</a></li>
						<li><i class="menu-icon fa fa-sign-in"></i><a
							href="<c:url value="page-register.jsp"/> ">Register</a></li>
						<li><i class="menu-icon fa fa-paper-plane"></i><a
							href="<c:url value="pages-forget.jsp"/> ">Forget Pass</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>
<!-- /#left-panel -->