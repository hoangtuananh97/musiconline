package com.java.musiconline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.userDao;
import com.java.musiconline.entities.User;

@Service
@Transactional
public class userService {
	@Autowired
	private userDao udao;
	public User xlogin(String gmail,String pw){
		return udao.xlogin(gmail, pw);
	}
	public User sendGmail(String gmail){
		return udao.sendGmail(gmail);
	}
	
}
