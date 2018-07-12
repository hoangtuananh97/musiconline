package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Comment;
import com.java.musiconline.entities.Detailbill;

@Repository(value="detailBillDao")
@Transactional(rollbackFor = Exception.class)
public class detailBillDao {
	@Autowired
	private SessionFactory sessionFactory;
	public int addDetailBill(Detailbill db){
		Session session = this.sessionFactory.getCurrentSession();
		return (int) session.save(db);
	}
	public List<Detailbill> getAllDetailByIdBill(int id){
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery("from Detailbill db where db.bill.idBill = :id");
		sql.setParameter("id", id);
		return sql.list();
	}
}
