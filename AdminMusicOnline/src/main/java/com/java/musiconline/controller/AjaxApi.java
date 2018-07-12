package com.java.musiconline.controller;

import java.awt.geom.Area;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.musiconline.dao.aristsDao;
import com.java.musiconline.entities.Areas;
import com.java.musiconline.entities.Artists;
import com.java.musiconline.entities.Songs;
import com.java.musiconline.entities.Types;
import com.java.musiconline.entities.json_songs;
import com.java.musiconline.service.songService;

@Controller
@RequestMapping("/api") // trang admin
public class AjaxApi {

	@Autowired
	ServletContext servletContext;
	@Autowired
	songService songservice;

	@PostMapping("uploadfilesong")
	@ResponseBody
	public String uploadfilesong(MultipartHttpServletRequest httpServletRequest) {
		String path_file = servletContext.getRealPath("/resources/assets/urlsong/");
		Iterator<String> listFile = httpServletRequest.getFileNames();
		MultipartFile multipartFile = httpServletRequest.getFile(listFile.next());
		File file_save = new File(path_file + multipartFile.getOriginalFilename());
		try {
			multipartFile.transferTo(file_save);

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(file_save);
		return "true";
	}

	@PostMapping("uploadfileimg")
	@ResponseBody
	public String uploadfilesImg(MultipartHttpServletRequest httpServletRequest) {
		String path_file = servletContext.getRealPath("/resources/assets/imgsong/");
		Iterator<String> listFile = httpServletRequest.getFileNames();
		MultipartFile multipartFile = httpServletRequest.getFile(listFile.next());
		File file_save = new File(path_file + multipartFile.getOriginalFilename());
		try {
			multipartFile.transferTo(file_save);
			

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(file_save);
		return "true";
	}

	@PostMapping("deletesong")
	@ResponseBody
	public void deletesong(@RequestParam int id){
		if(songservice.deleteSong(id)>0){
			System.out.println("delete done");
		}
	}
	
	@PostMapping(path="updatesong",produces="application/json;charset=utf-8")
	@ResponseBody
	public json_songs updateSong(@RequestParam int id){
		json_songs js = new json_songs();
		Songs song = songservice.getAllbyId(id);
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
		return js;
	}
	
	
	
	@PostMapping("addsong")
	@ResponseBody
	public String addsong(@RequestParam String datajson,ModelMap model) {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonObject = null;
		try {
			jsonObject = mapper.readTree(datajson);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String name = jsonObject.get("name").asText();
		String url = jsonObject.get("url").asText();
		int idArists = jsonObject.get("idArists").asInt();
		int idAreas = jsonObject.get("idAreas").asInt();
		int idType = jsonObject.get("idType").asInt();
		String author = jsonObject.get("author").asText();
		String coverArtUrl = jsonObject.get("coverArtUrl").asText();

		String dateUpdate = jsonObject.get("dateUpdate").asText();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date dateUtil = null;
		try {
			dateUtil = dateFormat.parse(dateUpdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dateSql = new Date(dateUtil.getTime());
		
		
		/*int countListen = jsonObject.get("countListen").asInt();*/
		Songs song = new Songs();
		Areas areas = new Areas();
		Artists artists = new Artists();
		Types types = new Types();
		song.setName(name);
		song.setUrl(url);

		areas.setIdAreas(idAreas);
		song.setAreas(areas);

		artists.setIdArtis(idArists);
		song.setArtists(artists);

		types.setIdType(idType);
		song.setTypes(types);

		song.setAuthor(author);
		song.setCoverArtUrl(coverArtUrl);
		song.setDateUpdate(dateSql);
		/*song.setCountListen(countListen);*/
		System.out.println("Date: "+ dateSql);
		List<Songs> arrListSong = new ArrayList<>();
		if(songservice.addNewSong(song)>0){
			System.out.println("thành công");
			
			return "true";
		}
		return "false";

	}
	
	@PostMapping("capnhatbaihat")
	@ResponseBody
	public void capnhatbaihat(@RequestParam String datajson) {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonObject = null;
		try {
			jsonObject = mapper.readTree(datajson);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int idSong = jsonObject.get("idSong").asInt();
		String name = jsonObject.get("name").asText();
		String url = jsonObject.get("url").asText();
		int idArists = jsonObject.get("idArists").asInt();
		int idAreas = jsonObject.get("idAreas").asInt();
		int idType = jsonObject.get("idType").asInt();
		String author = jsonObject.get("author").asText();
		String coverArtUrl = jsonObject.get("coverArtUrl").asText();

		String dateUpdate = jsonObject.get("dateUpdate").asText();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date dateUtil = null;
		try {
			dateUtil = dateFormat.parse(dateUpdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dateSql = new Date(dateUtil.getTime());
		
		
		/*int countListen = jsonObject.get("countListen").asInt();*/
		Songs song = new Songs();
		Areas areas = new Areas();
		Artists artists = new Artists();
		Types types = new Types();
		
		song.setIdSong(idSong);
		song.setName(name);
		song.setUrl(url);

		areas.setIdAreas(idAreas);
		song.setAreas(areas);

		artists.setIdArtis(idArists);
		song.setArtists(artists);

		types.setIdType(idType);
		song.setTypes(types);

		song.setAuthor(author);
		song.setCoverArtUrl(coverArtUrl);
		song.setDateUpdate(dateSql);
		/*song.setCountListen(countListen);*/
		System.out.println("Date: "+ dateSql);
		songservice.updateSong(song);
		System.out.println("Update Success");
	}

}
