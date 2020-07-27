package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.FRService;
import vo.FranchiseVO;

@Controller
public class FranchiseController {

	@Autowired
	FRService service;
	
	@RequestMapping(value="/flist")
	public ModelAndView flist(ModelAndView mv) {
		
		List<FranchiseVO> list = service.selectList();
		
		if(list != null) {
			mv.addObject("franchiseList", list);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("findAStore/findAStore");
		return mv;
	}
}
