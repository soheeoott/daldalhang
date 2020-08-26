package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MAPService;
import vo.LlmapVO;

@Controller
public class LlmapController {

	@Autowired
	MAPService service;
	
	@RequestMapping(value="/maplist")
	public ModelAndView maplist(ModelAndView mv) {
		
		List<LlmapVO> maplist = service.selectList();
		
		if(maplist != null) {
			mv.addObject("storeList", maplist);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("findAStore/findAStore");
		return mv;
	}	
}
