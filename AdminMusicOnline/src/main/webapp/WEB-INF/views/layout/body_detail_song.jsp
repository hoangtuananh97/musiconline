<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content mt-3 noidung">
	<div class="row col-sm-12">
		<div id="idform" class="formHide">
			<h2>
				<strong style="text-align: center;">Add / Edit</strong>
			</h2>
			<form action="" method="post" enctype="multipart/form-data">
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
						id="song_Areas" placeholder="Enter song_Areas" name="song_Areas">
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
					<label> Picture:</label> <input type="text" class="form-control"
						id="song_Picture" placeholder="Enter song_Picture"
						name="song_Picture">
					<div id="song_Picture_img"></div>
					<input type="file" class="form-control" id="select_Song_Picture"
						placeholder="Enter select_Song_Picture" name="select_Song_Picture">
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
				<button class="btn btn-success btn-submit">Add New</button>
				<button type="submit" class="btn btn-success btn-submit">Edit</button>
				<button type="submit" class="btn btn-success btn-submit">Save</button>
				<button type="submit" class="btn btn-success btn-submit">Delete</button>
			</form>
		</div>
	</div>