package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Bill;
import com.java.musiconline.entities.Detailbill;

@Repository(value="billDao")
@Transactional(rollbackFor = Exception.class)
public class billDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public int addBill(Bill bill){
		Session session = this.sessionFactory.getCurrentSession();
		int id = (int) session.save(bill);
		System.out.println("idBill "+id);
		return (int) session.save(bill);
	}
	public List<Bill> getAllBill(){
		Session session = this.sessionFactory.getCurrentSession();
		return session.createQuery("from Bill").list();
	}
	public void deleteBill(int idBill){
		Session session = this.sessionFactory.getCurrentSession();
		
		Query xoa = session.createQuery("delete from Detailbill db where db.bill.idBill = :idBill ");
		xoa.setParameter("idBill", idBill);
		xoa.executeUpdate();
		Bill bill = session.get(Bill.class, idBill);
		session.delete(bill);
	}
	public void updateBill(int idBill){
		Session session = this.sessionFactory.getCurrentSession();
		Bill bill = session.get(Bill.class, idBill);
		session.update(bill);
	}
	public int updateStateBill(int idBill,int sates){
		Session session = this.sessionFactory.getCurrentSession();
		Query update = session.createQuery("update Bill set sates = :sates where idBill = :idBill");
		update.setParameter("idBill", idBill);
		update.setParameter("sates", sates);
		return update.executeUpdate();
	}
}
