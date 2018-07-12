package com.java.musiconline.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dosendgmail")
public class DoSendGmail {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@PostMapping
	public String doSendGmail(HttpServletRequest request){
		String recipientAddress = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		// prints debug info
		System.out.println("To: " + recipientAddress);
		System.out.println("Subject: " + subject);
		System.out.println("Message: " + message);

		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(recipientAddress);
		email.setSubject(subject);
		email.setText(message);
		System.out.println("1");
		// sends the e-mail
		mailSender.send(email);
		System.out.println("2");
		// forwards to the view named "Result"
		return "redirect:page-thank";
	}
}
