package com.java.musiconline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.songOfUserDao;
import com.java.musiconline.entities.SongOfUser;

@Service
@Transactional
public class songOfUserService {

	@Autowired
	private songOfUserDao dao;

	public int addSongUser(SongOfUser songOfUser) {
		return dao.addSongUser(songOfUser);
	}

	public int checkSongOfUser(int idSong, int idUser) {
		return dao.checkSongOfUser(idSong, idUser);
	}

	public int deleteSongOfUser(int idSong, int idUser) {
		return dao.deleteSongOfUser(idSong, idUser);
	}
}
