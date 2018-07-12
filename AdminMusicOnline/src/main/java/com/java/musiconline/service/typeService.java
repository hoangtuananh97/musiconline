package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.typeDao;
import com.java.musiconline.entities.Types;

@Service
@Transactional
public class typeService {

	@Autowired
	private typeDao typeDao;

	public List<Types> getAllType() {
		return typeDao.getAllType();
	}
}
