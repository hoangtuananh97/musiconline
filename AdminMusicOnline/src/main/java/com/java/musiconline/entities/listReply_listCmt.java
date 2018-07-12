package com.java.musiconline.entities;

import java.util.List;

public class listReply_listCmt {
	private List<json_replycmt> replycmt;
	private List<json_comment> cmt;
	
	public List<json_replycmt> getReplycmt() {
		return replycmt;
	}
	public void setReplycmt(List<json_replycmt> replycmt) {
		this.replycmt = replycmt;
	}
	public List<json_comment> getCmt() {
		return cmt;
	}
	public void setCmt(List<json_comment> cmt) {
		this.cmt = cmt;
	}
	public listReply_listCmt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public listReply_listCmt(List<json_replycmt> replycmt, List<json_comment> cmt) {
		super();
		this.replycmt = replycmt;
		this.cmt = cmt;
	}
	
}
