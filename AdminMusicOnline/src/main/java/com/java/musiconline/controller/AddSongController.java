package com.java.musiconline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.musiconline.entities.Songs;
import com.java.musiconline.service.areasService;
import com.java.musiconline.service.aristsService;
import com.java.musiconline.service.songService;
import com.java.musiconline.service.typeService;

@Controller
@RequestMapping("/admin/addnewsong")
public class AddSongController {

	@Autowired
	private songService songservice;

	@Autowired
	private aristsService aristsservice;

	@Autowired
	private areasService areasService;

	@Autowired
	private typeService typeService;

	@GetMapping
	public String addnewsong(ModelMap model) {
		List<Songs> arr = songservice.getAllSong();
		System.out.println(arr);
		model.addAttribute("listSongs", songservice.getAllSong());
		model.addAttribute("listarists", aristsservice.getAllArists());
		model.addAttribute("listAreas", areasService.getAllAreas());
		model.addAttribute("listType", typeService.getAllType());
		return "page-addsong";
	}
}
