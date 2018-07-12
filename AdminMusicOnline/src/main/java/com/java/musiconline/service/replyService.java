package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.replyDao;
import com.java.musiconline.entities.ReplyComment;

@Service
@Transactional
public class replyService {

	@Autowired
	private replyDao dao;
	
	public int addReplyCmt(ReplyComment replyComment){
		return dao.addReplyComment(replyComment);
	}
	public List<ReplyComment> getReplyCommentByIdCmt(int id){
		return dao.getReplyCommentByIdCmt(id);
	}
}
