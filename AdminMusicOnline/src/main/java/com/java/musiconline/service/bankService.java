package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.banksDao;
import com.java.musiconline.entities.Banks;

@Service
@Transactional
public class bankService {
	
	@Autowired
	private banksDao dao;
	public List<Banks> getAllBank(){
		return dao.getAllBanks();
	}
}
