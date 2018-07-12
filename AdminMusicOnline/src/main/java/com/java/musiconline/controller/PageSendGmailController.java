package com.java.musiconline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page-SendGmail")
public class PageSendGmailController {

	@GetMapping
	public String formSend(){
		return "page-sendgmail";
	}
}
