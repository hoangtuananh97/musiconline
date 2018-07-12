package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.commentDao;
import com.java.musiconline.entities.Comment;

@Service
@Transactional
public class commentService {

	@Autowired
	private commentDao dao;
	public List<Comment> getAllCommentByIdSong(int id){
		return dao.getAllCommentByIdSong(id);
	}
	public int addComment(Comment comment){
		return dao.addComment(comment);
	}
}
