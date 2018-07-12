package com.java.musiconline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.musiconline.dao.songDao;
import com.java.musiconline.entities.Songs;


@Service
@Transactional
public class songService  {

	@Autowired
	private songDao songdao;

	
	public int addNewSong(Songs song) {
		// TODO Auto-generated method stub
		
		return songdao.addNewSong(song);
	}

	
	public void updateSong(Songs song) {
		songdao.updateSong(song);
	}

	
	public int deleteSong(int id) {
		// TODO Auto-generated method stub
		return songdao.deleteSong(id);
	}

	
	public List<Songs> getAllSong() {
		// TODO Auto-generated method stub
		return songdao.getAllSong();
	}
	public Songs getAllbyId(int id){
		return songdao.getAllById(id);
	}
	public List<Object[]> getAllBySessionUser(String gmail){
		return songdao.getAllBySession(gmail);
	}
	public int countListen(int id){
		return songdao.updateCountListen(id);
	}
	public List<Songs> search(String tk){
		return songdao.search(tk);
	}
}
