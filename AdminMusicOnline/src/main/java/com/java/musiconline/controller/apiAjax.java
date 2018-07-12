package com.java.musiconline.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.musiconline.entities.Areas;
import com.java.musiconline.entities.Artists;
import com.java.musiconline.entities.Banks;
import com.java.musiconline.entities.Bill;
import com.java.musiconline.entities.Comment;
import com.java.musiconline.entities.Detailbill;
import com.java.musiconline.entities.Feels;
import com.java.musiconline.entities.ReplyComment;
import com.java.musiconline.entities.SongOfUser;
import com.java.musiconline.entities.Songs;
import com.java.musiconline.entities.Types;
import com.java.musiconline.entities.User;
import com.java.musiconline.entities.cart;
import com.java.musiconline.entities.json_comment;
import com.java.musiconline.entities.json_replycmt;
import com.java.musiconline.entities.json_songs;
import com.java.musiconline.entities.listReply_listCmt;
import com.java.musiconline.service.commentService;
import com.java.musiconline.service.detailBillService;
import com.java.musiconline.service.replyService;
import com.java.musiconline.service.songOfUserService;
import com.java.musiconline.service.songService;
import com.java.musiconline.service.userService;

@Controller
@RequestMapping("/api") // trang user
@SessionAttributes({"gmail","cart"})
public class apiAjax {

	@Autowired
	private userService uservice;
	@Autowired
	private songService songservice;

	@Autowired
	private songOfUserService souService;
	
	@Autowired
	private commentService cmtService;
	
	@Autowired
	private replyService replyService;
	
	@Autowired
	private detailBillService dbService;
	
	@Autowired
	private com.java.musiconline.service.billService billService;

	@GetMapping("getAllSongBySession")
	@ResponseBody
	public String getAllSongBySession(@RequestParam int idSong, @RequestParam int idUser, HttpSession httpSession,
			ModelMap model) {
		String html = "";
		if (httpSession.getAttribute("gmail") != null) {
			String gmailUser = (String) httpSession.getAttribute("gmail");

			// lay song theo gmail session
			List<Object[]> arrSongSession = new ArrayList<>();
			arrSongSession = songservice.getAllBySessionUser(gmailUser);

			List<Songs> listSong = new ArrayList<>();
			User user = null;
			for (Object[] rows : arrSongSession) {
				SongOfUser songOfUser = (SongOfUser) rows[0];
				user = (User) rows[1];
				Songs song = (Songs) rows[2];
				listSong.add(song);
			}
			model.addAttribute("arrSongSession", listSong);

			for (Songs songs : listSong) {
				System.out.println(user.getGmail() + " : " + songs.getName());
			}
			
			for (Songs songs : listSong) {
				html += "<a href='#' class='play' data-id='" + songs.getIdSong() + "' ";
				html += "data-album='" + songs.getCountListen() + "' ";
				html += "data-artist='" + songs.getName() + "' data-title='" + songs.getName() + "' ";
				html += "data-albumart='<c:url value='/resources/imgsong/" + songs.getCoverArtUrl() + "'/> '";
				html += "data-url='<c:url value='/resources/urlsong/" + songs.getUrl() + " '/> '>";
				html += "</a>";
			}

		}
		return html;
	}

	@GetMapping("xlogin")
	@ResponseBody
	public String xlogin(@RequestParam("gmail") String gmail, @RequestParam("password") String pw, ModelMap map,
			HttpSession httpSession) {
		User u = uservice.xlogin(gmail, pw);
		/*System.out.println(u.getGmail() + ":" + u.getPassword());*/

		if (u != null) {
			httpSession.setAttribute("gmail", gmail);
			map.addAttribute("gmail", gmail);

			return "true";
		}
		return "false";

	}

	@GetMapping("xlogout")
	@ResponseBody
	public String xlogout(HttpSession httpSession) {
		if (httpSession.getAttribute("gmail") != null) {
			httpSession.invalidate();
		}
		return "true";
	}

	@PostMapping("addSongOfUser")
	@ResponseBody
	public String addSongOfUser(@RequestParam int idSong, @RequestParam int idUser, HttpSession httpSession,
			ModelMap model) {
		String html = "";
		if (httpSession.getAttribute("gmail") != null) {
			if (souService.checkSongOfUser(idSong, idUser) == 0) {
				SongOfUser songOfUser = new SongOfUser();
				Songs s = new Songs();
				s.setIdSong(idSong);
				User u = new User();
				u.setIdUser(idUser);
				songOfUser.setSongs(s);
				songOfUser.setUser(u);
				int add = souService.addSongUser(songOfUser);
				if (add > 0) {

					/*String gmailUser = (String) httpSession.getAttribute("gmail");

					// lay song theo gmail session
					List<Object[]> arrSongSession = new ArrayList<>();
					arrSongSession = songservice.getAllBySessionUser(gmailUser);

					List<Songs> listSong = new ArrayList<>();
					User user = null;
					for (Object[] rows : arrSongSession) {
						songOfUser = (SongOfUser) rows[0];
						user = (User) rows[1];
						Songs song = (Songs) rows[2];
						listSong.add(song);
					}
						
					for (Songs songs : listSong) {
						html += "<a href='#' class='play' data-id='" + songs.getIdSong() + "' ";
						html += "data-album='" + songs.getCountListen() + "' ";
						html += "data-artist='" + songs.getName() + "' data-title='" + songs.getName() + "' ";
						html += "data-albumart='<c:url value='/resources/imgsong/" + songs.getCoverArtUrl() + "'/> '";
						html += "data-url='<c:url value='/resources/urlsong/" + songs.getUrl() + "'/> '>";
						html += "</a>";
					}*/

					return "addnew";
				} else {
					return "adderror";
				}
			} else {
				return "existssong";
			}

		}
		return "usernull";
	}

	@PostMapping("deleteSongOfUser")
	@ResponseBody
	public String deleteSongOfUser(@RequestParam int idSong, @RequestParam int idUser, HttpSession httpSession) {
		if (httpSession.getAttribute("gmail") != null) {
			SongOfUser songOfUser = new SongOfUser();
			Songs s = new Songs();
			s.setIdSong(idSong);
			User u = new User();
			u.setIdUser(idUser);
			songOfUser.setSongs(s);
			songOfUser.setUser(u);
			int delete = souService.deleteSongOfUser(idSong, idUser);
			if (delete > 0) {
				return "delete";
			} else {
				return "deleteError";
			}
		}
		return "usernull";
	}
	@PostMapping("updateCountListen")
	@ResponseBody
	public String updateCountListen(@RequestParam int id_song){
		int update = songservice.countListen(id_song);
		if(update>0){
			return "update";
		}
		return "error";
	}
	@GetMapping(path="search",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<json_songs> tk(@RequestParam String tk,ModelMap model){
		json_songs js = null;
		List<json_songs> list_jsonSong = new ArrayList<>();
		List<Songs> list_song = new ArrayList<>();
		list_song = songservice.search(tk);
		for (Songs song : list_song) {
			js = new json_songs();
			
			js.setIdSong(song.getIdSong());
			js.setName(song.getName());
			
			Areas areas = new Areas();
			areas.setIdAreas(song.getAreas().getIdAreas());
			areas.setNameArea(song.getAreas().getNameArea());
			js.setAreas(areas);
			
			Artists artists = new Artists();
			artists.setIdArtis(song.getArtists().getIdArtis());
			artists.setNameArtis(song.getArtists().getNameArtis());
			js.setArtists(artists);
			
			js.setAuthor(song.getAuthor());
			js.setCoverArtUrl(song.getCoverArtUrl());
			js.setDateUpdate(song.getDateUpdate());
			System.out.println(song.getDateUpdate());
			Types types = new Types();
			types.setIdType(song.getTypes().getIdType());
			types.setNameType(song.getTypes().getNameType());
			js.setTypes(types);
			
			js.setUrl(song.getUrl());
			js.setCountListen(song.getCountListen());
			list_jsonSong.add(js);
		}

		for (json_songs songs : list_jsonSong) {
			System.out.println(" tim kiem json_songs: " + songs.getName());
		}
		for (Songs songs : list_song) {
			System.out.println(" tim kiem songs: " + songs.getName());
		}
		
			model.addAttribute("listSongss", list_jsonSong);
		
		return list_jsonSong;
	}
	// them comment
	@PostMapping("addComment")
	@ResponseBody
	public String addComment(@RequestParam int id,@RequestParam String comment_name,@RequestParam String comment_mess, @RequestParam String datetime){
		Comment c = new Comment();
		Songs songs = new Songs();
		songs.setIdSong(id);
		c.setSongs(songs);
		Feels feels = new Feels();
		feels.setIdFeels(1);
		c.setFeels(feels);
		c.setNameComment(comment_name);
		c.setContext(comment_mess);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date dateUtil = null;
		try {
			dateUtil = dateFormat.parse(datetime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dateSql = new Date(dateUtil.getTime());
		c.setTimes(dateSql);
		int add = cmtService.addComment(c);
		if(add>0){
			return "true";
		}
		return "false";
		
	}
	// hien thi comment theo id song
	@GetMapping(path="displayCommentbyid",produces="application/json;charset=utf-8")
	@ResponseBody
	public List<json_comment> getAllCommentByIdSong(@RequestParam int id_song_comment,ModelMap mm){
		List<Comment> arr = new ArrayList<>();
		List<json_comment> json_arr = new ArrayList<>();
		json_comment jc = null;
		arr = cmtService.getAllCommentByIdSong(id_song_comment);
		
		for (Comment c : arr) {
			jc = new json_comment();
			jc.setIdComment(c.getIdComment());
			jc.setNameComment(c.getNameComment());
			jc.setContext(c.getContext());
			jc.setTimes(c.getTimes());
			
			Feels f = new Feels();		
			f.setIdFeels(c.getFeels().getIdFeels());
			jc.setFeels(f);
			
			json_arr.add(jc);
		}
		for (json_comment json_comment : json_arr) {
			System.out.println("json_comment "+ json_comment.getNameComment());
		}
		for (Comment c : arr) {
			System.out.println("Name "+ c.getNameComment());
		}
		
		return json_arr;
	}
	
	@GetMapping(path="displayCommentbyidHtml")
	@ResponseBody
	public String getAllCommentByIdSongHtml(@RequestParam int id_song_comment,ModelMap mm){
		List<Comment> arr = new ArrayList<>();
		List<json_comment> json_arr = new ArrayList<>();
		json_comment jc = null;
		List<ReplyComment> replyArray = new ArrayList<>();
		arr = cmtService.getAllCommentByIdSong(id_song_comment);
		
		/*replyArray = replyService.getReplyCommentByIdCmt(id);*/
		for (Comment c : arr) {
			System.out.println("Name "+ c.getNameComment());
		}
		String html ="";
		if(arr.size()==0){
			
		}else{
		for(int i=0;i<arr.size();i++){
			html += "<li>";
					html +=	 "<img src='/musiconline/resources/album-art/userimg.png' width='70px'>";
					html += " <div><p>";
					html += " "+arr.get(i).getNameComment()+"<b><small> &nbsp; "+arr.get(i).getTimes()+" &nbsp;<a href='#' data-idcmt='"+arr.get(i).getIdComment() +"' class='a-reply'>Reply</a></small></b>";
					html += " </p>";
					html += "<p>"+arr.get(i).getContext()+"</p>";
					html += "</div>";
					// noi dung tra loi
					replyArray = replyService.getReplyCommentByIdCmt(arr.get(i).getIdComment());
				
					html += "<ul class='reply-context-comment-ul"+arr.get(i).getIdComment()+"' '>";
					for(int j =0;j<replyArray.size();j++){	
					html += "<li>";
					html += "<img src='/musiconline/resources/album-art/userimg.png' width='55px'>";
					html += "<div>";
					html += "<p>";
					html += " "+replyArray.get(j).getRepName()+" &nbsp;<b><small>"+replyArray.get(j).getRepDates()+"</small></b>";
					html += "</p>";
					html += "<p>"+replyArray.get(j).getRepComtext()+"</p>";
					html += " </div>";
					html += " </li>";
					}
					html += "  </ul>";
				
					// form tra loi
					html += " <fieldset class='replycomment"+arr.get(i).getIdComment()+"' style='display:none'>";
					html += " <legend>Reply Comment</legend>";
					
					html += " <table>";
					html += " <tr>";
					html += " <td>Name</td>";
					html +=" <td><input type='text' size='25' class='name-reply-cmt"+arr.get(i).getIdComment() +"' ></td>";
					html += " </tr>";
					html += "  <tr>";
					html += " <td>Message</td>";
					html += "  <td><textarea cols='60' class='context-reply-cmt"+arr.get(i).getIdComment()+"' rows='5'></textarea></td>";
					html += " </tr>";
					html += " <tr>";
					html += " <td></td>";
					html += " <td><button class='rep_cmt_submit' data-comid="+arr.get(i).getIdComment()+" size='25' >Reply</button></td>";
					html += " </tr>";
					html += " </table>";
					
					html += " </fieldset>";
					html += " </li>";
					
				}
		}
		
		
		return html;
	}
	
	@GetMapping(path="addcart")
	@ResponseBody
	public void addcart(@RequestParam int idSong_addCart,@RequestParam int idUser_addCart,@RequestParam String nameUser,@RequestParam String nameSong,HttpSession httpSession){
		if(httpSession.getAttribute("gmail") != null){
			if(null == httpSession.getAttribute("cart")){
				List<cart> arrCart = new ArrayList<>();
				cart cart = new cart();
				cart.setIdSong(idSong_addCart);
				cart.setIdUser(idUser_addCart);
				cart.setNameSong(nameSong);
				cart.setNameUser(nameUser);
				cart.setCountSong(1);
				cart.setPrice("120.000");
				arrCart.add(cart);
				httpSession.setAttribute("cart", arrCart);
			}else{
				List<cart> arrSessionCart = (List<cart>) httpSession.getAttribute("cart"); 
				int vt = checkExistsCart(arrSessionCart,idSong_addCart);
				if(vt ==-1){
				cart cart = new cart();
				cart.setIdSong(idSong_addCart);
				cart.setIdUser(idUser_addCart); // chính xác là phải là danh sách bài hát của user đó
				cart.setNameSong(nameSong);
				cart.setNameUser(nameUser);
				cart.setPrice("120.000");
				cart.setCountSong(1);
				arrSessionCart.add(cart);
				}else{
					List<cart> SessionCart = (List<cart>) httpSession.getAttribute("cart"); 
					int soluongmoi = SessionCart.get(vt).getCountSong()+1;
					SessionCart.get(vt).setCountSong(soluongmoi);
					/*arrSessionCart.get(vt).setCountSong(arrSessionCart.get(vt).getCountSong()+1);*/
				}
			}
			List<cart> arrSessionCart = (List<cart>) httpSession.getAttribute("cart"); 
			for (cart cart : arrSessionCart) {
				System.out.println(cart.getNameSong() +"-"+cart.getPrice());
			}
			System.out.println("Size "+ arrSessionCart.size());
		}
	}
	
	@GetMapping(path="capnhatCart")
	@ResponseBody
	public String capnhatCart(@RequestParam int idSong,@RequestParam int parseSoluong,HttpSession http){
		if(http.getAttribute("gmail") != null){
			if(http.getAttribute("cart") != null){
				List<cart> arr = (List<cart>) http.getAttribute("cart");
				int vt = checkExistsCart(arr,idSong);
				if(vt != -1){
					arr.get(vt).setCountSong(parseSoluong);
				}
			}
		}
		
		return "";
	}
	
	@GetMapping(path="xoaCart")
	@ResponseBody
	public String xoaCart(@RequestParam int idSong,HttpSession http){
		if(http.getAttribute("gmail") != null){
			if(http.getAttribute("cart") != null){
				List<cart> arr = (List<cart>) http.getAttribute("cart");
				int vt = checkExistsCart(arr,idSong);
				if(vt != -1){
					arr.remove(vt);
				}
			}
		}
		return "";
	}
	
	
	
	public int checkExistsCart(List<cart> arrSessionCart,int idSong_addCart){
		for(int i=0;i<arrSessionCart.size();i++){
			if(arrSessionCart.get(i).getIdSong() == idSong_addCart ){
				return i;
			}
			
		}
		return -1;
	}
	
	@GetMapping("countSongCart")
	@ResponseBody
	public String countSongCart(HttpSession http){
		List<cart> arr = (List<cart>) http.getAttribute("cart");
		int count = arr.size();
		return count+"";
	}
	
	@PostMapping("addReplyComment")
	@ResponseBody
	public String addReplyCmt(@RequestParam int id_reply,@RequestParam String name_reply_cmt,@RequestParam String context_reply_cmt, @RequestParam String datetime){
		ReplyComment replycmt = new ReplyComment();
		Comment cmt = new Comment();
		cmt.setIdComment(id_reply);
		replycmt.setComment(cmt);
		Feels feels = new Feels();
		feels.setIdFeels(1);
		replycmt.setFeels(feels);
		replycmt.setRepName(name_reply_cmt);
		replycmt.setRepComtext(context_reply_cmt);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date dateUtil = null;
		try {
			dateUtil = dateFormat.parse(datetime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dateSql = new Date(dateUtil.getTime());
		replycmt.setRepDates(dateSql);
		int add = replyService.addReplyCmt(replycmt);
		if(add>0){
			return "true";
		}
		return "false";
	}
	
	@GetMapping("getAllDetailBillByIdBil")
	@ResponseBody
	public String getAllDetailBillByIdBill(int idBill){
		
		List<Detailbill> arr = new ArrayList<>();
		arr = dbService.getAllDetailByIdBill(idBill);
		String html="";

			for(int i=0;i<arr.size();i++){
		html +="<tr>";
		html +="<td>"+arr.get(i).getBill().getIdBill()+"</td>";
		html +="<td>"+arr.get(i).getUser().getNameUser()+"</td>";
		html +="<td>"+arr.get(i).getSongs().getName()+"</td>";
		html +="<td>"+arr.get(i).getCountSong()+"</td>";
		html += "<td>"+arr.get(i).getPrice()+"</td>";
		html +="</tr>";
			}
		html +="<script type='text/javascript'>";
		html +="$(document).ready(function() {";
				
		html +="$('#Table_DetailBillAdmin').DataTable();"; 
		html +="});";
		html +="</script>";

		return html;
	}
	
	@PostMapping("deleteBill")
	@ResponseBody
	public String deleteBill(@RequestParam int idBill){
		
		billService.deleteBill(idBill);
		
		return "";
	}
	
	@PostMapping("updateStateBill")
	@ResponseBody
	public String updateStateBill(@RequestParam int idBill,@RequestParam int satesBill){
		
		billService.updateStateBill(idBill, satesBill);
		
		return "";
	}
	@PostMapping("sendGmail")
	@ResponseBody
	public String sendGmail(String text_input){
		User user = new User();
		if(uservice.sendGmail(text_input) != null){
			user = uservice.sendGmail(text_input);
			return user.getPassword();
		}
		return "";
	}
	
}
