package com.java.musiconline.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page-addsong")
public class PageAddSong {
	
	@Autowired
	ServletContext servletContext;
	
	
	@GetMapping
	public String addnew(){
		return "page-addsong";
	}
	
}
