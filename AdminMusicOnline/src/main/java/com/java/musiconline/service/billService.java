package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.billDao;
import com.java.musiconline.entities.Bill;

@Service
@Transactional
public class billService {

	@Autowired
	private billDao dao;
	
	public int addBill(Bill bill){
		return dao.addBill(bill);
	}
	public List<Bill> getAllBill(){
		return dao.getAllBill();
	}
	public void deleteBill(int idBill){
		 dao.deleteBill(idBill);
	}
	public void updateBill(int idBill){
		dao.updateBill(idBill);
	}
	public int updateStateBill(int idBill,int sates){
		return dao.updateStateBill(idBill, sates);
	}
}
