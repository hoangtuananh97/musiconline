package com.java.musiconline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("detail-song")
public class detailSongController {

	@GetMapping
	public String detailSong() {
		return "detail-song";
	}
}
