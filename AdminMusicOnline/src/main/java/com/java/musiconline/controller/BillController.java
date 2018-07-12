package com.java.musiconline.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.musiconline.service.billService;
import com.java.musiconline.service.detailBillService;

@Controller
public class BillController {

	@Autowired
	private billService bService;
	
	@Autowired
	private detailBillService dbService;
	
	@RequestMapping(value = "/admin/page-bill", method = RequestMethod.GET)
	public String pageBill(ModelMap mm) {
		mm.addAttribute("arrBill", bService.getAllBill());
		
		return "page-bill";
	}
}
