package com.ncs.daldal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import criTest.PageMaker;
import criTest.SearchCriteria;
import service.NService;
import vo.NoticeVO;
import vo.PrevNextVO;

@Controller
public class NoticeController {
	@Autowired
	NService service;

	// Criteria를 이용한 공지사항 페이징 : notice/noticeList.jsp
	@RequestMapping(value="/nlist")
	public ModelAndView nlist(ModelAndView mv, SearchCriteria cri) {
		cri.setSnoEno();	
		mv.addObject("daldal",service.searchList(cri));

		// 2) Page 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		// 2.2) 2단계 SearchCriteria (검색조건 포함)
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		
		// 3. View Name
		mv.setViewName("notice/noticeList");
		return mv;
	} // nlist
	
	// notice/noticeDetail.jsp
	@RequestMapping(value="/ndetail")
	public ModelAndView ndetail(ModelAndView mv, NoticeVO nvo, PrevNextVO pnvo,
			HttpServletRequest request) {
		// 글 조회수 증가
		// => 내 글(session의 logID)인지 남이 쓴 글(noticeList에서 클릭한 글의 ID)인지 확인
		// 1) session에서 logID get
		HttpSession session = request.getSession(false);
		// false : session이 없을 때 null을 return
		//			-> null이 아님을 확인 후 사용해야 함
		String logID = "";
		if(session != null && session.getAttribute("logID") != null) {
			logID = (String)session.getAttribute("logID");
		}
		
		// 2) countUp : 내 글이 아닌 경우 클릭 시 조회수 증가
		if(!logID.equals(nvo.getId())) {
			service.countUp(nvo);
		}
		// 3) Detail 출력
		nvo = service.selectOne(nvo);
		
		// 2020-07-02 Detail 페이지에서 이전글, 다음글 정보 가져오기
		pnvo = service.selectPrevNext(pnvo);
		
		if(nvo != null || pnvo != null) {			
			mv.addObject("notice",nvo);
			mv.addObject("NoticePN",pnvo);
			mv.setViewName("notice/noticeDetail");
		} else {
			mv.addObject("message","출력할 게시글이 없습니다.");
			mv.setViewName("notice/noticeList");
		}
		return mv;
	} // ndetail
	
	// notice/noticeWrite.jsp 공지사항 작성폼
	@RequestMapping(value = "/ninsertf")
	public ModelAndView ninsertf(ModelAndView mv) {
		mv.setViewName("notice/noticeWrite");
		return mv;
	} // ninsertf

	// 새 글 등록 , 수정, 삭제 => daldal(관리자) 계정 login 후에만 가능
	@RequestMapping(value = "/ninsert")
	public ModelAndView ninsert(ModelAndView mv, NoticeVO nvo) {
		if(service.insert(nvo)>0) {
			mv.setViewName("redirect:nlist");
		} else {
			// 글 등록 실패
			System.out.println("글 등록 실패 alert으로 띄워 줄 수 있으면 참 좋겟다");
			mv.setViewName("redirect:nlist");
		}
		return mv;
	} // ninsert
	
	// notice/noticeUpdate.jsp 공지사항 수정폼
	@RequestMapping(value="/nupdatef")
	public ModelAndView nupdatef(ModelAndView mv, NoticeVO nvo,
			HttpServletRequest request) {		
		// 1) selectOne
		nvo = service.selectOne(nvo);
		
		if (nvo!=null) {
			mv.addObject("notice", nvo);
			mv.setViewName("notice/noticeUpdate");
		}else {
//			mv.addObject("fCode","BU");				// 팝업창으로 메세지 띄워 주고 싶음
			System.out.println("수정 폼 실행 실패!!");
			mv.setViewName("nlist");
//			mv.setViewName("member/doFinish");
		}
		return mv;
	}// nupdatef
	
	@RequestMapping(value="/nupdate")
	public ModelAndView nupdate(ModelAndView mv, NoticeVO nvo) {
		if(service.update(nvo)>0) {
			mv.setViewName("redirect:nlist");
		} else {
//			mv.addObject("fCode","BU");		// 팝업창으로 메세지 띄워 주고 싶음...
			System.out.println("수정 실패!!");
//			mv.setViewName("member/doFinish");
		}	
		return mv ;	
	} // nupdate
	
	@RequestMapping(value="/ndelete")
	public ModelAndView ndelete(ModelAndView mv, NoticeVO nvo) {
		// if구문을 실행할 때에는 이미 삭제된 후이기 때문에 service.delete(nvo)==0이 된다. => 삭제 성공
		if (service.delete(nvo)==0) {
//			mv.setViewName("home");
		} else {		// => 삭제 실패
//			mv.addObject("fCode","DF");
//			mv.setViewName("nlist");
		}	
		return mv ;	
	} //ndelete
}
