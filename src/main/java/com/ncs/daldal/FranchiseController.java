package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.FRService;
import service.MAPService;
import vo.FranchiseVO;
import vo.LlmapVO;

@Controller
public class FranchiseController {

	@Autowired
	FRService service;
	@Autowired
	MAPService mservice;
	
	@RequestMapping(value="/flist")
	public ModelAndView flist(ModelAndView mv) {
		
		List<FranchiseVO> list = service.selectList();
		List<LlmapVO> slist = mservice.selectList();
		
		if(list != null || slist != null) {
			mv.addObject("franchiseList", list);
			mv.addObject("storeList", slist);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("findAStore/findAStore");
		return mv;
	}
}
