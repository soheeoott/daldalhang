package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MAPService;
import service.MUService;
import vo.LlmapVO;
import vo.MenuVO;

@Controller
public class LlmapController {

	@Autowired
	MAPService mservice;
	
	@RequestMapping(value="/maplist")
	public ModelAndView maplist(ModelAndView mv) throws Exception {
		
		List<LlmapVO> maplist = mservice.selectList();		 
		
		if(maplist != null) {
			mv.addObject("storeList", maplist);
			 
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("findAStore/findAStore");
		return mv;
	}	
	
	// 브랜드명으로 매장찾기
	@RequestMapping(value="/mapBSearch")
	public ModelAndView mapBSearch(ModelAndView mv, String mapBKeyword) throws Exception {
	  
		List<LlmapVO> maplist = mservice.mapBSearch(mapBKeyword);	
		System.out.println("mapBKeyword => "+mapBKeyword);
		
		mv.addObject("storeList", maplist);
		System.out.println("BstoreList => "+maplist);
		
	//			mv.setViewName("jsonView");
		mv.setViewName("findAStore/findAStore");
		return mv;
	}
	
	// 매장명으로 매장찾기
	@RequestMapping(value="/mapFSearch")
	public ModelAndView mapFSearch(ModelAndView mv, String mapFKeyword) throws Exception {
	
		List<LlmapVO> maplist = mservice.mapFSearch(mapFKeyword);	
		System.out.println("mapFKeyword => "+mapFKeyword);
		
		mv.addObject("storeList", maplist);
		System.out.println("FstoreList => "+maplist);
		
	//			mv.setViewName("jsonView");
		mv.setViewName("findAStore/findAStore");
		return mv;
	}
}
