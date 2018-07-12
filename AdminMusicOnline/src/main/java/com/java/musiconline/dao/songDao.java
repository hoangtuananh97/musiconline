package com.java.musiconline.dao;

import java.awt.geom.Area;
import java.util.List;

import javax.persistence.Query;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.entities.Songs;

@Repository(value = "songDao")
@Transactional(rollbackFor = Exception.class)
public class songDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Songs> getAllSong() {

		Session session = this.sessionFactory.getCurrentSession();
		List<Songs> arr = session.createQuery("FROM Songs").list();
		System.out.println(arr);
		return arr;
	}

	public int addNewSong(Songs song) {
		Session session = this.sessionFactory.getCurrentSession();
		int addnew = (int) session.save(song);

		return addnew;
	}

	public int deleteSong(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query delete = session.createQuery("delete from Songs where idSong = :id");
		delete.setParameter("id", id);
		Songs s = session.get(Songs.class, id);
		session.delete(s);
		return 1;

	}

	public void updateSong(Songs song) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(song);
	}

	public Songs getAllById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		return (Songs) session.createQuery("from Songs where idSong =  " + id + " ").getSingleResult();

	}

	public List<Object[]> getAllBySession(String gmail) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from SongOfUser sou inner join sou.user su inner join sou.songs where su.gmail = :gmail ";
		Query queryid = session.createQuery(sql);
		queryid.setParameter("gmail", gmail);
		return ((org.hibernate.query.Query) queryid).list();
	}

	public int updateCountListen(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "update Songs set countListen = countListen + 1 where idSong =:id ";
		Query updateCount = session.createQuery(sql).setParameter("id", id);
		return updateCount.executeUpdate();
	}

	public List<Songs> search(String tk) {
		Session session = this.sessionFactory.getCurrentSession();
		String sql = "from Songs s where "
				+ "s.name like :tk or " 
				+ "s.areas.nameArea like :tk or "
				+ "s.artists.nameArtis like :tk or " 
				+ "s.types.nameType like :tk or " 
				+ "s.author like :tk";
		Query exsql = session.createQuery(sql).setParameter("tk", "%" + tk + "%");
		return ((org.hibernate.query.Query) exsql).list();
	}

}
