<%@page import="com.java.musiconline.entities.Songs"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="breadcrumbs">
	<div class="col-sm-4">
		<div class="page-header float-left">
			<div class="page-title">
				<h1>Dashboard</h1>
			</div>
		</div>
	</div>
	<div class="col-sm-8">
		<div class="page-header float-right">
			<div class="page-title">
				<ol class="breadcrumb text-right">
					<li class="active">Dashboard</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="content mt-3 noidung">
	<ul>
		<li class="hienlen">
			<div class="ndchitiet">
				<div class="col-sm-12">
					<div class="alert  alert-success alert-dismissible fade show"
						role="alert">
						<span class="badge badge-pill badge-success">Success</span> You
						successfully read this important alert message.
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
				<div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-flat-color-1">
						<div class="card-body pb-0">
							<div class="dropdown float-right">
								<button
									class="btn bg-transparent dropdown-toggle theme-toggle text-light"
									type="button" id="dropdownMenuButton" data-toggle="dropdown">
									<i class="fa fa-cog"></i>
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<div class="dropdown-menu-content">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
							</div>
							<h4 class="mb-0">
								<span class="count">10468</span>
							</h4>
							<p class="text-light">Members online</p>
							<div class="chart-wrapper px-0" style="height: 70px;" height="70">
								<canvas id="widgetChart1"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!--/.col-->
				<div class="col-lg-3 col-md-6">
					<div class="social-box facebook">
						<i class="fa fa-facebook"></i>
						<div class="stylecustom">
							<strong><span class="count">40</span> k</strong> <span>friends</span>
							<strong><span class="count">450</span></strong> <span>feeds</span>
						</div>
					</div>
					<!--/social-box-->
				</div>
				<!--/.col-->
				<div class="col-lg-3 col-md-6">
					<div class="social-box google-plus">
						<i class="fa fa-google-plus"></i> <strong><span
							class="count">94</span> k</strong> <span>followers</span> <strong><span
							class="count">92</span></strong> <span>circles</span>
					</div>
					<!--/social-box-->
				</div>
				<!--/.col-->
				<div class="col-xl-6">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-4">
									<h4 class="card-title mb-0">Line</h4>
									<div class="small text-muted">2018</div>
								</div>
								<!--/.col-->
							</div>
							<!--/.row-->
							<div class="chart-wrapper mt-4">
								<canvas id="myChart" style="height: 200px;" height="200"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6">
					<section class="card">
						<div class="twt-feed blue-bg">
							<div class="corner-ribon ">
								<i class="fa fa-twitter"></i>
							</div>
							<div class="fa fa-facebook wtt-mark"></div>
							<div class="media">
								<a href="#"> <img
									class="align-self-center rounded-circle mr-3"
									style="width: 85px; height: 85px;" alt=""
									src="<c:url value="/resources/images/admin.jpg"/> ">
								</a>
								<div class="media-body">
									<h2 class="text-white display-6">TA</h2>
									<p class="text-light">Project Manager</p>
								</div>
							</div>
						</div>
						<div class="weather-category twt-category">
							<ul>
								<li class="active">
									<h5>750</h5> Facebook
								</li>
								<li>
									<h5>865</h5> Following
								</li>
								<li>
									<h5>3645</h5> Followers
								</li>
							</ul>
						</div>
						<div class="twt-write col-sm-12">
							<textarea placeholder="Write your Facebook and Enter" rows="1"
								class="form-control t-text-area"></textarea>
						</div>
						<footer class="twt-footer">
							<a href="#"><i class="fa fa-camera"></i></a> <a href="#"><i
								class="fa fa-map-marker"></i></a> Ha noi, Viet Nam <span
								class="pull-right"> 21 </span>
						</footer>
					</section>
				</div>
				<div class="col-xl-3 col-lg-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-one">
								<div class="stat-icon dib">
									<i class="ti-money text-success border-success"></i>
								</div>
								<div class="stat-content dib">
									<div class="stat-text">Total Profit</div>
									<div class="stat-digit">1,012</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-one">
								<div class="stat-icon dib">
									<i class="ti-user text-primary border-primary"></i>
								</div>
								<div class="stat-content dib">
									<div class="stat-text">New Customer</div>
									<div class="stat-digit">961</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6">
					<div class="card">
						<div class="card-body">
							<div class="stat-widget-one">
								<div class="stat-icon dib">
									<i class="ti-layout-grid2 text-warning border-warning"></i>
								</div>
								<div class="stat-content dib">
									<div class="stat-text">Active Projects</div>
									<div class="stat-digit">770</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
		<li class="col-md-10">

			<div class="animated fadeIn">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">User Table</strong>
							</div>
							<div class="card-body">
								<table id="table_user" class="display">
									<thead>
										<tr>
											<th>ID</th>
											<th>User Name</th>
											<th>Email</th>
											<th>Password</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>$320,800</td>

										</tr>
										<tr>
											<td>aaaa Nixon</td>
											<td>aaaa Architect</td>
											<td>aaa</td>
											<td>$320,800</td>


										</tr>
										<tr>
											<td>bbbb Nixon</td>
											<td>bbb Architect</td>
											<td>Edinbbbburgh</td>
											<td>$320,800</td>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Edit -->
				<div class="row col-sm-12">
					<div id="idform" class="formHide">
						<h2>
							<strong style="text-align: center;">Edit</strong>
						</h2>
						<form action="" method="">
							<div class="form-group">
								<label for="email">User Name:</label> <input type="text"
									class="form-control" id="username" placeholder="Enter username"
									name="username"> <label for="email">Email:</label> <input
									type="email" class="form-control" id="email"
									placeholder="Enter email" name="email">
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" placeholder="Enter password"
									name="pwd">
							</div>
							<div class="form-group form-check"></div>
							<button type="submit" " class="btn btn-success btn-submit">Add
								New</button>
							<button type="submit" class="btn btn-success btn-submit">Edit</button>
							<button type="submit" class="btn btn-success btn-submit">Save</button>
							<button type="submit" class="btn btn-success btn-submit">Delete</button>
						</form>
					</div>
					<!-- .animated -->
				</div>
			</div>
		</li>
		<li class="col-md-10">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Areas Table</strong>
							</div>
							<div class="card-body">
								<table id="table_areas" class="display">
									<thead>
										<tr>
											<th>ID</th>
											<th>Areas Name</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>

										</tr>
										<tr>
											<td>aaaa Nixon</td>
											<td>aaaa Architect</td>



										</tr>
										<tr>
											<td>bbbb Nixon</td>
											<td>bbb Architect</td>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- Edit -->
				<div class="row col-sm-12">
					<div id="idform" class="formHide">
						<h2>
							<strong style="text-align: center;">Edit</strong>
						</h2>
						<form action="" method="">
							<div class="form-group">
								<label for="email">Id: </label> <input type="text"
									class="form-control" id="idAreas" placeholder="Enter idAreas"
									name="idAreas">
							</div>
							<div class="form-group">
								<label for="email">Areas Name:</label> <input type="text"
									class="form-control" id="nameAreas"
									placeholder="Enter nameAreas" name="nameAreas">
							</div>

							<div class="form-group form-check"></div>
							<button type="submit" " class="btn btn-success btn-submit">Add
								New</button>
							<button type="submit" class="btn btn-success btn-submit">Edit</button>
							<button type="submit" class="btn btn-success btn-submit">Save</button>
							<button type="submit" class="btn btn-success btn-submit">Delete</button>
						</form>
					</div>
					<!-- .animated -->
				</div>
			</div>
		</li>
		<li class="col-md-10">
			<div class="ndchitiet">
				<div class="animated fadeIn">
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-header">
									<strong class="card-title">Arists Table</strong>
								</div>
								<div class="card-body">
									<table id="table_arists" class="display">
										<thead>
											<tr>
												<th>ID</th>
												<th>User Name</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Tiger Nixon</td>
												<td>System Architect</td>

											</tr>
											<tr>
												<td>aaaa Nixon</td>
												<td>aaaa Architect</td>

											</tr>
											<tr>
												<td>bbbb Nixon</td>
												<td>bbb Architect</td>

											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row col-sm-12">
						<div id="idform" class="formHide">
							<h2>
								<strong style="text-align: center;">Add / Edit</strong>
							</h2>
							<form action="" method="">
								<div class="form-group">
									<label>Id: </label> <input type="text" class="form-control"
										id="idArists" placeholder="Enter idArists" name="idAArists">
								</div>
								<div class="form-group">
									<label>Arists Name:</label> <input type="text"
										class="form-control" id="nameArists"
										placeholder="Enter nameArists" name="nameArists">
								</div>

								<div class="form-group form-check"></div>
								<button type="submit" " class="btn btn-success btn-submit">Add
									New</button>
								<button type="submit" class="btn btn-success btn-submit">Edit</button>
								<button type="submit" class="btn btn-success btn-submit">Save</button>
								<button type="submit" class="btn btn-success btn-submit">Delete</button>
							</form>
						</div>
						<!-- .animated -->
					</div>
				</div>
				<!-- .animated -->
			</div>
		</li>
		<%--  <li class="col-md-10">

			<div class="animated fadeIn">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Song Table</strong>
							</div>
							<div class="card-body">
								<table id="table_song" class="display">
									<thead>
										<tr>
											<th>ID Song</th>
											<th>Name Song</th>
											<th>Url</th>

											<th>Areas</th>
											<th>Artist</th>
											<th>Type</th>
											<th>Author</th>
											<th>Picture</th>
											<th>Date Update</th>
											<th>Count Listen</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listSong }" var="listS">

											<tr>
												<a href="detailSong">
													<td>${listS.getIdSong() }</td>
													<td>${listS.getName() }</td>
													<td>${listS.getUrl() }</td>
													<td>${listS.getAreas().getNameArea() }</td>
													<td>${listS.getArtists().getNameArtis() }</td>
													<td>${listS.getTypes().getNameType() }</td>

													<td>${listS.getAuthor() }</td>

													<td><img
														src="<c:url value="/resources/imgsong/${listS.getCoverArtUrl()}"/>"
														height="100px" width="100px" alt="Logo"></td>


													<td><fmt:formatDate value="${listS.getDateUpdate() }"
															pattern="dd-MM-yyyy" /></td>

													<td>${listS.getCountListen() }</td>
												</a>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row col-sm-12">
						<div id="idform" class="formHide">
							<h2>
								<strong style="text-align: center;">Add / Edit</strong>
							</h2>
							<form action="" id="formAddSong">
								<div class="form-group">
									<label>ID Song: </label> <input type="text" readonly="true"
										class="form-control" id="idSong" name="idSong">
								</div>
								<div class="form-group">
									<label> Song:</label> <input type="text" class="form-control"
										id="nameSong" placeholder="Enter nameSong" name="nameSong">
								</div>
								<div class="form-group">
									<label> Url:</label> <input type="text" class="form-control"
										id="urlSong" placeholder="Enter urlSong" name="urlSong">
									<!--  <audio id="audio_song" controls="controls">
                                        </audio> -->

									<input type="file" class="form-control" id="selectUrlSong"
										placeholder="Enter selectUrlSong" name="selectUrlSong">

								</div>
								<div class="form-group">
									<label> Artist:</label> <input type="text" class="form-control"
										id="song_Artist" placeholder="Enter song_Artist"
										name="song_Artist">
								</div>
								<div class="form-group">
									<label> Areas:</label> <input type="text" class="form-control"
										id="song_Areas" placeholder="Enter song_Areas"
										name="song_Areas">
								</div>
								<div class="form-group">
									<label> Type:</label> <input type="text" class="form-control"
										id="song_Type" placeholder="Enter song_Type" name="song_Type">
								</div>
								<div class="form-group">
									<label> Author:</label> <input type="text" class="form-control"
										id="song_Author" placeholder="Enter song_Author"
										name="song_Author">
								</div>
								<div class="form-group">
									<label> Picture:</label> <input type="text"
										class="form-control" id="song_Picture"
										placeholder="Enter song_Picture" name="song_Picture">
									<div id="song_Picture_img"></div>
									<input type="file" class="form-control"
										id="select_Song_Picture"
										placeholder="Enter select_Song_Picture"
										name="select_Song_Picture">
								</div>
								<div class="form-group">
									<label> Date Update:</label> <input type="text"
										class="form-control" id="song_Date_Update"
										placeholder="Enter song_Date_Update" name="song_Date_Update">
								</div>
								<div class="form-group">
									<label> Count Liste:</label> <input type="text"
										class="form-control" id="song_Count_Liste"
										placeholder="Enter song_Count_Liste" name="song_Count_Liste">
								</div>

								<div class="form-group form-check"></div>
								<button id="clearInput" class="btn btn-success btn-submit">Clear
									Input</button>
								<button class="btn btn-success btn-submit" id="btn-addNew">Add
									New</button>
							</form>

						</div>
						<!-- .animated -->
					</div>
				</div>
				<!-- .animated -->
			</div>
		</li> --%>
		<li class="col-md-10">

			<div class="animated fadeIn">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Song User Table</strong>
							</div>
							<div class="card-body">
								<table id="table_song_of_user" class="display">
									<thead>
										<tr>
											<th>User</th>
											<th>Song</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>

										</tr>
										<tr>
											<td>aaaa Nixon</td>
											<td>aaaa Architect</td>

										</tr>
										<tr>
											<td>bbbb Nixon</td>
											<td>bbb Architect</td>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row col-sm-12">
						<div id="idform" class="formHide">
							<h2>
								<strong style="text-align: center;">Add / Edit</strong>
							</h2>
							<form action="" method="">
								<div class="form-group">
									<label> User: </label> <input type="text" class="form-control"
										id="idUser_table_song_of_user"
										placeholder="Enter idUser_table_song_of_user"
										name="idUser_table_song_of_user">
								</div>
								<div class="form-group">
									<label> Song:</label> <input type="text" class="form-control"
										id="IdSong_table_song_of_user"
										placeholder="Enter IdSong_table_song_of_user"
										name="IdSong_table_song_of_user">
								</div>

								<div class="form-group form-check"></div>
								<button type="submit" " class="btn btn-success btn-submit">Add
									New</button>
								<button type="submit" class="btn btn-success btn-submit">Edit</button>
								<button type="submit" class="btn btn-success btn-submit">Save</button>
								<button type="submit" class="btn btn-success btn-submit">Delete</button>
							</form>
						</div>
						<!-- .animated -->
					</div>
				</div>
			</div> <!-- .animated -->

		</li>
		<li class="col-md-10">

			<div class="animated fadeIn">
				<div class="row">
					<div class="col-sm-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Type Table</strong>
							</div>
							<div class="card-body">
								<table id="table_type" class="display">
									<thead>
										<tr>
											<th>ID</th>
											<th>User Name</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>

										</tr>
										<tr>
											<td>aaaa Nixon</td>
											<td>aaaa Architect</td>

										</tr>
										<tr>
											<td>bbbb Nixon</td>
											<td>bbb Architect</td>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row col-sm-12">
					<div id="idform" class="formHide">
						<h2>
							<strong style="text-align: center;">Add / Edit</strong>
						</h2>
						<form action="" method="">
							<div class="form-group">
								<label>Id: </label> <input type="text" class="form-control"
									id="idType" placeholder="Enter idType" name="idAType">
							</div>
							<div class="form-group">
								<label>Type Name:</label> <input type="text"
									class="form-control" id="nameType" placeholder="Enter nameType"
									name="nameType">
							</div>

							<div class="form-group form-check"></div>
							<button type="submit" " class="btn btn-success btn-submit">Add
								New</button>
							<button type="submit" class="btn btn-success btn-submit">Edit</button>
							<button type="submit" class="btn btn-success btn-submit">Save</button>
							<button type="submit" class="btn btn-success btn-submit">Delete</button>
						</form>
					</div>
					<!-- .animated -->
				</div>
			</div> <!-- .animated -->
</div>
</li>

</ul>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var files = [];
		$("#select_Song_Picture").change(function(event) {
			files = event.target.files;
			forms = new FormData();
			forms.append("file", files[0]);
			$.ajax({
				url : "/musiconline/api/uploadfileimg",
				type : "post",
				data : forms,
				contentType : false,
				processData : false,
				enctype : "multipart/form-data",
				success : function(value) {

				}
			})
		});

		var filesong = [];
		$("#selectUrlSong").change(function(event) {
			filesong = event.target.files;
			forms = new FormData();
			forms.append("file", filesong[0]);
			$.ajax({
				url : "/musiconline/api/uploadfilesong",
				type : "post",
				data : forms,
				contentType : false,
				processData : false,
				enctype : "multipart/form-data",
				success : function(value) {

				}
			})
		});

		$('#btn-addNew').click(function(event) {
			event.preventDefault(); // ko cho submit
			var formSong = $('#formAddSong').serializeArray(); // lay du lieu tu form
			json = {};
			$.each(formSong,function(i,field){
				json[field.name] = field.value;
			});
			console.log(JSON.stringify(json));
			
			$.ajax({
				url: "/musiconline/api/addnewsong",
				type: "post",
				data:{
					jsondata : JSON.stringify(json)
				},
				success: function(value){
					
				}
			})
		});
	});
</script>



