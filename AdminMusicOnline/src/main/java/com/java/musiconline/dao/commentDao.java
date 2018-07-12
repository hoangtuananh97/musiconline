package com.java.musiconline.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Comment;

@Repository(value="commentDao")
@Transactional(rollbackFor = Exception.class)
public class commentDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	public List<Comment> getAllCommentByIdSong(int id){
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery("from Comment c where c.songs.idSong = :id ");
		sql.setParameter("id", id);
		return ((org.hibernate.query.Query) sql).list();
	}
	public int addComment(Comment comment){
		Session session = this.sessionFactory.getCurrentSession();
		return (int) session.save(comment);
	}
}
