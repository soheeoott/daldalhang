package com.ncs.daldal;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MAPService;
import vo.LlmapVO;

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
	public ModelAndView mapBSearch(ModelAndView mv, String mapBKeyword, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");

		List<LlmapVO> maplist = mservice.mapBSearch(mapBKeyword);	

		if(maplist != null) {
			mv.addObject("storeList", maplist);
		} else {
			mv.addObject("fCode", "000");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	// 매장명으로 매장찾기
	@RequestMapping(value="/mapFSearch")
	public ModelAndView mapFSearch(ModelAndView mv, String mapFKeyword, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");

		List<LlmapVO> maplist = mservice.mapFSearch(mapFKeyword);

		if(maplist != null) {
			mv.addObject("storeList", maplist);
		} else {
			mv.addObject("fCode", "000");
		}
		mv.setViewName("jsonView");
		return mv;
	}
}
