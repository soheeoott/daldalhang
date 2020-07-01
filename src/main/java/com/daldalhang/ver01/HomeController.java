package com.daldalhang.ver01;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "home";
	}
	
	@RequestMapping(value = "/emailf")
	public ModelAndView emailf(ModelAndView mv) {
		mv.setViewName("personal/eupdateForm");
		return mv;
	}
	
	@RequestMapping(value = "/pupf")
	public ModelAndView pupf(ModelAndView mv) {
		mv.setViewName("personal/pwupdateForm");
		return mv;
	}
	
	@RequestMapping(value = "/mypagef")
	public ModelAndView mypagef(ModelAndView mv) {
		mv.setViewName("personal/mypage");
		return mv;
	}
	
}
