package com.java.musiconline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.java.musiconline.entities.SongOfUser;
import com.java.musiconline.entities.Songs;
import com.java.musiconline.entities.User;
import com.java.musiconline.entities.cart;
import com.java.musiconline.loginfb.RestFB;
import com.java.musiconline.service.songService;
import com.java.musiconline.service.userService;

@Controller
@RequestMapping(value = { "/", "index" })
/*@SessionAttributes("gmail") */ // ko dung de xu ly view
@SessionAttributes("cart")
public class index {

	@Autowired
	private RestFB restFb;
	@Autowired
	private songService songservice;
	@Autowired
	private userService uservice;

	/*
	 * @GetMapping public RedirectView getSong(RedirectAttributes model){
	 * 
	 * return new RedirectView("index"); }
	 */
	@GetMapping
	public String index( ModelMap model, HttpSession httpSession) {
		List<Songs> arr = new ArrayList<>();
		arr = songservice.getAllSong();
		
		
		for (Songs songs : arr) {
			System.out.println(songs.getIdSong());
		}
		model.addAttribute("listMusic", songservice.getAllSong());
		if (httpSession.getAttribute("gmail") != null) {
			String gmailUser = (String) httpSession.getAttribute("gmail");
			httpSession.setMaxInactiveInterval(60*60*24);
			model.addAttribute("gmailLogin", gmailUser);
			// lay song theo gmail session
			List<Object[]> arrSongSession = new ArrayList<>();
			arrSongSession = songservice.getAllBySessionUser(gmailUser);
			
			List<Songs> listSong = new ArrayList<>();
			User user = null;
			for (Object[] rows : arrSongSession) {
				SongOfUser songOfUser = (SongOfUser) rows[0];
				 user = (User) rows[1];
				 Songs song = (Songs)rows[2];
				listSong.add(song);
			}
			model.addAttribute("arrSongSession", listSong);
			model.addAttribute("sessionUser", user.getIdUser());
			model.addAttribute("sessionNameUser", user.getNameUser());
			for (Songs songs : listSong) {
				System.out.println( user.getGmail() +" : "+songs.getName());
			}
			if(httpSession.getAttribute("cart") != null){
				List<cart> arrCart = (List<cart>) httpSession.getAttribute("cart");
				model.addAttribute("countSongInCart", arrCart.size());
			}
		}
		
		
		return "index";
	}

	/*
	 * //@SessionAttribute xu ly view public String index1(Model
	 * model, @SessionAttribute("gamail") String gmail){
	 * System.out.println(gmail); return ""; }
	 */

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

	/*
	 * @PostMapping public String xlogin(@RequestParam("uname") String
	 * gmail,@RequestParam("pw")String pw){ User u = uservice.xlogin(gmail, pw);
	 * System.out.println(u.getGmail()+":"+u.getPassword()); if(u!=null){
	 * System.out.println("sucsess"); } return "redirect:/index"; }
	 */

	@GetMapping("/login-facebook")
	public String loginFacebook(HttpServletRequest request) {
		String code = request.getParameter("code");
		String accessToken = "";
		try {
			accessToken = restFb.getToken(code);
		} catch (IOException e) {
			return "index?facebook=error";
		}
		com.restfb.types.User user = restFb.getUserInfo(accessToken);
		UserDetails userDetail = restFb.buildUser(user);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/index";
	}

	@RequestMapping("/admin")
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
