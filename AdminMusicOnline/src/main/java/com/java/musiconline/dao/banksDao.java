package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Banks;

@Repository(value="banksDao")
@Transactional(rollbackFor = Exception.class)
public class banksDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	public List<Banks> getAllBanks(){
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery("from Banks");
		return sql.list();
	}

}
