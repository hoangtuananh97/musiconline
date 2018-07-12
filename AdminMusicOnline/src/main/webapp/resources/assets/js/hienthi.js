(function($) {
	$(function() {
		$('.hienthind ul li ul li').click(function() {

			x = $(this).index();
			x = x + 1;
			console.log('vi tri  ' + x);
			$('.noidung ul li').removeClass('hienlen');
			$('.noidung ul li:nth-child(' + x + ')').addClass('hienlen');
		});

		/*
		 * var files = []; $("#select_Song_Picture").change(function(event) {
		 * files = event.target.files; forms = new FormData();
		 * forms.append("file", files[0]); $.ajax({ url :
		 * "http://localhost:8082/musiconline/api/uploadfile", type : "POST",
		 * data : forms, contentType :false, processData : false, enctype :
		 * "multipart/form-data", success : function(value) {
		 *  } }) });
		 */

		var table_user = document.getElementById('table_user');
		var table_areas = document.getElementById('table_areas');
		var table_type = document.getElementById('table_type');
		var table_arists = document.getElementById('table_arists');
		var table_song_of_user = document.getElementById('table_song_of_user');
		var table_song = document.getElementById('table_song');
		/* table user */
		for (var i = 1; i < table_user.rows.length; i++) {
			table_user.rows[i].onclick = function() {
				document.getElementById("username").value = this.cells[0].innerHTML;
				document.getElementById("email").value = this.cells[1].innerHTML;
				document.getElementById("pwd").value = this.cells[2].innerHTML;

			};
		}
		/* table areas */
		for (var i = 1; i < table_areas.rows.length; i++) {
			table_areas.rows[i].onclick = function() {
				document.getElementById("idAreas").value = this.cells[0].innerHTML;
				document.getElementById("nameAreas").value = this.cells[1].innerHTML;

			};
		}

		/* table type */
		for (var i = 1; i < table_type.rows.length; i++) {
			table_type.rows[i].onclick = function() {
				document.getElementById("idType").value = this.cells[0].innerHTML;
				document.getElementById("nameType").value = this.cells[1].innerHTML;

			};
		}

		/* table Arists */
		for (var i = 1; i < table_arists.rows.length; i++) {
			table_arists.rows[i].onclick = function() {
				document.getElementById("idArists").value = this.cells[0].innerHTML;
				document.getElementById("nameArists").value = this.cells[1].innerHTML;

			};
		}

		/* table table_song_of_user */
		for (var i = 1; i < table_song_of_user.rows.length; i++) {
			table_song_of_user.rows[i].onclick = function() {
				document.getElementById("idUser_table_song_of_user").value = this.cells[0].innerHTML;
				document.getElementById("IdSong_table_song_of_user").value = this.cells[1].innerHTML;

			};
		}

		$('#clearInput').click(function() {
			document.getElementById("idSong").value = "";
			document.getElementById("nameSong").value = "";
			document.getElementById("urlSong").value = "";
			document.getElementById("song_Areas").value = "";
			document.getElementById("song_Artist").value = "";
			document.getElementById("song_Picture").value = "";
			document.getElementById("song_Type").value = "";
			document.getElementById("song_Author").value = "";
			document.getElementById("song_Date_Update").value = "";
			document.getElementById("song_Count_Liste").value = "";

		});

		/* table table_song */
		for (var i = 1; i < table_song.rows.length; i++) {
			table_song.rows[i].onclick = function() {
				document.getElementById("idSong").value = this.cells[0].innerHTML;
				document.getElementById("nameSong").value = this.cells[1].innerHTML;

				var urlsong_play = this.cells[2]
						.getElementsByClassName("urlsong_play");
				document.getElementById("urlSong").value = urlsong_play[0].innerHTML;

				document.getElementById("song_Areas").value = this.cells[3].innerHTML;
				document.getElementById("song_Artist").value = this.cells[4].innerHTML;

				document.getElementById("song_Type").value = this.cells[5].innerHTML;
				document.getElementById("song_Author").value = this.cells[6].innerHTML;

				var xsong_Picture = this.cells[7].getElementsByClassName("bb");
				document.getElementById("song_Picture").value = "<img src='assets/images/"
						+ xsong_Picture[0].innerHTML + "' />";
				// add tag
				var elem = document.createElement("img");
				elem.setAttribute("src", "assets/images/"
						+ xsong_Picture[0].innerHTML + "");
				elem.setAttribute("height", "100px");
				elem.setAttribute("width", "100px");
				document.getElementById("song_Picture_img").appendChild(elem);
				// remove tag
				var list = document.getElementById("song_Picture_img");
				list.removeChild(list.childNodes[0]);

				document.getElementById("song_Date_Update").value = this.cells[8].innerHTML;
				document.getElementById("song_Count_Liste").value = this.cells[9].innerHTML;

			};
		}

	});
}(jQuery));

/*
 * (function ($) { $(function(){ $('#1').click(function(){
 * 
 * $('#idform').toggle( 'slow' ); });
 * 
 * }); }(jQuery)); (function ($) { $(function(){ $('#2').click(function(){
 * 
 * $('#idform').toggle( 'slow' ); });
 * 
 * }); }(jQuery));
 */
