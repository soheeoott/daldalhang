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

import service.MUService;
import vo.MenuVO;

@Controller
public class HomeController {
	
	// 2020-08-04 메뉴 세션 추가
	@Autowired
	MUService menuservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<MenuVO> menulist = menuservice.selectList();
		session.setAttribute("menulist", menulist);
		
		return "home";
	}
}