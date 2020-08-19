package com.ncs.daldal;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MUService;
import service.PDService;
import vo.MenuVO;
import vo.ProductVO;

@Controller
public class HomeController {
	
	// 2020-08-04 메뉴 세션 추가
	@Autowired
	MUService muservice;
	
	@Autowired
	PDService pdservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home(Locale locale, ModelAndView mv, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<ProductVO> bestlist = pdservice.BestList();
		session.setAttribute("bestlist", bestlist);
		
		List<ProductVO> newlist = pdservice.NewList();
		session.setAttribute("newlist", newlist);
		
		List<ProductVO> seasonlist = pdservice.SeasonList();
		session.setAttribute("seasonlist", seasonlist);
		
		// mv.addObject("bestlist", bestlist);
		
		return "home";
	}
}