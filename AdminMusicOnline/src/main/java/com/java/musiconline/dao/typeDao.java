package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Types;

@Repository(value="typeDao")
@Transactional(noRollbackFor = Exception.class)
public class typeDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<Types> getAllType(){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("from Types").list();
		
	}
}
