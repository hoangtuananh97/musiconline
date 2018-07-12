package com.java.musiconline.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.musiconline.entities.Songs;
import com.java.musiconline.loginfb.RestFB;
import com.java.musiconline.service.songService;

@Controller
@RequestMapping(value = { "/admin", "/indexadmin" })
public class indexAdmin {

	@Autowired
	private songService songservice;
	
	@Autowired
	private RestFB restFb;
	
	

	@GetMapping
	public String index(Model model) {
		List<Songs> arr = songservice.getAllSong();
		
		System.out.println(arr);
		model.addAttribute("listSong", songservice.getAllSong());
		return "indexadmin";
	}

	/*
	 * @RequestMapping(value = {"/login" }) public ModelAndView
	 * login(@RequestParam(required = false) String message, Model model) {
	 * ModelAndView andView = new ModelAndView("login"); if (message != null &&
	 * !message.isEmpty()) { if (message.equals("logout")) {
	 * model.addAttribute("message", "Logout!"); } if (message.equals("error"))
	 * { model.addAttribute("message", "Login Failed!"); } if
	 * (message.equals("facebook_denied")) { model.addAttribute("message",
	 * "Login by Facebook Failed!"); } } return andView; }
	 */
	@RequestMapping("/login-facebook")
	public String loginFacebook(HttpServletRequest request) {
		String code = request.getParameter("code");
		String accessToken = "";
		try {
			accessToken = restFb.getToken(code);
		} catch (IOException e) {
			return "login?facebook=error";
		}
		com.restfb.types.User user = restFb.getUserInfo(accessToken);
		UserDetails userDetail = restFb.buildUser(user);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/index";
	}

	@RequestMapping("/adminnn")
	public String admin() {

		return "admin";
	}

	@RequestMapping("/user")
	public ModelAndView user() {
		ModelAndView view = new ModelAndView("user");
		return view;
	}

	@RequestMapping("/403")
	public String accessDenied() {
		return "403";

	}
}
