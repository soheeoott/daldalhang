package com.ncs.daldal;

import java.io.File;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.FService;
import service.MetaService;
import service.PDService;
import vo.FranchisecodeVO;
import vo.MetacodeVO;
import vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	PDService productservice;
	
	@Autowired
	MetaService metaservice;
	
	@Autowired
	FService fcservice;

	@RequestMapping(value="/pdlist")
	public ModelAndView pdlist(ModelAndView mv) {
		
		List<ProductVO> list = productservice.selectList();
		
		if (list != null) {
			mv.addObject("PList", list);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("product/productList");
		return mv;
	}
	
	@RequestMapping(value="/pinsertf")
	public ModelAndView pinsertf(ModelAndView mv, List<MetacodeVO> metalist, 
			List<FranchisecodeVO> fclist) {
		
		metalist = metaservice.selectList();
		fclist = fcservice.selectList();
		
		if(metalist != null || fclist != null) {			
			mv.addObject("metalist", metalist);
			mv.addObject("fclist", fclist);
		}	
		
		mv.setViewName("product/productWrite");
		return mv;
	}
	
	@RequestMapping(value = "/pinsert")
	public ModelAndView pinsert(ModelAndView mv, ProductVO vo) throws IOException {

		// uploadfile 처리
		// => uploadfilef 의 정보에서 파일명을 get,
		// => upload 된 이미지를 서버의 정해진 폴더에 저장하고,
		// => 이 위치에 대한 정보를 table에 저장 (vo에 set)
		MultipartFile uploadfilef = vo.getUploadfilef();
		
		// 이미지를 선택하지 않았을 시
		String file1, file2 = "No Image";

		// Ajax 의  FormData 는  이미지를 선택하지 않으면 append 시 오류 발생
		// append 를 하지 않으면 → 서버의 vo.uploadfilef 에  null 값이 전달 됨
		// vo.getUploadfilef() → null Check 
		// [Ajax 로 담겨지는 값(null) != 선택하지 않았을 경우의 값('')]
		// => submit 으로 전송 시 선택하지 않은 경우 '' 전달 : isEmpty() 
		if(vo.getUploadfilef() != null) {
			uploadfilef = vo.getUploadfilef();
			
			if(!uploadfilef.isEmpty()) {
				// 실제 저장 경로 생성하고 저장
				file1= "D:/eclipse/workspace/daldalhang-feature_ver01/src/main/webapp/resources/product_img/"
							+uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
				uploadfilef.transferTo(new File(file1));
				file2="resources/product_img/"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
			}
		} // *폴더에 넣기 연습
		
		vo.setUploadfile(file2);
		
		if (productservice.insert(vo) > 0) {
			// 성공
			mv.setViewName("pdlist");
		} else {
			// 실패
			mv.setViewName("home");
		}
		return mv;
	}

//	@RequestMapping(value = "/jslogout")
//	public ModelAndView jslogout(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//		request.getSession().invalidate();
//		mv.setViewName("jsonView");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/jslogin")
//	public ModelAndView jslogin(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//
//		mv.addObject("id", vo.getId());
//		String password = vo.getPassword();
//		// mv.addObject("password", vo.getId());
//		
//		vo = service.selectOne(vo);
//		if (vo != null && vo.getPassword().equals(password)) {
//			request.getSession().setAttribute("logID", vo.getId());
//			request.getSession().setAttribute("logName", vo.getName());
//			mv.addObject("loginS", "T");
//		} else {
//			// Password 오류 -> 재로그인
//			mv.addObject("loginF", "F");
//		}
//		mv.setViewName("jsonView");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/jsdelete")
//	public ModelAndView jsdelete(ModelAndView mv, MemberVO vo) {
//		if (service.delete(vo) > 0) {
//			mv.addObject("fCode", "DS");
//		} else {
//			// Delete 실패
//			mv.addObject("fCode", "DF");
//		}
//		mv.setViewName("jsonView");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/amlist")
//	public ModelAndView amlist(ModelAndView mv) {
//		ArrayList<MemberVO> list = service.selectList();
//		if (list != null) {
//			mv.addObject("apple", list); // scope 이 request 와 동일
//		} else {
//			mv.addObject("message", "~~ 검색된 자료가 1건도 없습니다. ~~");
//		}
//		mv.setViewName("ajaxTest/axMemberList");
//		return mv;
//	}
//	

//	
//	@RequestMapping(value = "/ploginf")
//	public ModelAndView ploginf(ModelAndView mv) {
//		mv.setViewName("login/ploginForm");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/loginf")
//	public ModelAndView loginf(ModelAndView mv) {
//		mv.setViewName("login/loginForm");
//		return mv;
//	}
//

//	
//	// ** New 기능 추가
//	// Page Criteria
//	// => 매핑메서드 : mlistcri(), Service, DAO, Mapper, mlistcri.jsp
//	@RequestMapping(value = "/mlistcri")
//	public ModelAndView mlistcri(ModelAndView mv, SearchCriteria cri) {
//		// 1) setSnoEno 출력할 Data Read & addObject
//		cri.setSnoEno();
//		mv.addObject("Banana", service.searchList(cri)); // 조건에 따라 검색하는 service 메소드
//		
//		// 2) Page 처리
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalRow(service.searchRowCount(cri));
//		
//		mv.addObject("pageMaker", pageMaker);
//		mv.setViewName("member/mlistcri");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/plogin")
//	public ModelAndView plogin(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//
//		mv.addObject("id", vo.getId());
//		String password = vo.getPassword();
//
//		vo = service.selectOne(vo);
//		if (vo != null && vo.getPassword().equals(password)) {
//				// 로그인 성공 -> login 정보 보관 (id, name을 session에) -> loginSuccess
//				request.getSession().setAttribute("logID", vo.getId());
//				request.getSession().setAttribute("logName", vo.getName());
//				mv.addObject("loginR", "T");
//		} else {
//				// Password 오류 -> 재로그인
//				mv.addObject("loginR", "F");
//		}
//		mv.setViewName("login/ploginForm");
//		return mv;
//	}
//	

//
//	@RequestMapping(value = "/mdetail")
//	public ModelAndView mdetail(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//
//		// 1) login 여부 확인
//		String id = "";
//		HttpSession session = request.getSession(false);
//		if (session != null && session.getAttribute("logID") != null) {
//			id = (String) session.getAttribute("logID");
//		} else {
//			// login 하도록 유도 후에 메서드 return 으로 종료
//			mv.addObject("message", "~~ 로그인 후에 하세요 ~~");
//			mv.setViewName("login/loginForm");
//			return mv;
//		}
//		vo.setId(id);
//		vo = service.selectOne(vo);
//		mv.addObject("myInfo", vo);
//
//		// 4) 결과 ( Detail or Update 인지 )
//		// => request.getParameter("code") 가 U 인지 확인
//		mv.setViewName("member/memberDetail");
//		if ("U".equals(request.getParameter("code"))) {
//			// 내정보 수정화면으로
//			mv.setViewName("member/updateForm");
//		} else if ("E".equals(request.getParameter("code"))) { // 내정보 수정에서 오류 상황
//			mv.addObject("message", "~~ 내정보 수정 오류  !!! 다시 하세요 ~~");
//		}
//		return mv;
//	}
//	
//	@RequestMapping(value = "/join")
//	public ModelAndView join(ModelAndView mv, MemberVO vo) throws IOException {
//		/* MemberVO vo
//		   - 정의 후 [get/set]으로 값을 전달받는다.
//           - 잘못 입력 시 값=null
//        */
//		mv.setViewName("member/doFinish");
//		
//		// uploadfile 처리
//		// => uploadfilef 의 정보에서 파일명을 get,
//		// => upload 된 이미지를 서버의 정해진 폴더에 저장하고,
//		// => 이 위치에 대한 정보를 table에 저장 (vo에 set)
//		MultipartFile uploadfilef = vo.getUploadfilef();
//		
//		// 이미지를 선택하지 않았을 시
//		String file1, file2 = "No Image";
//
//		// Ajax 의  FormData 는  이미지를 선택하지 않으면 append 시 오류 발생
//		// append 를 하지 않으면 → 서버의 vo.uploadfilef 에  null 값이 전달 됨
//		// vo.getUploadfilef() → null Check 
//		// [Ajax 로 담겨지는 값(null) != 선택하지 않았을 경우의 값('')]
//		// => submit 으로 전송 시 선택하지 않은 경우 '' 전달 : isEmpty() 
//		if(vo.getUploadfilef() != null) {
//			uploadfilef = vo.getUploadfilef();
//			
//			if(!uploadfilef.isEmpty()) {
//				// 실제 저장 경로 생성하고 저장
//				file1="D:/MTest/MyWork/Spring07/src/main/webapp/resources/uploadImage/"
//							+uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
//				uploadfilef.transferTo(new File(file1));
//				file2="resources/uploadImage/"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
//			}
//		} // *폴더에 넣기 연습
//		
//		vo.setUploadfile(file2);
//		
//		int cnt = service.insert(vo);
//		int cnt2 = service.insert(vo);
//		
//		if (cnt > 0) {
//			// Join 성공
//			mv.addObject("joinID", vo.getId());
//			mv.addObject("fCode", "JS");
//		} else {
//			// Join 실패
//			mv.addObject("fCode", "JF");
//		}
//		return mv;
//	}
//	
//	// id DupCheck
//	@RequestMapping(value = "/idDupCheck")
//	public ModelAndView idDupCheck(ModelAndView mv, MemberVO vo) {
//		// 클라이언트로 부터 전달된 id 의 존재 여부 확인 : selectOne()
//		// => notNull (존재하면) : 사용불가
//		// => Null (존재하지 않으면) : 사용가능 (미리 입력한 ID 보관)
//		mv.addObject("ID", vo.getId());
//		vo = service.selectOne(vo);
//		
//		if(vo != null) { // 존재 : 사용불가
//			mv.addObject("idUse", "F");
//		} else {
//			mv.addObject("idUse", "T");
//		}
//		mv.setViewName("member/idDupCheck");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/mupdate")
//	public ModelAndView update(HttpServletRequest request, ModelAndView mv, MemberVO vo) 
//			throws IOException {
//		// Image 처리
//		// 1. uploadfilef 처리
//		// 2. New Image 선택여부
//		// => 선택을 한 경우 : new Image 처리
//		// => 선택을 안한 경우 : old Image 를 vo에 set
//		// 해결
//		// => 수정전의 이미지 파일명을 update form에 hidden 으로 보관했다가 사용
//		// => vo 에 uploadfile 은 담겨있으므로,
//		// => new Image를 선택한 경우에만 uploadfile 를 이용하여 처리
//		
//		MultipartFile uploadfilef = vo.getUploadfilef();
//		String file1, file2;
//		if(!uploadfilef.isEmpty()) {
//			// 실제 저장 경로 생성하고 저장
//			file1 = "D:/MTest/MyWork/Spring07/src/main/webapp/resources/uploadImage/"
//						+ uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
//			uploadfilef.transferTo(new File(file1));
//			file2 ="resources/uploadImage/"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
//			vo.setUploadfile(file2);
//		}
//		
//		if (service.update(vo) > 0) {
//			// 회원수정 성공 -> memberList 출력
//			// session 의 Attribute logName 도 변경
//			request.getSession().setAttribute("loginName", vo.getName());
//			mv.setViewName("redirect:mlist");
//		} else {
//			// 회원수정 실패 -> 내정보 보기 화면으로
//			mv.setViewName("redirect:mdetail?code=E");
//		}
//		return mv;
//	}
//		
//	@RequestMapping(value = "/adelete")
//	public ModelAndView adelete(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//
//		if (service.delete(vo) > 0) {
//			// Delete 성공
//			mv.addObject("fCode", "DS");
//		} else {
//			// Delete 실패
//			mv.addObject("fCode", "DF");
//		}
//		mv.setViewName("redirect:amlist");
//		return mv;
//	}
//	
//	@RequestMapping(value = "/mdelete")
//	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mv, MemberVO vo) {
//
//		// 1) login 여부 확인
//		String id = "";
//		HttpSession session = request.getSession(false);
//		if (session != null && session.getAttribute("logID") != null) {
//			id = (String) session.getAttribute("logID");
//		} else {
//			// login 하도록 유도 후에 메서드 return 으로 종료
//			mv.addObject("message", "~~ 로그인 후에 하세요 ~~");
//			mv.setViewName("login/loginForm");
//			return mv;
//		}
//		// 2) Login OK -> delete
//		vo.setId(id);
//		mv.setViewName("member/doFinish");
//		mv.addObject("deleteID", id);
//
//		if (service.delete(vo) > 0) {
//			// Delete 성공
//			mv.addObject("fCode", "DS");
//			session.invalidate(); // 삭제 되면 session 도 삭제해야함.
//		} else {
//			// Delete 실패
//			mv.addObject("fCode", "DF");
//		}
//		return mv;
//	}
//	
//	// Member Paging List
//	@RequestMapping(value = "/mplist")
//	public ModelAndView mplist(ModelAndView mv, MPageVO pvo) {
//		
//		int Page=1;
//		// (/plist) 요청 = home.jsp 먼저 실행 → 파라미터로 넘겨오는 값이 없음 → Page(출력할 번호)의 값을 알지 못함 → 요청한 페이지를 확인
//		
//		if (pvo.getPage() > 1) // 요청 Page 존재 여부
//			Page = pvo.getPage();
//		else pvo.setPage(Page); // 값이 없을 경우 Page 값에(1)을 넣어줌
//		
//		int startPage = (Page-1)*pvo.getRowPage()+1; // RowPage : 한 페이지당 보여줄 행(row)의 갯수
//		// pvo.getRowPage()+1 : 첫 페이지(1~11)
//		int endPage = (startPage+pvo.getRowPage())-1;
//		// pvo.getRowPage())-1 : (1~10),(11~20)
//		pvo.setSno(startPage);
//		pvo.setEno(endPage);
//		
//		// 2) Service
//		// => DB 에서 필요한 값들을 set
//		// => 출력할 Row List, totalCount (totalRowCount)
//		pvo = service.pageList(pvo);
//	
//		// 3) 결과 처리
//		// => totalCount 를 이용해서 totalPageNo 계산
//		//    totalCount 가 70 이면  totalPageNo 는 ? ( 1page당 5개씩 출력 )
//		//	  70/5 = 14, 나머지가 있으면 +1
//		int totalPage = pvo.getTotalCount()/pvo.getRowPage();  // totalCount : 전체 글 수 // totalPageNo : 전체 페이지 수
//		if (pvo.getTotalCount()%pvo.getRowPage() > 0)
//			totalPage += 1;
//
//		// ** Paging2 : page Block
//		// => sPageNo, ePageNo 계산
//		//    연습
//		// => 필요한 값 : Page, RowPageNo = 5
//		//	  Page(요청 페이지)=11 인 경우 : 11, 12, 13, 14, 15 -> ((11-1)/5)*5 + 1 : 11;
//		//	  Page(요청 페이지)=7 인 경우   : 6, 7, 8, 9, 10     -> ((7-1)/5)*5 + 1 : 6
//		int sPage = ((Page-1)/pvo.getRowPageNo())*pvo.getRowPageNo()+1; // 페이지당 출력 번호
//		int ePage = sPage + pvo.getRowPageNo()-1; // 마지막 페이지
//		
//		// 계산된 ePage 가 totalPageNo 보다 큰 경우
//		// totalPageNo 를 ePage 로 함.
//		// => 예를 들면 totalPageNo = 8 인데, ePage=9 인 경우
//		if (ePage > totalPage) ePage = totalPage;
//		
//		// => view 처리
//		mv.addObject("sPage", sPage);
//		mv.addObject("ePage", ePage);
//		mv.addObject("RowPageNo", pvo.getRowPageNo());
//		
//		mv.addObject("totalPage", totalPage);
//		mv.addObject("Page", Page);
//		
//		if (pvo.getList() != null) {
//			mv.addObject("Banana", pvo.getList());
//		} else {
//			mv.addObject("message", "검색된 자료가 1건도 없습니다.");
//		}
//		mv.setViewName("member/mpageList");
//		return mv;
//	}
}