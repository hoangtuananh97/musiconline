package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.ReplyComment;

@Repository(value="replyDao")
@Transactional(rollbackFor = Exception.class)
public class replyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	public int addReplyComment(ReplyComment replyComment){
		Session session = this.sessionFactory.getCurrentSession();
		return (int) session.save(replyComment);
	}
	public List<ReplyComment> getReplyCommentByIdCmt(int id){
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery("from ReplyComment r where r.comment.idComment =:id ");
		sql.setParameter("id", id);
		return ((org.hibernate.query.Query) sql).list();
	}
}
