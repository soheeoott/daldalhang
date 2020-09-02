package com.ncs.daldal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.modeler.modules.ModelerSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.LLService;
import vo.LikeListVO;

@Controller
public class LikeListController {
	
	@Autowired
	LLService llservice;
	
	/*
	@RequestMapping(value="/likelist")
	public ModelAndView likelist(ModelAndView mv, LikeListVO vo, HttpSession session) {
		
		List<LikeListVO> llist = llservice.selectList(vo);
			mv.addObject("llist",llist);
		if(llist!=null) {
			mv.addObject("llist",llist);
		}else{
			mv.addObject("message","검색된 결과가 없습니다");
		}
		mv.setViewName("personal/likeList");		
		return mv;
	}
	*/
	
	@RequestMapping(value="/like")
	public ModelAndView like(ModelAndView mv, LikeListVO vo, HttpServletRequest request, HttpSession session) {
		
		String id =(String)session.getAttribute("logID");
		vo.setId(id);
		
		if(llservice.selectOne(vo) == null) {
			llservice.likecreate(vo);
			mv.addObject("lCode","LL");
		}else{
			llservice.delete(vo);
			mv.addObject("lCode","LD");
		}
		mv.setViewName("jsonView");
		return mv;
	}
}