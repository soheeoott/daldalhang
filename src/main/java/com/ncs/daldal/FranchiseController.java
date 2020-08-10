package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.FRService;
import service.MAPService;
import service.PDService;
import vo.FranchiseVO;
import vo.LlmapVO;
import vo.ProductVO;

@Controller
public class FranchiseController {

	@Autowired
	FRService frservice;
	
	@Autowired
	MAPService mservice;
	
	@Autowired
	PDService pdservice;
	
	@RequestMapping(value="/franchiseSortList")
	public ModelAndView franchiseSortList(ModelAndView mv, String keyword) throws Exception{
	    
		System.out.println("keyword => " + keyword);
		
		List<ProductVO> htlist = pdservice.hashtagAll(keyword);
		
		// 레코드의 갯수
	    int count = pdservice.hashtagCount(keyword);
	    
	    mv.addObject("htlist", htlist);
	    
	    System.out.println("htlist =>" + htlist.get(0));
	    
	    mv.addObject("count", count);
	    mv.setViewName("product/hashtagList");
	    
	    return mv;
	}
	
	@RequestMapping(value="/flist")
	public ModelAndView flist(ModelAndView mv) {
		
		List<FranchiseVO> list = frservice.selectList();
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
	
	@RequestMapping(value="/frlist")
	public ModelAndView frlist(ModelAndView mv) {
		
		List<FranchiseVO> frlist = frservice.selectList();
		
		if(frlist != null) {
			mv.addObject("frlist", frlist);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("franchise/franchiseList");
		return mv;
	}
}
