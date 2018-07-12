package com.java.musiconline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.musiconline.entities.Banks;
import com.java.musiconline.entities.Bill;
import com.java.musiconline.entities.Detailbill;
import com.java.musiconline.entities.Songs;
import com.java.musiconline.entities.User;
import com.java.musiconline.entities.cart;
import com.java.musiconline.service.bankService;
import com.java.musiconline.service.detailBillService;

@Controller
@SessionAttributes({"gmail","cart"})
public class cartController {

	@Autowired
	private bankService bService;
	
	@Autowired
	private detailBillService dbService;
	
	@Autowired
	private com.java.musiconline.service.billService billService;
	
	@RequestMapping(value="page-cart", method = RequestMethod.GET)
	public String pagecart(HttpSession httpSession,ModelMap mm){
		if(httpSession.getAttribute("cart") !=null){
			List<cart> arrCart = (List<cart>) httpSession.getAttribute("cart");
			mm.addAttribute("arrCart", arrCart);
			mm.addAttribute("arrBank", bService.getAllBank());
		}
		return "page-cart";
	}
	@RequestMapping(value="page-thank", method = RequestMethod.GET)
	public String thank(){
		return "page-thank";
	}
	// thêm hóa đơn Bill
		
		@RequestMapping(value="addBill", method = RequestMethod.POST)
		public String addBill(HttpSession http,@RequestParam int banks,@RequestParam String tennguoi,
				@RequestParam  String sdt,@RequestParam String diachi,@RequestParam String tongtien){
			if(http.getAttribute("gmail") != null){
				if(http.getAttribute("cart") != null){
					List<cart> arr = (List<cart>) http.getAttribute("cart");
					Bill bill = new Bill();
					Banks bank = new Banks();
					bank.setIdBank(banks);
					bill.setBanks(bank);
					bill.setNameCus(tennguoi);
					bill.setPhone(sdt);
					bill.setAddress(diachi);
					bill.setSummoney(tongtien);
				    java.util.Date date=new java.util.Date();
			            
			        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			        java.sql.Timestamp sqlTime=new java.sql.Timestamp(date.getTime());
			       
			      bill.setDates(sqlTime);
			       System.out.println(bill.getSummoney()+" "+ bill.getDates());
			       System.out.println(bill.toString()); 
					if(billService.addBill(bill)>0){
						System.out.println("thêm");
						for (cart cart : arr) {
							Detailbill db = new Detailbill();
							Bill b = new Bill();
							b.setIdBill(bill.getIdBill());
							db.setBill(b);
							Songs songs = new Songs();
							songs.setIdSong(cart.getIdSong());
							db.setSongs(songs);
							User user = new User();
							user.setIdUser(cart.getIdUser());
							db.setUser(user);
							db.setCountSong(cart.getCountSong());
							db.setPrice(cart.getPrice());
							
							dbService.addDetailBill(db);
							
						}
					}else{
						
					}
					
				}
			}
			
			return "redirect:page-thank";
		}
}
