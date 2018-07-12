<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<style>
.hidden{
	display: none;
}
</style>
<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
				<strong class="card-title">Song Table</strong>
			</div>
			<div class="card-body">
				<table border="1" cellspacing="0" cellpadding="10" id="table_song" class="display">
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
							<th>Delete</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listSongs }" var="listSong">
							<tr>

								<td class="idSong" data-id="${listSong.getIdSong()}">${listSong.getIdSong() }</td>
								<td>${listSong.getName() }</td>
								<td>${listSong.getUrl() }
									<br/>
									<audio controls>
 									 <source src="<c:url value="/resources/urlsong/${listSong.getUrl()}"/>" type="audio/mpeg">
									</audio>
								</td>
								<td>${listSong.getAreas().getNameArea() }</td>
								<td>${listSong.getArtists().getNameArtis() }</td>
								<td>${listSong.getTypes().getNameType() }</td>
								<td>${listSong.getAuthor() }</td>
								<td><img
									src="<c:url value="/resources/imgsong/${listSong.getCoverArtUrl()}"/>"
									height="100px" width="100px" alt="${listSong.getCoverArtUrl()}"></td>
								<td><fmt:formatDate value="${listSong.getDateUpdate() }"
										pattern="dd-MM-yyyy" /></td>
								<td>${listSong.getCountListen() }</td>
								<td><button class="btn btn-primary delete-song">Delete</button></td>
								<td><button class="btn btn-primary update-song">Edit</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="row col-sm-11" style="margin-left: 10px">
		<div id="idform" class="formHide">
			<h2>
				<strong style="text-align: center;">Add / Edit</strong>
			</h2>
			<form action="" id="formAddSong">

				<div class="form-group">
					<label> Song:</label> <input type="text" class="form-control"
						id="nameSong" placeholder="Enter nameSong" name="name">
				</div>
				<div class="form-group">
					<label> Song:</label>
					<!-- <input type="text" class="form-control"
						id="urlSong" placeholder="Enter urlSong" name="url">
					 <audio id="audio_song" controls="controls">
                                        </audio> -->

					<input type="file" class="form-control" id="selectUrlSong"
						placeholder="Enter selectUrlSong" name="url">

				</div>
				<div class="form-group">
					<label> Artist:</label>
					<!-- <input type="text" class="form-control"
						id="song_Artist" placeholder="Enter song_Artist"
						name="song_Artist"> -->
					<select name="idArists" class="form-control" id="idArists">
						<c:forEach items="${listarists}" var="listArists">
							<option value="${ listArists.getIdArtis()}" data-name="${listArists.getNameArtis() }">${listArists.getNameArtis() }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label> Areas:</label>
					<!-- <input type="text" class="form-control"
						id="song_Areas" placeholder="Enter song_Areas" name="song_Areas"> -->
					<select name="idAreas" class="form-control" id="idAreas">
						<c:forEach items="${listAreas}" var="listAreas">
							<option value="${ listAreas.getIdAreas()}" data-name="${listAreas.getNameArea() }">${listAreas.getNameArea() }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label> Type:</label>
					<!-- <input type="text" class="form-control"
						id="song_Type" placeholder="Enter song_Type" name="song_Type"> -->
					<select name="idType" class="form-control" id="idType">
						<c:forEach items="${listType}" var="listType">
							<option value="${ listType.getIdType()}" data-name="${listType.getNameType() }" >${listType.getNameType() }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label> Author:</label> <input type="text" class="form-control"
						id="song_Author" placeholder="Enter song_Author" name="author">
				</div>
				<div class="form-group">
					<label> Picture:</label>
					<!-- <input type="text" class="form-control"
						id="song_Picture" placeholder="Enter song_Picture"
						name="song_Picture"> -->
					<div id="song_Picture_img"></div>
					<input type="file" class="form-control" id="select_Song_Picture"
						placeholder="Enter select_Song_Picture" name="coverArtUrl">
				</div>
				<div class="form-group">
					<label> Date Update:</label> <input type="date"
						class="form-control" id="song_Date_Update"
						placeholder="Enter song_Date_Update" name="dateUpdate">
				</div>
				<!-- <div class="form-group">
					<label> Count Liste:</label> <input type="text"
						class="form-control" id="song_Count_Liste"
						placeholder="Enter song_Count_Liste" name="countListen">
				</div>
 -->
				<div class="form-group form-check"></div>
				<button id="clearInput" class="btn btn-success btn-submit">Clear
					Input</button>
				<button class="btn btn-success btn-submit" id="btn-addNew">Add
					New</button>
				<button class="btn btn-success btn-submit hidden" id="btn-updateSong">Update Song</button>	
				<button class="btn btn-success btn-submit hidden" id="btn-Log">Log</button>	
			</form>

		</div>
		<!-- .animated -->
	</div>
</div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var files = [];
		var nameFilePicture = "";
		$("#select_Song_Picture").change(function(event) {
			files = event.target.files;
			nameFilePicture = files[0].name;
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
		var nameFileSong = "";
		$("#selectUrlSong").change(function(event) {
			filesong = event.target.files;
			nameFileSong = filesong[0].name;
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

		// format date
		formatDate = function date2str(x, y) {
		    var z = {
		        M: x.getMonth() + 1,
		        d: x.getDate(),
		        h: x.getHours(),
		        m: x.getMinutes(),
		        s: x.getSeconds()
		    };
		    y = y.replace(/(M+|d+|h+|m+|s+)/g, function(v) {
		        return ((v.length > 1 ? "0" : "") + eval('z.' + v.slice(-1))).slice(-2)
		    });

		    return y.replace(/(y+)/g, function(v) {
		        return x.getFullYear().toString().slice(-v.length)
		    });
		}

		
		// xóa
		$('.delete-song').click(function() {
			var deleteTr = $(this);
			var id = $(this).closest('tr').find('.idSong').attr('data-id');
			$.ajax({
				url : "/musiconline/api/deletesong",
				type : "post",
				data : {
					id : id
				},
				success : function(value) {
					deleteTr.closest('tr').remove();
				}
			})
		});

		var idSongUpdate = 0;
		// Edit
		$('.update-song').click(function() {
			$('#btn-updateSong').removeClass('hidden');
			$('#btn-Log').removeClass('hidden');
			$('#btn-addNew').addClass('hidden');
			var id = $(this).closest('tr').find('.idSong').attr('data-id');
			idSongUpdate = $(this).closest('tr').find('.idSong').attr('data-id');
			 $.ajax({
				url : "/musiconline/api/updatesong",
				type : "post",
				data : {
					id : id
				},
				success : function(value) {
					$('#nameSong').val(value.name);
					$('#idArists').val(value.artists.idArtis);
					$('#idAreas').val(value.areas.idAreas);
					$('#idType').val(value.types.idType);
					$('#song_Author').val(value.author);

					  myDate = new Date(1000*value.dateUpdate); 
					$('#song_Date_Update').val(formatDate(new Date(value.dateUpdate), 'yyyy-MM-dd'));
					console.log(myDate.toLocaleString());
					console.log(myDate.toUTCString());
					console.log(value.dateUpdate);
					console.log(formatDate(new Date(value.dateUpdate), 'yyyy-MM-dd'));
				}
			}) 
		});

		// button update
		$('#btn-updateSong').click(function(event) {
			event.preventDefault(); // ko cho submit
			var formSong = $('#formAddSong').serializeArray(); // lay du lieu tu form
			json = {};
			$.each(formSong, function(i, field) {
				json[field.name] = field.value;
			});
			json["idSong"] = idSongUpdate;
			json["url"] = nameFileSong;
			json["coverArtUrl"] = nameFilePicture;

			console.log(JSON.stringify(json));

			 $.ajax({
				url : "/musiconline/api/capnhatbaihat",
				type : "post",
				data : {
					datajson : JSON.stringify(json)
				},
				success : function(value) {
					
				}
			}) 
		});
		
		
		// add
		$('#btn-addNew').click(function(event) {
			event.preventDefault(); // ko cho submit
			var formSong = $('#formAddSong').serializeArray(); // lay du lieu tu form
			json = {};
			$.each(formSong, function(i, field) {
				json[field.name] = field.value;
			});

			json["url"] = nameFileSong;
			json["coverArtUrl"] = nameFilePicture;

			console.log(JSON.stringify(json));

			$.ajax({
				url : "/musiconline/api/addsong",
				type : "post",
				data : {
					datajson : JSON.stringify(json)
				},
				success : function(value) {
					
					if(value =="true"){
						var idSong = $('#table_song').find( "tr:last" ).find('td:first').attr('data-id');
						console.log(idSong);
						var idSongAttr = parseInt(idSong)+1;
						
						
						var nameSong = $('#nameSong').val();
						var selectUrlSong = $('#selectUrlSong').val().replace(/C:\\fakepath\\/i, '');						
						var idArists = $('#idArists').find('option:selected').attr('data-name'); 
						var idAreas = $('#idAreas').find('option:selected').attr('data-name'); 
						var idType = $('#idType').find('option:selected').attr('data-name'); 
						var song_Author = $('#song_Author').val(formatDate(new Date(value.dateUpdate), 'yyyy-MM-dd'));
						
						var select_Song_Picture = $('#select_Song_Picture').val().replace(/C:\\fakepath\\/i, '');
						var song_Date_Update = $('#song_Date_Update').val();
						
						var add = '<tr>'
							+'<td class="idSong" data-id="'+idSongAttr+'">'+idSongAttr+'</td>'
							+'<td>'+nameSong+'</td>'
							+'<td><br/><audio controls>'
							 +'<source src="<c:url value="/resources/urlsong/'+selectUrlSong+'"/>" type="audio/mpeg"></audio></td>'
							+'<td>'+idAreas+'</td>'
							+'<td>'+idArists+'</td>'
							+'<td>'+idType+'</td>'
							+'<td>'+song_Author+'</td>'
							+'<td><img src="<c:url value="/resources/imgsong/'+select_Song_Picture+'"/>" '
							+'	height="100px" width="100px" alt="'+select_Song_Picture+'"></td> '
							+'<td>'+song_Date_Update+'</td>'
							+'<td>0</td>'
							+'<td><button class="btn btn-primary delete-song">Delete</button></td>'
							+'<td><button class="btn btn-primary update-song">Edit</button></td>'
						+'</tr>';
						console.log(add);
						$('#table_song').find('tbody').append(add);
					}
				}
			})
		});

		
		
	});
</script>
<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
	
		});
		
	</script>		