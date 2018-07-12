package com.java.musiconline.entities;

public class cart {
 	private int idSong;
 	private int IdUser;
 	private String nameSong;
 	private String nameUser;
 	private int countSong;
	private String price;
		
	
	public cart(int idSong, int idUser, String nameSong, String nameUser, int countSong, String price) {
		super();
		this.idSong = idSong;
		IdUser = idUser;
		this.nameSong = nameSong;
		this.nameUser = nameUser;
		this.countSong = countSong;
		this.price = price;
	}
	public cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNameUser() {
		return nameUser;
	}
	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}
	public int getIdSong() {
		return idSong;
	}
	public void setIdSong(int idSong) {
		this.idSong = idSong;
	}
	public int getIdUser() {
		return IdUser;
	}
	public void setIdUser(int idUser) {
		IdUser = idUser;
	}
	public String getNameSong() {
		return nameSong;
	}
	public void setNameSong(String nameSong) {
		this.nameSong = nameSong;
	}
	public int getCountSong() {
		return countSong;
	}
	public void setCountSong(int countSong) {
		this.countSong = countSong;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
 	
	
}
