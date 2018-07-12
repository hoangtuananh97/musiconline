package com.java.musiconline.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.musiconline.entities.User;

@Repository(value = "userDao")
@Transactional(rollbackFor = Exception.class)
public class userDao {
	@Autowired
	private SessionFactory factory;

	public User xlogin(String gmail, String pw) {
		Session session = factory.getCurrentSession();
		try {
			User u = (User) session.createQuery("from User where gmail='" + gmail + "' and password = '" + pw + "' ")
					.getSingleResult();
			if (u != null) {

				return u;
			}
		} catch (Exception e) {
			return null;
		}
		return null;
	}

	public User loadUserByUsername(final String gmail) {
		List<User> users = new ArrayList<User>();
		Session session = this.factory.getCurrentSession();
		users = session.createQuery("from User where gmail=?", User.class).setParameter(0, gmail).list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

	public User sendGmail(String gmail) {
		Session session = this.factory.getCurrentSession();
		User u = new User();
		return (User) session.createQuery("from User where gmail= :gmail").setParameter("gmail", gmail)
				.getSingleResult();

	}
}
