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
	
		// 매장명/주소로 찾기
		@RequestMapping(value="/mapSearch")
		public ModelAndView mapSearch(ModelAndView mv, String searchOption, String keyword) throws Exception{
		  
		List<LlmapVO> maplist = mservice.mapSearch(searchOption, keyword);
		
		// 데이터를 맵에 저장
/*		Map<String, Object> mmap = new HashMap<String, Object>();
		mmap.put("storeList", maplist);
		mmap.put("searchOption", searchOption);
		mmap.put("keyword", keyword);
		mv.addObject("storeList", mmap);*/
		
		System.out.println("searchOption => "+searchOption+", keyword => "+keyword);
		mv.addObject("storeList", maplist);
		System.out.println("storeList => "+maplist);
		
		mv.setViewName("findAStore/findAStore");
		  
		return mv;
	  }	
}
