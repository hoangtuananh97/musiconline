package com.java.musiconline.itf;

import java.util.List;

import com.java.musiconline.entities.Songs;

public interface songDaoItf {
	boolean addNewSong(Songs song);
	int updateSong(Songs song);
	int deleteSong(Songs song);
	List<Songs> getAll();
}
