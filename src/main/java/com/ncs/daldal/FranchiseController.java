package com.ncs.daldal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.FRService;
import service.MAPService;
import service.MUService;
import service.PDService;
import vo.FranchiseVO;
import vo.LlmapVO;
import vo.MenuVO;
import vo.ProductVO;

@Controller
public class FranchiseController {

	@Autowired
	FRService frservice;
	
	@Autowired
	MAPService mservice;
	
	@Autowired
	PDService pdservice;
	
	@Autowired
	MUService muservice;
	
	@RequestMapping(value="/franchiseSubList")
	public ModelAndView franchiseSubList(ModelAndView mv, String mname, String frcode) throws Exception{

		int count = frservice.franchiseSubCount(mname, frcode);
		mv.addObject("count", count);
		
		List<FranchiseVO> frachiseMenu = frservice.franchiseMenu(frcode);
		mv.addObject("frachiseMenu", frachiseMenu);
		
		List<FranchiseVO> frachiseSub = frservice.franchiseSubMenu(mname, frcode);
		mv.addObject("frachiseSub", frachiseSub);
		
		mv.addObject("mname", mname);
		
		mv.setViewName("franchise/franchiseSubList");
		
		return mv;
	}
	
	@RequestMapping(value="/franchiseSortList")
	public ModelAndView franchiseSortList(ModelAndView mv, String frcode) throws Exception{
	    
		// 레코드의 갯수
		int count = frservice.fsortCount(frcode);

		List<MenuVO> mulist = muservice.selectList();
		mv.addObject("mulist", mulist);
		
		List<FranchiseVO> frachiseMenu = frservice.franchiseMenu(frcode);
		mv.addObject("frachiseMenu", frachiseMenu);
		
		List<FranchiseVO> fpdlist = frservice.fsortList(frcode);
		mv.addObject("fpdlist", fpdlist);

		mv.addObject("count", count);
	    mv.setViewName("franchise/franchiseSortList");
	    
	    return mv;
	}
	
	/*
	@RequestMapping(value="/franchiseSortList")
	public ModelAndView franchiseSortList(ModelAndView mv, String frcode, String frkname) throws Exception{
	    
		// 레코드의 갯수
		int count = frservice.fsortCount(frcode);

		List<MenuVO> mulist = muservice.selectList();
		mv.addObject("mulist", mulist);
		
		List<FranchiseVO> frachiseMenu = frservice.franchiseMenu(frcode);
		mv.addObject("frachiseMenu", frachiseMenu);
		
		List<FranchiseVO> fpdlist = frservice.fsortList(frcode, frkname);
		mv.addObject("fpdlist", fpdlist);

		System.out.println("frcode=" + frcode + "frkname=" + frkname);
		System.out.println("fpdlist" + fpdlist); 
		
		mv.addObject("frkname", frkname);
		mv.addObject("count", count);
	    mv.setViewName("franchise/franchiseSortList");
	    
	    return mv;
	}
	*/
	
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
