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
 * Areas generated by hbm2java
 */
@Entity
@Table(name = "areas", catalog = "musiconline")
public class Areas implements java.io.Serializable {

	private Integer idAreas;
	private String nameArea;
	private Set<Songs> songses = new HashSet<Songs>(0);

	public Areas() {
	}

	public Areas(String nameArea) {
		this.nameArea = nameArea;
	}

	public Areas(String nameArea, Set<Songs> songses) {
		this.nameArea = nameArea;
		this.songses = songses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idAreas", unique = true, nullable = false)
	public Integer getIdAreas() {
		return this.idAreas;
	}

	public void setIdAreas(Integer idAreas) {
		this.idAreas = idAreas;
	}

	@Column(name = "nameArea", nullable = false, length = 200)
	public String getNameArea() {
		return this.nameArea;
	}

	public void setNameArea(String nameArea) {
		this.nameArea = nameArea;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "areas")
	public Set<Songs> getSongses() {
		return this.songses;
	}

	public void setSongses(Set<Songs> songses) {
		this.songses = songses;
	}

}
