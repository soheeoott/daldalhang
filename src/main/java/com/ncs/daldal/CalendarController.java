package com.ncs.daldal;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONException;
import service.CalendarService;
import vo.CalendarVO;

@Controller
public class CalendarController {

	@Autowired
	@Qualifier("calendar")
	private CalendarService service;

	// eventPage.jsp -> 달력형, 목록형 이벤트 출력 페이지 mapping
	@RequestMapping(value="/eventPage")
	public ModelAndView eventPage(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("event/eventPage");
		return mv;
	}
	
	// eventList.jsp -> 목록형 이벤트 출력 페이지 mapping
	@RequestMapping(value="/eventList")
	public ModelAndView eventList(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {

		List<CalendarVO> avo = new ArrayList<CalendarVO>();
		avo = service.selectList(vo);

		System.out.println("avo => "+avo);

		if(avo!=null) {
			mv.addObject("eventList", avo);
			mv.setViewName("event/eventList");
		} else {
			mv.setViewName("event/eventPage");
		}
		return mv;
	} // eventList
	
	@RequestMapping(value = "/calendar")
	public ModelAndView Calendar
	(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		
		System.out.println("calendarMain 111");

		mv.setViewName("event/calendar");
		return mv;
	}

	@RequestMapping(value = "/calendarInsert")
	public ModelAndView CalendarInsert(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		System.out.println("calendarInsert 111" + vo);
		System.out.println("calendarInsert 222" + vo);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "/calendarUpdate")
	public ModelAndView CalendarUpdate(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {

		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/calendarview")
	public ModelAndView calendarview(HttpServletRequest request, ModelAndView mv, CalendarVO vo, String calseq) {
		
		vo = service.CalendarView(calseq);
		mv.addObject("detail", vo);
		System.out.println("CalendarView="+vo);
		
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "calendarDelete")
	public ModelAndView CalendarDelete(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/calendar/view", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray viewCal(@RequestParam("curMon") String curMon) {
		
		System.out.println("view=1==="+curMon);
		
		CalendarVO vo = new CalendarVO();
		vo.setCurMon(curMon);
		
		List<CalendarVO> avo = new ArrayList<CalendarVO>();
		avo = service.selectList(vo);
		
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();

		try {
			System.out.println("view=2=="+avo.get(0).toString());
			
			for (int i = 0; i < avo.size(); i++)	{
				JSONObject sObject = new JSONObject();				
				sObject.put("_id", avo.get(i).getCalseq());
				sObject.put("title", avo.get(i).getCaltitle());
				sObject.put("description", avo.get(i).getCalcontent());
				sObject.put("start", avo.get(i).getStart_date());
				sObject.put("end", avo.get(i).getEnd_date());
				sObject.put("editurl", avo.get(i).getEditurl());
				sObject.put("type", avo.get(i).getFrkname());
				sObject.put("username",avo.get(i).getUsername());
				sObject.put("backgroundColor", avo.get(i).getFrcolor());
				sObject.put("textColor", avo.get(i).getTextColor());
				sObject.put("allDay", avo.get(i).getAllday());
				jArray.add(sObject);
			} 
		} catch (JSONException e) {
			e.printStackTrace();
		}		
		return jArray;
	}
	
	
	@RequestMapping(value = "/calendar/insert", method = RequestMethod.GET)
	@ResponseBody
	public int insertCal(@RequestParam("caltitle") String caltitle, @RequestParam("calcontent") String calcontent
			, @RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date
			, @RequestParam("frcode") String frcode, @RequestParam("editUrl") String editurl) {
		
		System.out.println("INSERT=="+frcode);
		
		CalendarVO vo = new CalendarVO();
		vo.setCaltitle(caltitle);
		vo.setCalcontent(calcontent);
		vo.setStart_date(start_date);
		vo.setEnd_date(end_date);
		vo.setFrcode(frcode);
		vo.setEditurl(editurl);
		
		int sucFlag = service.insert(vo);	
		
		return sucFlag;
	}	
	
	@RequestMapping(value = "/calendar/update", method = RequestMethod.GET)
	@ResponseBody
	public int updateCal(@RequestParam("caltitle") String caltitle, @RequestParam("calcontent") String calcontent
			, @RequestParam("start_date") String start_date, @RequestParam("end_date") String end_date
			, @RequestParam("frcode") String frcode, @RequestParam("calseq") String calseq, @RequestParam("editUrl") String editurl) {
		
		System.out.println("update=1==="+frcode);
		
		CalendarVO vo = new CalendarVO();
		vo.setCaltitle(caltitle);
		vo.setCalcontent(calcontent);
		vo.setStart_date(start_date);
		vo.setEnd_date(end_date);
		vo.setFrcode(frcode);
		vo.setCalseq(calseq);
		vo.setEditurl(editurl);
		
		System.out.println("UPDATE=>"+vo.toString());
		
		int sucFlag = service.update(vo);	
		
		return sucFlag;
	}	
	
	@RequestMapping(value = "/calendar/delete", method = RequestMethod.GET)
	@ResponseBody
	public int deleteCal(@RequestParam("calseq") String calseq) {
		
		CalendarVO vo = new CalendarVO();
		vo.setCalseq(calseq);
		
		System.out.println("DELETE =>"+vo.toString());
		
		int sucFlag = service.delete(vo);	
		
		return sucFlag;
	}
	
} // class