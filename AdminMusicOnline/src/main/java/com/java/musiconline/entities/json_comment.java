package com.java.musiconline.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class json_comment {
	private Integer idComment;
	private Feels feels;
	private Songs songs;
	private String nameComment;
	private String context;
	private Date times;
	private List<json_replycmt> replyComments = new ArrayList<>();

	public json_comment(Integer idComment, Feels feels, Songs songs, String nameComment, String context, Date times,
			List<json_replycmt> replyComments) {
		super();
		this.idComment = idComment;
		this.feels = feels;
		this.songs = songs;
		this.nameComment = nameComment;
		this.context = context;
		this.times = times;
		this.replyComments = replyComments;
	}

	public json_comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getIdComment() {
		return idComment;
	}

	public void setIdComment(Integer idComment) {
		this.idComment = idComment;
	}

	public Feels getFeels() {
		return feels;
	}

	public void setFeels(Feels feels) {
		this.feels = feels;
	}

	public Songs getSongs() {
		return songs;
	}

	public void setSongs(Songs songs) {
		this.songs = songs;
	}

	public String getNameComment() {
		return nameComment;
	}

	public void setNameComment(String nameComment) {
		this.nameComment = nameComment;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getTimes() {
		return times;
	}

	public void setTimes(Date times) {
		this.times = times;
	}

	public List<json_replycmt> getReplyComments() {
		return replyComments;
	}

	public void setReplyComments(List<json_replycmt> replyComments) {
		this.replyComments = replyComments;
	}

}
