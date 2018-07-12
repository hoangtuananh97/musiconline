package com.java.musiconline.entities;

import java.util.Date;

public class json_replycmt {
	private Integer idReply;
	private Comment comment;
	private Feels feels;
	private Date repDates;
	private String repComtext;
	private String repName;

	public json_replycmt(Integer idReply, Comment comment, Feels feels, Date repDates, String repComtext,
			String repName) {
		super();
		this.idReply = idReply;
		this.comment = comment;
		this.feels = feels;
		this.repDates = repDates;
		this.repComtext = repComtext;
		this.repName = repName;
	}

	public json_replycmt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getIdReply() {
		return idReply;
	}

	public void setIdReply(Integer idReply) {
		this.idReply = idReply;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Feels getFeels() {
		return feels;
	}

	public void setFeels(Feels feels) {
		this.feels = feels;
	}

	public Date getRepDates() {
		return repDates;
	}

	public void setRepDates(Date repDates) {
		this.repDates = repDates;
	}

	public String getRepComtext() {
		return repComtext;
	}

	public void setRepComtext(String repComtext) {
		this.repComtext = repComtext;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

}
