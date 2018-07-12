package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Areas;

@Repository(value = "areasDao")
@Transactional(noRollbackFor = Exception.class)
public class areasDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Areas> getAllAreas() {
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("from Areas").list();
	}
}
