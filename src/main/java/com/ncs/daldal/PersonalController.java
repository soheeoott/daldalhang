package com.ncs.daldal;

import email.MailHandler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.LLService;
import service.PSService;
import vo.LikeListVO;
import vo.PersonalVO;

@Controller
public class PersonalController {
	
	@Autowired
	LLService llservice;
	
	@Autowired
	PSService service; // 조상으로 정의, 후손으로 생성
	private GoogleOAuth2Template googleOAuth2Template;
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Inject
	private JavaMailSender mailSender;
	
	/* 마이페이지 */
	@RequestMapping(value = "/mypagef")
	public ModelAndView mypagef(HttpServletRequest request, ModelAndView mv, PersonalVO vo) {

		// 1) login 여부 확인
		String id = "";
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("logID") != null) {
			id = (String) session.getAttribute("logID");
		} else {
			// login 하도록 유도 후에 메서드 return 으로 종료
			mv.addObject("message", "로그인 후 이용 가능합니다");
			mv.setViewName("personal/loginForm");
			return mv;
		}
		vo.setId(id);
		vo = service.selectOne(vo);
		mv.addObject("myInfo", vo);

		// 4) 결과 ( Detail or Update 인지 )
		mv.setViewName("personal/mypage");
		if ("M".equals(request.getParameter("code"))) {
			// 이메일 수정화면으로
			mv.setViewName("personal/eupdateForm");
		} else if ("P".equals(request.getParameter("code"))) {
			// 비밀번호 수정화면으로
			mv.setViewName("personal/pwupdateForm");
		} else if ("D".equals(request.getParameter("code"))) {
			// 회원탈퇴 화면으로
			mv.setViewName("personal/deleteForm");
		} else if ("L".equals(request.getParameter("code"))) {
			// 좋아요 모아보기 화면으로
			mv.setViewName("personal/likeList");
		}
		return mv;
	}
	
	/* 좋아요 목록 */
	@RequestMapping(value="/myLikelist")
	public ModelAndView myLikelist(ModelAndView mv, LikeListVO vo, PersonalVO pvo, HttpSession session) {
	    
		// 좋아요 리스트 출력
		String id =(String)session.getAttribute("logID");
		vo.setId(id);
		
		List<LikeListVO> llist = llservice.selectList(vo);
		
		mv.addObject("llist",llist);
		
		mv.setViewName("personal/likeList");
		return mv;
	}
	
	/* 비밀번호 변경 처리 */
	@RequestMapping(value = "/pwupdate")
	public ModelAndView pwupdate(HttpServletRequest request, 
			ModelAndView mv, PersonalVO vo) throws IOException {
	
		service.pwupdate(vo);
		
		if (service.pwupdate(vo) > 0) {
			mv.addObject("fCode", "PS");
		} else {
			mv.addObject("fCode", "PF");
		}
		System.out.println("vo***"+vo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* 회원 탈퇴 */
	@RequestMapping(value = "/delete")
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mv, PersonalVO vo) {
		
		HttpSession session = request.getSession(false);
		
		String id = request.getParameter("id");
		vo.setId(id);
		
		mv.setViewName("personal/deleteSuccess");
		
		if (service.delete(vo) > 0) {
			// Delete 성공
			session.invalidate();
		} else {
			// Delete 실패
			mv.setViewName("personal/deleteForm");
		}
		return mv;
	}
	
	/* 이메일 변경 전송 */
	@RequestMapping("/eupdateM")
	public ModelAndView eupdate(ModelAndView mv, PersonalVO vo) throws MessagingException, UnsupportedEncodingException {

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[달달행 이메일 변경 확인]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("이메일 변경을 확인해주세요.<br><a href='http://daldalhang.appspot.com/eupdate?email_id=" + vo.getEmail_id()
						+ "&email_domain=" + vo.getEmail_domain() + "&id=" + vo.getId())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("daldalhang.com", "달달행");
		sendMail.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
		sendMail.send();
		
		mv.setViewName("personal/eupdateConfirm");
		
		return mv;
	}
	
	/* 이메일 변경 처리 */
	@RequestMapping(value = "/eupdate", method = RequestMethod.GET)
	public ModelAndView eupdateSuccess(HttpServletResponse response, HttpServletRequest request, PersonalVO vo, ModelAndView mv,
			@RequestParam String id, @RequestParam String email_id, @RequestParam String email_domain) {

		id = vo.getId();
		vo.setEmail_id(email_id);
		vo.setEmail_domain(email_domain);

		service.eupdate(vo);
		
		if (service.eupdate(vo) > 0) {
			mv.setViewName("redirect:mypagef");
			mv.addObject("fCode", "US");
		} else {
			// 회원수정 실패 -> 내정보 보기 화면으로
			mv.setViewName("personal/eupdateForm");
			mv.addObject("fCode", "UF");
		}
		return mv;
	}
	
	/* 회원가입 이메일 인증 전송 */
	@RequestMapping("/join")
	public ModelAndView join(ModelAndView mv, PersonalVO vo) throws MessagingException, UnsupportedEncodingException {

		service.insert(vo);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
				.append("가입해주셔서 감사합니다.<br><a href='http://daldalhang.appspot.com/verify?email_id=" + vo.getEmail_id()
						+ "&email_domain=" + vo.getEmail_domain())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("daldalhang.com", "달달행");
		sendMail.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
		sendMail.send();
		
		mv.setViewName("personal/signConfirm");
		
		return mv;
	}

	/* 이메일 인증 처리 */
	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public ModelAndView joinSuccess(ModelAndView mv,
				@RequestParam String email_id, @RequestParam String email_domain) {

		System.out.println("이메일 인증기능 처리");

		PersonalVO vo = new PersonalVO();
		vo.setEmail_id(email_id);
		vo.setEmail_domain(email_domain);

		service.verify(vo);
		
		mv.setViewName("personal/signSuccess");
		return mv;
	}
	
	// 구글 소셜 로그인 설정 => servlet-context.xml
	/* 로그인 처리 */
	@RequestMapping("/login")
	public ModelAndView login(ModelAndView mv, PersonalVO vo, HttpServletRequest request) throws Exception {
		
		System.out.println("로그인 인증 처리...");
		
		// login flag : N - Naver, K - Kakao, G - Google, L - Login
		
		if(vo.getLoginFlag().equals("N")) {
			// 네이버 로그인
			String clientId = "DZbaIchlFW7qOqVHBCip";		//애플리케이션 클라이언트 아이디값"; 6S696taO_GdRdtrcL2WK
			String clientSecret = "xQ2O40wfQ6";				//애플리케이션 클라이언트 시크릿값"; o67GQ6g1dO
			String redirectURI = URLEncoder.encode("http://daldalhang.appspot.com/login", "UTF-8");
			String apiURL;
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + vo.getCode();
			apiURL += "&state=" + vo.getState();
			
			// 접근계정 호출 URL
			System.out.println("apiURL="+apiURL);
				
			try {
				URL url = new URL(apiURL);
			    HttpURLConnection con = (HttpURLConnection)url.openConnection();
			    con.setRequestMethod("GET");
			    int responseCode = con.getResponseCode();
			    BufferedReader br;
			    
			    // 호출코드 확인
			    System.out.println("responseCode="+responseCode);
			     
			    if(responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
			    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			    } else {  // 에러 발생
			    	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			    }
			     
			    String inputLine;
			    StringBuffer res = new StringBuffer();
			    
			    while ((inputLine = br.readLine()) != null) {
			    	res.append(inputLine);
			    }
			    
			    br.close();
			    
			    if(responseCode == HttpURLConnection.HTTP_OK) {
			    	// {"access_token":"AAAAOafaeVljoUMFhzX7MHNCP1bB2xrEfhkduDVQ05KPpZ80pi3oJIYIdKh55LpS3D0DPB57BxOR7LeEmEGvnTFoZUk","refresh_token":"jisIbLEO7R0QOZUtWBRKlGzddjbG3w4sAg6VY3yaCRXmb0TrCIIHaO9nSUGUbFCHOwlisckdP0iiiiR9kipkDdnb11ipis94ii4DGqycD15Fz0Sx8iijqTI77u3FLMJZIRzxMSsPii","token_type":"bearer","expires_in":"3600"}
			    	JSONParser jParser = new JSONParser();
			    	JSONObject jObject = (JSONObject) jParser.parse(res.toString());
			    
			    	apiURL = "https://openapi.naver.com/v1/nid/me";
			    	
			    	// API URL
				    System.out.println("apiURL="+apiURL);
			    	
			    	url = new URL(apiURL);
			    	con = (HttpURLConnection)url.openConnection();
				    con.setRequestMethod("GET");
				    
		            con.setRequestProperty("Authorization", "Bearer "+jObject.get("access_token"));		            
				    responseCode = con.getResponseCode();
				    
				    // 연결결과
				    System.out.println("responseCode="+responseCode);
				    
				    if(responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				    } else {  // 에러 발생
				    	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				    }
				     
				    res = new StringBuffer();
				    
				    while ((inputLine = br.readLine()) != null) {
				    	res.append(inputLine);
				    }
				    
				    br.close();
				    
				    // {"resultcode":"00","message":"success","response":{"id":"40713573","email":"kskymama@gmail.com","name":"\uc2ec\ud604\uc8fc"}}
				    System.out.println(res.toString());

				    // 이메일 추출
				    jObject = (JSONObject) jParser.parse(res.toString());
				    jObject = (JSONObject) jParser.parse(jObject.get("response").toString());
				    
				    // Value 확인
				    System.out.println("name=>"+jObject.get("name").toString());
				    
				    String name = URLDecoder.decode("name","UTF-8");
				    System.out.println("name="+name);
				   
				    // ID에 name 값을 넣을것
				    vo.setId(jObject.get("name").toString());
				    vo.setVerify('s');
			    }	
			} catch (Exception e) {
				System.out.println(e);
			}
			
		} else if(vo.getLoginFlag().equals("K")) {
			// 카카오 로그인
			try {
		    	String apiURL = "https://kapi.kakao.com/v2/user/me";
		    	
		    	// api URL
			    System.out.println("apiURL="+apiURL);
		    	
			    URL url = new URL(apiURL);
			    HttpURLConnection con = (HttpURLConnection)url.openConnection();
			    con.setRequestMethod("GET");
			    
	            con.setRequestProperty("Authorization", "Bearer "+vo.getKakaoAccess_token());		            
			    int responseCode = con.getResponseCode();
			    BufferedReader br;
			    
			    // 연결결과
			    System.out.println("responseCode="+responseCode);
			    
			    if(responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
			    	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			    } else {  // 에러 발생
			    	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			    }
			     
			    String inputLine;
			    StringBuffer res = new StringBuffer();
			    
			    while ((inputLine = br.readLine()) != null) {
			    	res.append(inputLine);
			    }
			    
			    br.close();
			    
			    // {"id":1413884680,"connected_at":"2020-07-23T12:17:33Z","kakao_account":{"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"aboutkh@gmail.com"}}
			    System.out.println(res.toString());

			    // 이메일 추출
			    JSONParser jParser = new JSONParser();
			    JSONObject jObject = (JSONObject) jParser.parse(res.toString());
			    
			    // 이메일추출
			    //jObject = (JSONObject) jParser.parse(jObject.get("kakao_account").toString());
			    
			    // 닉네임추출
			    jObject = (JSONObject) jParser.parse(jObject.get("properties").toString());
			    
			    // 이메일추출
			    //if(jObject.get("email_needs_agreement").toString().equals("true")) {
			    
			    // 닉네임 추출
			    if(jObject.get("nickname") == null) {
			    	vo.setId("");
			    } else {
				    // Value 확인
				    System.out.println("nickname=>"+jObject.get("nickname").toString());
				    
				    // ID에 이메일 값을 넣을것
				    vo.setId(jObject.get("nickname").toString());
				    vo.setVerify('s');
			    }
			 	
			} catch (Exception e) {
				System.out.println(e);
			}	
			
		} else if (vo.getLoginFlag().equals("G")) {
			// 구글 로그인
			  System.out.println("google name=>"+vo.getGoogleName());
			  
			  // ID에 이메일 값을 넣을것
			  vo.setId(vo.getGoogleName());
			  vo.setVerify('s');
		}
		
		HttpSession session = request.getSession();
		String password = vo.getPassword();
		
		if (vo.getLoginFlag().contentEquals("L")) {
			vo = service.selectOne(vo);
			
			if (vo != null && vo.getPassword().equals(password)) {
				
				if(vo.getVerify() == 'y'){
					session.setAttribute("logID", vo.getId());
					mv.setViewName("redirect:home");
					return mv;
					
				}  else if(vo.getVerify() == 'n') {
					mv.setViewName("personal/loginForm");
					mv.addObject("notVerify", true); 		// 이메일 인증이 되지 않았습니다! 이메일을 확인하시고 인증해주시기 바랍니다!
					return mv;
					
				} 	else {
					mv.setViewName("personal/loginForm");
					mv.addObject("notVerify", true); 		// 이메일 인증이 되지 않았습니다! 이메일을 확인하시고 인증해주시기 바랍니다!
					return mv;
				}
				
			} else {
				mv.setViewName("personal/loginForm");
				mv.addObject("notExist", true); 			// 가입하지 않은 아이디나 잘못된 비밀번호 입니다!
			}
			
		}  else if (vo.getVerify() == 's') {
			session.setAttribute("slogID", vo.getId());
			mv.setViewName("redirect:home");
		}
			return mv;
	}
	
	/* 아이디 중복 체크 */
	@RequestMapping(value = "/personal/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("Id") String id) {
		return service.IdCheck(id);
	}

	/* 회원가입 폼 */
	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("personal/joinForm");
		return mv;
	}

	/* 로그인 폼 */
	@RequestMapping(value = "/loginf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("personal/loginForm");
		return mv;
	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, PersonalVO vo) {
		
		request.getSession().invalidate();
		mv.setViewName("redirect:home");
		return mv;
	}
	
	/* 아이디, 비밀번호 찾기 폼 */
	@RequestMapping(value = "/searchf")
	public ModelAndView searchf(ModelAndView mv) {
		mv.setViewName("personal/searchIdpass");
		return mv;
	}
	
	@RequestMapping(value="/pwupdatef")
	public ModelAndView pwupdatef (ModelAndView mv, HttpServletRequest request, String id) {
		id = request.getParameter("id");
		mv.addObject("id", id);
		mv.setViewName("personal/pwupdateForm");
		return mv;
	}
	
	/* 아이디 찾기 처리 */
	@RequestMapping(value = "/findid", method = RequestMethod.POST)
	public @ResponseBody String findid(HttpServletRequest request) {
		System.out.println("아이디찾기");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");

		System.out.println("email_id =>" + email_id);
		System.out.println("email_domain =>" + email_domain);
		
		PersonalVO vo = new PersonalVO();
		vo.setEmail_id(email_id);
		vo.setEmail_domain(email_domain);
		
		PersonalVO search = service.findid(vo);
		 System.out.println(search);
		 
		if (search != null) {
			return search.getId();
		} else {
			return "x";
		}
	}

	/* 비밀번호 찾기 처리 */
	@ResponseBody
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findpw(HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
		
		String id = request.getParameter("id");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		
		PersonalVO vo = new PersonalVO();
		vo.setId(id);
		vo.setEmail_id(email_id);
		vo.setEmail_domain(email_domain);
		
		/*
		String temp_pw = "te" + id + "mp";
		vo.setPassword(temp_pw);
		service.pwupdate(vo);
		*/
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setText(
				new StringBuffer().append("<h1>비밀번호 변경</h1>")
				.append("가입해주셔서 감사합니다.<br><a href='http://daldalhang.appspot.com/pwupdatef?id="+id)
				.append("' target='_blenk'>비밀번호 변경 페이지</a>").toString());
		sendMail.setFrom("daldalhang@daldalhang.com", "달달행");
		sendMail.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
		sendMail.send();
		
		/*
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[비밀번호 찾기]");
		sendMail.setText(
				new StringBuffer().append("<h1>임시 비밀번호 발급</h1>").append("<b>임시 비밀번호 발급 : " + temp_pw + "</b><br>")
						.append("<a href='http://daldalhang.appspot.com/daldal/home")
						.append("' target='_blenk'>로그인 하기</a>").toString());
		sendMail.setFrom("daldalhang@daldalhang.com", "달달행");
		sendMail.setTo(vo.getEmail_id() + "@" + vo.getEmail_domain());
		sendMail.send();
		*/
	}
}	