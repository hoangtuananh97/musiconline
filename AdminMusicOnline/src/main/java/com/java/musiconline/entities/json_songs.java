package com.java.musiconline.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class json_songs {
	
	private Integer idSong;
	private Areas areas;
	private Artists artists;
	private Types types;
	private String name;
	private String url;
	private String author;
	private String coverArtUrl;
	private Date dateUpdate;
	private int countListen;
	private Set<User> users = new HashSet<User>(0);
	
	
	
	public json_songs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public json_songs(Integer idSong, Areas areas, Artists artists, Types types, String name, String url, String author,
			String coverArtUrl, Date dateUpdate, int countListen, Set<User> users) {
		super();
		this.idSong = idSong;
		this.areas = areas;
		this.artists = artists;
		this.types = types;
		this.name = name;
		this.url = url;
		this.author = author;
		this.coverArtUrl = coverArtUrl;
		this.dateUpdate = dateUpdate;
		this.countListen = countListen;
		this.users = users;
	}
	public Integer getIdSong() {
		return idSong;
	}
	public void setIdSong(Integer idSong) {
		this.idSong = idSong;
	}
	public Areas getAreas() {
		return areas;
	}
	public void setAreas(Areas areas) {
		this.areas = areas;
	}
	public Artists getArtists() {
		return artists;
	}
	public void setArtists(Artists artists) {
		this.artists = artists;
	}
	public Types getTypes() {
		return types;
	}
	public void setTypes(Types types) {
		this.types = types;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCoverArtUrl() {
		return coverArtUrl;
	}
	public void setCoverArtUrl(String coverArtUrl) {
		this.coverArtUrl = coverArtUrl;
	}
	public Date getDateUpdate() {
		return dateUpdate;
	}
	public void setDateUpdate(Date dateUpdate) {
		this.dateUpdate = dateUpdate;
	}
	public int getCountListen() {
		return countListen;
	}
	public void setCountListen(int countListen) {
		this.countListen = countListen;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
	
}
