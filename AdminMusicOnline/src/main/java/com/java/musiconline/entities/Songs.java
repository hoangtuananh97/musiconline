package com.java.musiconline.entities;
// Generated Jun 25, 2018 7:49:38 AM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Songs generated by hbm2java
 */
@Entity
@Table(name = "songs", catalog = "musiconline")
public class Songs implements java.io.Serializable {

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
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<SongOfUser> songOfUsers = new HashSet<SongOfUser>(0);
	private Set<Detailbill> detailbills = new HashSet<Detailbill>(0);

	public Songs() {
	}

	public Songs(Areas areas, Artists artists, Types types, String name, String url, String author, String coverArtUrl,
			Date dateUpdate, int countListen) {
		this.areas = areas;
		this.artists = artists;
		this.types = types;
		this.name = name;
		this.url = url;
		this.author = author;
		this.coverArtUrl = coverArtUrl;
		this.dateUpdate = dateUpdate;
		this.countListen = countListen;
	}

	public Songs(Areas areas, Artists artists, Types types, String name, String url, String author, String coverArtUrl,
			Date dateUpdate, int countListen, Set<Comment> comments, Set<SongOfUser> songOfUsers,
			Set<Detailbill> detailbills) {
		this.areas = areas;
		this.artists = artists;
		this.types = types;
		this.name = name;
		this.url = url;
		this.author = author;
		this.coverArtUrl = coverArtUrl;
		this.dateUpdate = dateUpdate;
		this.countListen = countListen;
		this.comments = comments;
		this.songOfUsers = songOfUsers;
		this.detailbills = detailbills;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idSong", unique = true, nullable = false)
	public Integer getIdSong() {
		return this.idSong;
	}

	public void setIdSong(Integer idSong) {
		this.idSong = idSong;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idArea", nullable = false)
	public Areas getAreas() {
		return this.areas;
	}

	public void setAreas(Areas areas) {
		this.areas = areas;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idArtist", nullable = false)
	public Artists getArtists() {
		return this.artists;
	}

	public void setArtists(Artists artists) {
		this.artists = artists;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idType", nullable = false)
	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	@Column(name = "name", nullable = false, length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "url", nullable = false)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "author", nullable = false, length = 200)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "cover_art_url", nullable = false, length = 300)
	public String getCoverArtUrl() {
		return this.coverArtUrl;
	}

	public void setCoverArtUrl(String coverArtUrl) {
		this.coverArtUrl = coverArtUrl;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dateUpdate", nullable = false, length = 10)
	public Date getDateUpdate() {
		return this.dateUpdate;
	}

	public void setDateUpdate(Date dateUpdate) {
		this.dateUpdate = dateUpdate;
	}

	@Column(name = "countListen", nullable = false)
	public int getCountListen() {
		return this.countListen;
	}

	public void setCountListen(int countListen) {
		this.countListen = countListen;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "songs", cascade=CascadeType.ALL)
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "songs", cascade=CascadeType.ALL)
	public Set<SongOfUser> getSongOfUsers() {
		return this.songOfUsers;
	}

	public void setSongOfUsers(Set<SongOfUser> songOfUsers) {
		this.songOfUsers = songOfUsers;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "songs", cascade=CascadeType.ALL)
	public Set<Detailbill> getDetailbills() {
		return this.detailbills;
	}

	public void setDetailbills(Set<Detailbill> detailbills) {
		this.detailbills = detailbills;
	}

}
