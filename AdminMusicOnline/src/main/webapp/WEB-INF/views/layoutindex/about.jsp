<!-- About Starts -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#playlist {
	list-style: none;
}

#playlist li a {
	color: #ffffff;
	text-decoration: none;
}

#playlist .current-song a {
	color: #00ff40;
}

.stylecustome {
	overflow: auto;
}

.border_song {
	border: 1px solid #000000;
	width: 240px;
	margin: 5px;
	padding: 5px;
}
</style>
<div id="about" class="spacer">
	<h3>
		<span class="glyphicon glyphicon-user"></span> About Me
	</h3>
	<div class="row">
		<div class="col-lg-4 col-sm-4  col-xs-12">
			<img src="<c:url value="/resources/images/4.jpg"/> "
				class="img-responsive" alt="about" />
		</div>
		<div class="col-lg-5 col-sm-8  col-xs-12">
			<input style="margin-top: 5px; height: 30px;" type="text" size="35"
				name="timkiem" placeholder="song,album">
			<audio src="" style="width: 100%" controls id="audioPlayer"></audio>
			<ul id="playlist" style="height: 300px; overflow: auto;"
				class="stylecustome">
				<c:forEach items="${listMusic }" var="list">
					<li data-id="${list.getIdSong()}"><a class="data-id-song"
						data-id="${list.getIdSong() }"
						href="<c:url value='/resources/urlsong/${list.getUrl() }'/>">${list.getName() }&nbsp;</a>
						<button class="btn btn-success add_song_user"
							data-id="${list.getIdSong() }">Add List User</button>
							
						<button class="btn btn-success add_cart"
							data-idSong-addCart="${list.getIdSong() }"><b data-nameSongCart="${list.getName() }">Add Cart</b></button></li>	
				</c:forEach>
			</ul>
		</div>
		<div></div>

		<div class="col-lg-3 visible-lg">
			<div class="fb-like-box"
				data-href="http://www.facebook.com/thebootstrapthemes"
				data-colorscheme="dark" data-show-faces="true" data-header="false"
				data-stream="false" data-show-border="false" data-width="255"></div>
		</div>
		<input type="hidden" id="sessionIdUser" data-idUser="${ sessionUser }" />
		<input type="hidden" id="sessionNameUser" data-nameUser="${sessionNameUser }" />
	</div>
</div>
<!-- About Ends -->
<script src="https://code.jquery.com/jquery-2.2.0.js"></script>
<script>
	function audioPlayer() {
		var currentSong = 0;
		$("#audioPlayer")[0].src = $("#playlist li a")[0];
		$("#audioPlayer")[0].play();
		$("#playlist li a").click(function(e) {
			e.preventDefault();
			$("#audioPlayer")[0].src = this;
			$("#audioPlayer")[0].play();
			$("#playlist li").removeClass("current-song");
			currentSong = $(this).parent().index();
			$(this).parent().addClass("current-song");
		});

		$("#audioPlayer")[0].addEventListener("ended", function() {
			currentSong++;
			if (currentSong == $("#playlist li a").length)
				currentSong = 0;
			$("#playlist li").removeClass("current-song");
			$("#playlist li:eq(" + currentSong + ")").addClass("current-song");
			$("#audioPlayer")[0].src = $("#playlist li a")[currentSong].href;
			$("#audioPlayer")[0].play();
		});
	}
</script>
<script>
	// loads the audio player

	audioPlayer();
</script>
<script>
	$(document).ready(function() {

						$('.add_song_user').click(function() {
											var idSong = $(this).attr('data-id');
											var idUser = $('#sessionIdUser').attr('data-idUser');
											if (idUser == "") {
												$('#click_login_button').click();
											} else {
												$.ajax({
															url : "/musiconline/api/addSongOfUser",
															type : "post",
															data : {
																idSong : idSong,
																idUser : idUser
															},
															success : function(value) {
																if (value == "adderror") {
																	alert("add Error");
																} else if (value == "existssong") {
																	alert("Exists Song");

																} else if (value == "usernull") {
																	$('#click_login_button').click();
																} else if (value == "addnew") {
																	location.reload();
																}
															}
														})
												/* .done(function() {
													$.ajax({
														url : "/musiconline/api/getAllSongBySession",
														type : "get",
														data : {
															idSong : idSong,
															idUser : idUser
														},
														success : function(value) {
															var play_list_empty = $('#play-list-empty').empty();
															play_list_empty.append(value);
														}
													})
												}); */
											}
										});

						$("#playlist").find('li').click(function() {
							var id = ($(this).hasClass('current-song'));

							if (id == true) {
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
							}
						})

						/* function tk(){
							 var addli= $('#about').find('ul');
							 <c:forEach var="list" items="${listSong}">
								xoa.append('<li data-id="${list.getIdSong()}"><a class="data-id-song"');
								xoa.append('data-id="${list.getIdSong() }"');
								xoa.append('href="<c:url value="/resources/urlsong/${list.getUrl() }"/>">${list.getName() }&nbsp;</a>');
								xoa.append('<button class="btn btn-success add_song_user" data-id="${list.getIdSong() }">Add List User</button></li>');
								</c:forEach>
							} */

						// tim kiem
						$('#about').find('input').change(
										function() {
											var tk = $(this).val();
											$
													.ajax({
														url : "/musiconline/api/search",
														type : "get",
														data : {
															tk : tk
														},
														success : function(
																datas) {
															console.log(datas);
															var xoa = $('#about').find('ul');
															xoa.empty();


															for (var i = 0; i < datas.length; i++) {

																xoa.append('<li data-id="'+datas[i].idSong+'"> <a class="data-id-song" data-id="'
																				+ datas[i].idSong
																				+ '" href="<c:url value="/resources/urlsong/'
																						+datas[i].url+'"/>">'
																				+ datas[i].name
																				+ '&nbsp;</a> <button class="btn btn-success add_song_user" data-id="'
																				+datas[i].idSong+'">Add List User</button></li>');

															}
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
															
						// comment
						//test
						var id_song_comment = "";
						$("#playlist").find('li').click(
										function() {
											var id = ($(this).hasClass('current-song'));
											if (id == true) {
												id_song_comment = $(this).attr('data-id');
												if (id_song_comment != null) {
													event.preventDefault();
													$('#comment').removeClass('comment-display');
													
													$.ajax({
																url : "/musiconline/api/displayCommentbyidHtml",
																type : "get",
																data : {
																	id_song_comment : id_song_comment
																},
																success : function(value) {
																	console.log(value);
																	console.log(value.length);
																	
																	var remove_comment = $('#comment').find('ul');
																	remove_comment.empty();
																	remove_comment.append(value);
																			
																}

															})

												}
											}

										});
						// add reply comment 														
				$('body').on('click','.rep_cmt_submit',function(event){
				event.preventDefault();
				
				id = $(this).attr('data-comid');
				name_reply_cmt = $('.name-reply-cmt'+id).val();
				context_reply_cmt = $('.context-reply-cmt'+id).val();
				console.log(name_reply_cmt +":"+context_reply_cmt);
				var id_reply = parseInt(id);
				 var currentdate = new Date();
				var datetime = currentdate.getFullYear()+ "-"
							+ (currentdate.getMonth() + 1)+ "-"
							+ currentdate.getDate();
				$.ajax({
						url : "/musiconline/api/addReplyComment",
						type : "post",
						data : {
							id_reply : id_reply,
							name_reply_cmt : name_reply_cmt,
							context_reply_cmt : context_reply_cmt,
							datetime :datetime
							},
							success : function(value){
								if (value == "true") {
									/* $('#comment').find('.reply-context-comment-ul'+id).empty(); */
									var datetimemss = currentdate.getDate()+ "-"
									+ (currentdate.getMonth() + 1)+ "-"
									+ currentdate.getFullYear();
										var replycmt = '<li>'
											+ '<img src="<c:url value='/resources/album-art/userimg.png'/>" width="55px">'
											+ '<div>'
											+ '<p>'
											+ ' '+name_reply_cmt+' &nbsp;<b><small>'+datetimemss+'</small></b>'
											+ '</p>'
											+ '<p>'+context_reply_cmt+'</p>'
											+ ' </div>'
											+ ' </li>';
											
											$('#comment').find('.reply-context-comment-ul'+id).append(replycmt);
											console.log(replycmt);
									}else{
											alert("Erorr");
										}
								$('.name-reply-cmt'+id).val('');
								 $('.context-reply-cmt'+id).val('');
							}	
					}) 
				
				});
				
							// add comment
						$('.commit_comment').click(
										function() {
											var currentdate = new Date();
											var datetime = currentdate.getFullYear()+ "-"
													+ (currentdate.getMonth() + 1)+ "-"
													+ currentdate.getDate();

											var comment_name = $('.comment_name').val();
											var comment_mess = $('.comment_mess').val();
											var id = parseInt(id_song_comment);
											$.ajax({
														url : "/musiconline/api/addComment",
														type : "post",
														data : {
															id : id,
															comment_name : comment_name,
															comment_mess : comment_mess,
															datetime : datetime
														},
														success : function(value) {
															if (value == "true") {
																var datetimemss = currentdate.getDate()+ "-"
																		+ (currentdate.getMonth() + 1)+ "-"
																		+ currentdate.getFullYear();
																var cmt = '<li>'
																		+ ' <img src="<c:url value='/resources/album-art/userimg.png'/>" width="70px"><div>'
																		+ ' <p>'
																		+ ' '
																		+ comment_name
																		+ '<b><small> &nbsp; '
																		+ datetimemss
																		+ ' &nbsp;<a href="#">Reply</a></small></b>'
																		+ ' </p>'
																		+ '<p>'
																		+ comment_mess
																		+ '</p></div></li>';
																if($('#comment .ul_comment li').length==0){
																	$('#comment .ul_comment').append(cmt);
																	}else{		
																$('#comment').find('ul li:eq(0)').before(cmt);
																	}
																	$('.comment_name').val('');
																	 $('.comment_mess').val('');
															}
														}
													})
											return false;
										});

				// toggle comment and relpy comment 			
				$('body').on('click','.a-reply',function(event){
					event.preventDefault();
					var idCmt = $(this).attr('data-idcmt');
					$('.replycomment'+idCmt).slideToggle();
					});
				
			// add cart
			$('.add_cart').click(function(){
				idSong_addCart = $(this).attr('data-idSong-addCart');
				var idUser_addCart = $('#sessionIdUser').attr('data-idUser');
				var nameUser = $('#sessionNameUser').attr('data-nameUser');
				var nameSong = $(this).find('b').attr('data-nameSongCart');
				if (idUser_addCart == "") {
					$('#click_login_button').click();
				}else{
				 $.ajax({
						url : "/musiconline/api/addcart",
						type : "get",
						data : {
							idSong_addCart : idSong_addCart,
							idUser_addCart : idUser_addCart,
							nameUser : nameUser,
							nameSong : nameSong
							},
						success : function(value){
								
							}	
					}).done(function(){
						 $.ajax({
								url : "/musiconline/api/countSongCart",
								type : "get",
								success : function(value){
									console.log(value);
									$('#countSongsCart').find('#idcart').html("aâ");
										$('#countSongsCart').find('#idcart').addClass('count_cart');
										$('#countSongsCart').find('#idcart').html("<span >"+value+"</span>");
								}	
						})
					}) 
				}
				
				});	
														
		});
</script>



