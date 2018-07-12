package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.detailBillDao;
import com.java.musiconline.entities.Detailbill;

@Service
@Transactional
public class detailBillService {
	
	@Autowired
	private detailBillDao dao;

	public int addDetailBill(Detailbill db){
		return dao.addDetailBill(db);
	}
	public List<Detailbill> getAllDetailByIdBill(int id){
		return dao.getAllDetailByIdBill(id);
	}
}
