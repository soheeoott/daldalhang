package com.ncs.daldal;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import service.FRService;
import service.MAPService;
import service.MUService;
import service.PDService;
import vo.FranchiseVO;
import vo.LlmapVO;
import vo.MenuVO;
import vo.ProductVO;

@Controller
public class FranchiseController {

	@Autowired
	FRService frservice;
	
	@Autowired
	MAPService mservice;
	
	@Autowired
	PDService pdservice;
	
	@Autowired
	MUService muservice;
	
	@RequestMapping(value="/franchiseinsertf")
	public ModelAndView franchiseinsertf(ModelAndView mv, FranchiseVO fvo, HttpSession session) throws Exception{
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		mv.setViewName("franchise/franchiseWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/fcinsert")
	public ModelAndView fcinsert(ModelAndView mv, FranchiseVO fvo) throws Exception{
		
		// uploadfile 처리
		// => uploadfilef 의 정보에서 파일명을 get,
		// => upload 된 이미지를 서버의 정해진 폴더에 저장하고,
		// => 이 위치에 대한 정보를 table에 저장 (vo에 set)
		MultipartFile uploadfilef = fvo.getFruploadfilef();
		
		// 이미지를 선택하지 않았을 시
		String file1, file2 = "No Image";

		// Ajax 의  FormData 는  이미지를 선택하지 않으면 append 시 오류 발생
		// append 를 하지 않으면 → 서버의 vo.uploadfilef 에  null 값이 전달 됨
		// vo.getUploadfilef() → null Check 
		// [Ajax 로 담겨지는 값(null) != 선택하지 않았을 경우의 값('')]
		// => submit 으로 전송 시 선택하지 않은 경우 '' 전달 : isEmpty() 
		if(fvo.getFruploadfilef() != null) {
			uploadfilef = fvo.getFruploadfilef();
			
			if(!uploadfilef.isEmpty()) {
				// 실제 저장 경로 생성하고 저장
				file1 = "C:/Users/Green_Computer/git/daldalhang/src/main/webapp/resources/img_logo/"
							+uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
				uploadfilef.transferTo(new File(file1));
				file2="resources/img_logo"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
			}
		}
		
		fvo.setFruploadfile(file2);
		
		if (frservice.insert(fvo) > 0) {
			// 성공
			mv.setViewName("frlist");
		} else {
			// 실패
			mv.setViewName("home");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/franchiseSubList")
	public ModelAndView franchiseSubList(ModelAndView mv, String mname, String frcode) throws Exception{

		int count = frservice.franchiseSubCount(mname, frcode);
		mv.addObject("count", count);
		
		List<FranchiseVO> frachiseMenu = frservice.franchiseMenu(frcode);
		mv.addObject("frachiseMenu", frachiseMenu);
		
		List<FranchiseVO> frachiseSub = frservice.franchiseSubMenu(mname, frcode);
		mv.addObject("frachiseSub", frachiseSub);
		
		mv.addObject("mname", mname);
		
		mv.setViewName("franchise/franchiseSubList");
		
		return mv;
	}
	
	@RequestMapping(value="/franchiseSortList")
	public ModelAndView franchiseSortList(ModelAndView mv, String frcode) throws Exception{
	    
		// 레코드의 갯수
		int count = frservice.fsortCount(frcode);

		List<MenuVO> mulist = muservice.selectList();
		mv.addObject("mulist", mulist);
		
		List<FranchiseVO> frachiseMenu = frservice.franchiseMenu(frcode);
		mv.addObject("frachiseMenu", frachiseMenu);
		
		List<FranchiseVO> fpdlist = frservice.fsortList(frcode);
		mv.addObject("fpdlist", fpdlist);

		mv.addObject("count", count);
	    mv.setViewName("franchise/franchiseSortList");
	    
	    return mv;
	}
	
	@RequestMapping(value="/frlist")
	public ModelAndView frlist(ModelAndView mv) {
		
		List<FranchiseVO> frlist = frservice.selectList();
		
		if(frlist != null) {
			mv.addObject("frlist", frlist);
		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("franchise/franchiseList");
		return mv;
	}
}
