package com.ncs.daldal;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONException;
import service.CalendarService;
import service.FRService;
import vo.CalendarVO;
import vo.FranchiseVO;

@Controller
public class CalendarController {
	
	@Autowired
	FRService frservice;
	
	@Autowired
	@Qualifier("calendar")
	private CalendarService service;

	@RequestMapping(value="/eventinsertf")
	public ModelAndView eventinsertf(HttpServletRequest request, ModelAndView mv) {
		
		List<FranchiseVO> frlist = frservice.selectList();
		mv.addObject("frlist", frlist);
		
		mv.setViewName("event/eventWrite");
		return mv;
	}
	
	// eventCalPage.jsp -> 달력형 이벤트 출력 페이지 mapping
	@RequestMapping(value="/eventCalPage")
	public ModelAndView eventCalPage(HttpServletRequest request, ModelAndView mv) {
		mv.setViewName("event/eventCalPage");
		return mv;
	}

	// eventList.jsp -> 목록형 이벤트 출력 페이지 mapping
	@SuppressWarnings("null")
	@RequestMapping(value="/eventList")
	public ModelAndView eventList(ModelAndView mv, CalendarVO vo, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		
		List<CalendarVO> avo = service.selectList(vo);
		List<FranchiseVO> fvo = frservice.selectList();		

		if(avo.size()==0) {
			mv.addObject("eCode", "1111");
			mv.setViewName("jsonView");
		} else {
			mv.addObject("eventList", avo);
			mv.addObject("fvoList", fvo);
			mv.setViewName("event/eventList");
		}
		return mv;
	} // eventList
	
	// eventList.jsp -> 각 브랜드명 선택 시 해당 브랜드의 이벤트만 return
	@RequestMapping(value="/eventOne")
	public ModelAndView eventOne(ModelAndView mv, CalendarVO vo, String frcode, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		
		List<CalendarVO> avo = new ArrayList<CalendarVO>();
		avo = service.eventOne(frcode);
		
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); java.util.Calendar
		 * c1 = java.util.Calendar.getInstance(); String strToday =
		 * sdf.format(c1.getTime());
		 * 
		 * System.out.println("Today= "+strToday);
		 * System.out.println("현재 이벤트들 종료 날짜 = "+avo.get(0));
		 */
		
		
		if(avo.size()==0) {
			mv.addObject("eCode","1111"); 				// 현재 진행 중인 이벤트가 없습니다.
			mv.setViewName("jsonView");
		} else {
			mv.addObject("eventList", avo);
			mv.setViewName("jsonView");
		}
		return mv;
	} // eventOne
	
	@RequestMapping(value = "/calendar")
	public ModelAndView Calendar
	(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		mv.setViewName("event/calendar");
		return mv;
	}

	@RequestMapping(value = "/calendarInsert")
	public ModelAndView CalendarInsert(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
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

	@RequestMapping(value = "/calendarDelete")
	public ModelAndView CalendarDelete(HttpServletRequest request, ModelAndView mv, CalendarVO vo) {
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/calendar/view", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray viewCal(@RequestParam("curMon") String curMon) {
		
		//System.out.println("view=1==="+curMon);
		
		CalendarVO vo = new CalendarVO();
		vo.setCurMon(curMon);
		
		List<CalendarVO> avo = new ArrayList<CalendarVO>();
		avo = service.selectList(vo);
		
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();

		try {
			//System.out.println("view=2=="+avo.get(0).toString());
			
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
	
	@RequestMapping(value = "/calinsert")
	public ModelAndView calinsert(ModelAndView mv, CalendarVO vo, HttpServletRequest request) throws IOException {

		// uploadfile 처리
		// => uploadfilef 의 정보에서 파일명을 get,
		// => upload 된 이미지를 서버의 정해진 폴더에 저장하고,
		// => 이 위치에 대한 정보를 table에 저장 (vo에 set)
		MultipartFile eventuploadfilef = vo.getEventuploadfilef();
		
		// 이미지를 선택하지 않았을 시
		String file1, file2 = "No Image";
		
		String path = "C:\\img_event"; //폴더 경로
		File Folder = new File(path);
		
		// Ajax 의  FormData 는  이미지를 선택하지 않으면 append 시 오류 발생
		// append 를 하지 않으면 → 서버의 vo.uploadfilef 에  null 값이 전달 됨
		// vo.getUploadfilef() → null Check 
		// [Ajax 로 담겨지는 값(null) != 선택하지 않았을 경우의 값('')]
		// => submit 으로 전송 시 선택하지 않은 경우 '' 전달 : isEmpty() 
		if(vo.getEventuploadfilef() != null) {
			eventuploadfilef = vo.getEventuploadfilef();
		
			if(!eventuploadfilef.isEmpty()) {
				
				// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
				if (!Folder.exists()) {
					try{
					    Folder.mkdir(); //폴더 생성합니다.
					    System.out.println("폴더가 생성되었습니다.");
				        } 
				        catch(Exception e){
					    e.getStackTrace();
					}        
				}
				
				// 실제 저장 경로 생성하고 저장
				/* file1 = "C:/apache-tomcat-9.0.34/webapps/daldalhang/" */
				file1="C:/img_event/"
				/* file1="C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/daldalhang/" */
							+eventuploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
				eventuploadfilef.transferTo(new File(file1));
				
				file2="resources/img_event/"+eventuploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
			}				
		}
		vo.setEventImg(file2);
		
		if (service.insert(vo) > 0) {
			// 성공
			mv.setViewName("event/eventCalPage");
		} else {
			// 실패
			mv.setViewName("home");
		}
		return mv;
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