package com.java.musiconline.entities;
// Generated Jun 25, 2018 7:49:38 AM by Hibernate Tools 4.3.1.Final

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user", catalog = "musiconline", uniqueConstraints = @UniqueConstraint(columnNames = "gmail"))
public class User implements java.io.Serializable {

	private Integer idUser;
	private String nameUser;
	private String gmail;
	private String password;
	private Set<UserRole> userRoles = new HashSet<UserRole>(0);
	private Set<SongOfUser> songOfUsers = new HashSet<SongOfUser>(0);
	private Set<Detailbill> detailbills = new HashSet<Detailbill>(0);

	public User() {
	}

	public User(String nameUser, String gmail, String password) {
		this.nameUser = nameUser;
		this.gmail = gmail;
		this.password = password;
	}

	public User(String nameUser, String gmail, String password, Set<UserRole> userRoles, Set<SongOfUser> songOfUsers,
			Set<Detailbill> detailbills) {
		this.nameUser = nameUser;
		this.gmail = gmail;
		this.password = password;
		this.userRoles = userRoles;
		this.songOfUsers = songOfUsers;
		this.detailbills = detailbills;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idUser", unique = true, nullable = false)
	public Integer getIdUser() {
		return this.idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	@Column(name = "nameUser", nullable = false)
	public String getNameUser() {
		return this.nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	@Column(name = "gmail", unique = true, nullable = false)
	public String getGmail() {
		return this.gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	@Column(name = "password", nullable = false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	public Set<UserRole> getUserRoles() {
		return this.userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	public Set<SongOfUser> getSongOfUsers() {
		return this.songOfUsers;
	}

	public void setSongOfUsers(Set<SongOfUser> songOfUsers) {
		this.songOfUsers = songOfUsers;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
	public Set<Detailbill> getDetailbills() {
		return this.detailbills;
	}

	public void setDetailbills(Set<Detailbill> detailbills) {
		this.detailbills = detailbills;
	}
	 @Transient
	  public List<GrantedAuthority> getAuthorities() {
	    List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    for (UserRole usersRoles: this.userRoles) {
	      authorities.add((GrantedAuthority) new SimpleGrantedAuthority(usersRoles.getRole().getNameRole()));
	    }
	    return authorities;
	  
	 }
}
