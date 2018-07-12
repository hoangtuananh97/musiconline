package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Artists;

@Repository(value="aristsDao")
@Transactional(rollbackFor = Exception.class)
public class aristsDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Artists> getAllArtists(){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("FROM Artists").list();
	}
}
