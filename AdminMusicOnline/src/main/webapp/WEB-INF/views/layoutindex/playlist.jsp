<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel='stylesheet prefetch'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>


<link rel="stylesheet" href="<c:url value="/resources/stylePlay.css"/> ">
<style>
	/* Comment */
#comment p{
	margin-bottom: 0;
}
#comment ul{
	list-style: none;
}
#comment img{
	float: left;
}
#comment li div{
	float: left;
	padding-left: 5px;
}
#comment ul li{
	clear: left;
	padding-top: 15px;
}
#comment li ul li{
	margin-left: 85px;
}
.replycomment{
	float: left;
	width: 70%;
	margin-left: 10%;
}
.comment-display{
	display: none;
}
</style>
<!-- boostrap -->
<c:choose>
	<c:when test="${not empty gmailLogin }">
		<div class="mhn-player">
			<div class="album-art"></div>
			<div id="play-list-empty" class="play-list">
				<c:forEach items="${arrSongSession }" var="list">
					<a href="#" class="play" data-id="${list.getIdSong() }"
						data-album="${list.getCountListen() }"
						data-artist="${list.getName() }" data-title="${list.getName() }"
						data-albumart="<c:url value='/resources/imgsong/${list.getCoverArtUrl()}'/> "
						data-url="<c:url value='/resources/urlsong/${list.getUrl() }'/> ">
					</a>
				</c:forEach>
			</div>
			<div class="audio"></div>
			<div class="current-info">
				<div class="song-artist"></div>
				<div class="song-album"></div>
				<div class="song-title"></div>
			</div>
			<div class="controls">
				<a href="#" class="toggle-play-list" style="top: 50px"><i
					class="fa fa-list-ul"></i></a>
				<div class="duration clearfix">
					<span class="pull-left play-position"></span> <span
						class="pull-right"><span class="play-current-time">00:00</span>
						/ <span class="play-total-time">00:00</span></span>
				</div>
				<div class="progress">
					<div class="bar"></div>
				</div>
				<div class="action-button">
					<a href="#" class="prev"><i class="fa fa-step-backward"></i></a> <a
						href="#" class="play-pause"><i class="fa fa-pp"></i></a> <a
						href="#" class="stop"><i class="fa fa-stop"></i></a> <a href="#"
						class="next"><i class="fa fa-step-forward"></i></a> <input
						type="range" class="volume" min="0" max="1" step="0.1" value="0.5"
						data-css="0.5">
					<div>
					<button class="btn btn-success" id="delete-user-song">Delete
							Song</button>
						<button class="btn btn-success" id="dowload-song">Dowload
							Song</button>
					</div>
				</div>

			</div>
		</div>
	</c:when>
	<c:otherwise>

	</c:otherwise>
</c:choose>
 <div class="row"  >
      <div id="comment" class="comment-display">
        <fieldset>
            <legend>Comment</legend>
            <form>
              <table>
                  <tr>
                    <td>Name</td>
                    <td><input type="text" size="25" class="comment_name" name="comment_name"></td>
                  </tr>
                   <tr>
                    <td>Message</td>
                    <td><textarea cols="60" rows="5" class="comment_mess" name="comment_mess"></textarea></td>
                  </tr>
                   <tr>
                    <td></td>
                    <td><input type="submit" value="Comment" class="commit_comment" size="25" name=""></td>
                  </tr>
              </table>
            </form>
        </fieldset>
        <fieldset>
          <legend>Old Comment</legend>
          <ul class="ul_comment">
         
  
          </ul>
        </fieldset>
      </div>
  </div>

<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>

<script src="<c:url value='/resources/index.js'/> "></script>
<script>
$(document).ready(function() {
	
});

</script>