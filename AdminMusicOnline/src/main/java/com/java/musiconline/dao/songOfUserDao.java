package com.java.musiconline.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.SongOfUser;

@Repository
@Transactional(rollbackFor = Exception.class)
public class songOfUserDao {

	@Autowired
	SessionFactory sessionFactory;

	public int addSongUser(SongOfUser songOfUser) {
		Session session = this.sessionFactory.getCurrentSession();
		return (int) session.save(songOfUser);
	}

	public int checkSongOfUser(int idSong, int idUser) {
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery(
				"select count(idSong) from SongOfUser sou where sou.songs.idSong = :idSong and sou.user.idUser = :idUser ");
		sql.setParameter("idSong", idSong);
		sql.setParameter("idUser", idUser);
		List arr = sql.list();
		Number number = (Number) arr.get(0);
		return number.intValue();

	}

	public int deleteSongOfUser(int idSong, int idUser) {
		Session session = this.sessionFactory.getCurrentSession();
		Query sql = session.createQuery(
				"delete from SongOfUser sou where sou.songs.idSong = :idSong and sou.user.idUser = :idUser ");
		sql.setParameter("idSong", idSong);
		sql.setParameter("idUser", idUser);
		return sql.executeUpdate();

	}
}
