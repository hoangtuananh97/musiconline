package com.java.musiconline.entities;
// Generated Jun 25, 2018 7:49:38 AM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Artists generated by hbm2java
 */
@Entity
@Table(name = "artists", catalog = "musiconline")
public class Artists implements java.io.Serializable {

	private Integer idArtis;
	private String nameArtis;
	private Set<Songs> songses = new HashSet<Songs>(0);

	public Artists() {
	}

	public Artists(String nameArtis) {
		this.nameArtis = nameArtis;
	}

	public Artists(String nameArtis, Set<Songs> songses) {
		this.nameArtis = nameArtis;
		this.songses = songses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idArtis", unique = true, nullable = false)
	public Integer getIdArtis() {
		return this.idArtis;
	}

	public void setIdArtis(Integer idArtis) {
		this.idArtis = idArtis;
	}

	@Column(name = "nameArtis", nullable = false, length = 200)
	public String getNameArtis() {
		return this.nameArtis;
	}

	public void setNameArtis(String nameArtis) {
		this.nameArtis = nameArtis;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "artists")
	public Set<Songs> getSongses() {
		return this.songses;
	}

	public void setSongses(Set<Songs> songses) {
		this.songses = songses;
	}

}
