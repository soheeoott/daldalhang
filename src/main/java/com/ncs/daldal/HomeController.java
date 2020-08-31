package com.ncs.daldal;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ProductCri.PageMaker;
import service.LLService;
import service.MUService;
import service.PDService;
import vo.LikeListVO;
import vo.MenuVO;
import vo.ProductVO;

@Controller
public class HomeController {
	
	// 2020-08-04 메뉴 세션 추가
	@Autowired
	MUService muservice;
	
	@Autowired
	PDService pdservice;
	
	@Autowired
	LLService llservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home
	(Locale locale, ModelAndView mv, HttpSession session, LikeListVO vo,
			@ModelAttribute("cri") PageMaker pageMaker) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		mv.addObject("pageMaker", pageMaker);
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		/* 좋아요 */
		String id =(String)session.getAttribute("logID");

		vo.setId(id);
		List<LikeListVO> llist =llservice.idList(vo);

		// 신제품
		List<ProductVO> newlist = pdservice.NewList();
		session.setAttribute("newlist", newlist);
		
		// 신제품의 liked 처리
		for(int i=0; i<newlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(newlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					newlist.get(i).setLiked("t");
					break;
				}
			}
		}
		
		// 추천제품
		List<ProductVO> bestlist = pdservice.BestList();
		session.setAttribute("bestlist", bestlist);
		
		// 추천제품의 liked 처리
		for(int i=0; i<bestlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(bestlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					bestlist.get(i).setLiked("t");
					break;
				}
			}
		}
				
		// 시즌제품
		List<ProductVO> seasonlist = pdservice.SeasonList();
		session.setAttribute("seasonlist", seasonlist);
		
		// 시즌제품의 liked 처리
		for(int i=0; i<seasonlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(seasonlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					seasonlist.get(i).setLiked("t");
					break;
				}
			}
		}
				
		return "home";
	}
}