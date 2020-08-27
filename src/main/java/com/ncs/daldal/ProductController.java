package com.ncs.daldal;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ProductCri.PageMaker;
import service.FRService;
import service.LLService;
import service.MUService;
import service.PDService;
import service.PSService;
import vo.FranchiseVO;
import vo.LikeListVO;
import vo.MenuVO;
import vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	PDService pdservice;
	
	@Autowired
	MUService muservice;
	
	@Autowired
	FRService frservice;

	@Autowired
	LLService llservice;

	@Autowired
	PSService psservice;
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET) 
	public ModelAndView listPage(MenuVO mvo, HttpSession session,
			@ModelAttribute("cri") PageMaker pageMaker, ModelAndView mv,
			LikeListVO vo) throws Exception {
		
		System.out.println("pageMaker=> " + pageMaker);
		
		pageMaker.setPerPageNum(21);
		pageMaker.setSno();
		
		if (pageMaker.getPage() < 1) {
			pageMaker.setPage(1);
		}
		
		int totalNum = pdservice.TotalCount();
	    pageMaker.setTotalCount(totalNum);
	    
		List<ProductVO> pvo = pdservice.listCriteria(pageMaker);
	    
	    mv.addObject("pageMaker", pageMaker);
	    
	    System.out.println("pageMaker=> " + pageMaker);
	    
		/* mv.addObject("list", pvo); */
	    
	    List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		// menu 클릭했을 때 나오는 category 출력
		/* String mucategory = mvo.getMucategory(); */

		List<MenuVO> cpdlist = muservice.productList(mvo);
		mv.addObject("cpdlist", cpdlist);
		mv.addObject("pdlist", pvo);
		
		/* 좋아요 */
		String id =(String)session.getAttribute("logID");

		vo.setId(id);
		List<LikeListVO> llist =llservice.idList(vo);

		// pdlist의 liked 처리
		for(int i=0; i<pvo.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(pvo.get(i).getPdseq()==llist.get(j).getPdseq()) {
					pvo.get(i).setLiked("t");
					break;
				}
			}
		}
		
	    mv.setViewName("product/productList");
	    
	    return mv;
	}
	
	@RequestMapping(value = "/categorylist", method = RequestMethod.GET) 
	public ModelAndView category (MenuVO mvo, HttpSession session, 
			@ModelAttribute("cri") PageMaker pageMaker, ModelAndView mv, LikeListVO vo
			) throws Exception{
		
		System.out.println("pageMaker=> " + pageMaker);
		System.out.println("mubcode => " + mvo.getMubcode());
		
		pageMaker.setPerPageNum(20);
		pageMaker.setSno();
		
		if (pageMaker.getPage() < 1) {
			pageMaker.setPage(1);
		}
		
		int totalNum = pdservice.CricategoryCount(mvo);
	    pageMaker.setTotalCount(totalNum);
	    
	    System.out.println("totalNum =>" + totalNum);
	    
	    // menu(커피, 디저트, 음료, 식품, 스페셜 출력)
 		List<ProductVO> ctlist = pdservice.Cricategory(mvo, pageMaker);

 		mv.addObject("pageMaker", pageMaker);
	    mv.addObject("ctlist", ctlist);
	    
	    List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<MenuVO> cpdlist = muservice.productList(mvo);
		mv.addObject("cpdlist", cpdlist);

		int page = pageMaker.getPage();
		int startPage = pageMaker.getStartPage();
		int endPage = pageMaker.getEndPage(); 
		int tempEndPage = pageMaker.getTempEndPage();
		
		mv.addObject("page", page);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("tempEndPage", tempEndPage);
		
		mv.addObject("count", totalNum);
		
		mv.addObject("mubcode", mvo.getMubcode());
		mv.addObject("mucategory", mvo.getMucategory());
		
		/* 좋아요 */
		String id =(String)session.getAttribute("logID");

		vo.setId(id);
		List<LikeListVO> llist=llservice.idList(vo);

		// ctlist의 liked 처리
		for(int i=0; i<ctlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(ctlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					ctlist.get(i).setLiked("t");
					break;
				}
			}
		}
		mv.setViewName("product/categoryList");
	    
	    return mv;
	}
	
	@RequestMapping(value="/category")
	public ModelAndView category(ModelAndView mv, MenuVO mvo, 
			// @RequestParam(value = "mubcode") String mubcode,
			// @RequestParam(value = "mucategory") String mucategory
			HttpSession session) throws Exception{
		
		System.out.println("mubcode => " + mvo.getMubcode());
		
		// menu(커피, 디저트, 음료, 식품, 스페셜 출력)
		List<ProductVO> ctlist = pdservice.category(mvo);
		mv.addObject("ctlist", ctlist);
		
		System.out.println("ctlist =>" + ctlist.get(0));
		
		// menu category 출력 (커피, 디저트, 음료, 식품, 스페셜을 눌렀을 때 각 하위 메뉴 출력)
		List<MenuVO> cpdlist = muservice.productList(mvo);
		mv.addObject("cpdlist", cpdlist);
		
		// 메뉴 상품 갯수
	    int count = pdservice.categoryCount(mvo); 
	    
	    List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		mv.addObject("count", count);
		mv.addObject("mubcode", mvo.getMubcode());
		
		mv.setViewName("product/categoryList");
		
		return mv;
	}
	
	@RequestMapping(value="/hashtagList")
	public ModelAndView hashtagList(ModelAndView mv, String keyword, HttpSession session, LikeListVO vo) throws Exception{
	    
		System.out.println("keyword => " + keyword);
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<ProductVO> htlist = pdservice.hashtagAll(keyword);
		
		// 레코드의 갯수
	    int count = pdservice.hashtagCount(keyword);
	    
	    mv.addObject("htlist", htlist);
	    
	    System.out.println("htlist =>" + htlist.get(0));
	    
	    mv.addObject("count", count);
	    mv.addObject("keyword", keyword);
	    
	    /* 좋아요 */
		String id =(String)session.getAttribute("logID");

		vo.setId(id);
		List<LikeListVO> llist=llservice.idList(vo);

		// htlist의 liked 처리
		for(int i=0; i<htlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(htlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					htlist.get(i).setLiked("t");
					break;
				}
			}
		}
	    
	    mv.setViewName("product/hashtagList");
	    return mv;
	}
	
	// @RequestParam(defaultValue="") ==> 기본값 할당	
	@RequestMapping(value="/searchList")
	public ModelAndView searchlist(
				String searchOption, String keyword, HttpSession session, LikeListVO vo) throws Exception{
	    
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<ProductVO> pdlist = pdservice.listAll(searchOption, keyword);
		
		// 레코드의 갯수
	    int count = pdservice.countArticle(searchOption, keyword);
	    
	    ModelAndView mv = new ModelAndView();

	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("pdlist", pdlist); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mv에 저장
	    mv.addObject("keyword", keyword); // 맵에 저장된 데이터를 mv에 저장
	    
	    /* 좋아요 */
		String id =(String)session.getAttribute("logID");

		vo.setId(id);
		List<LikeListVO> llist=llservice.idList(vo);

		// htlist의 liked 처리
		for(int i=0; i<pdlist.size(); i++) {
			for(int j=0; j<llist.size(); j++) {
				if(pdlist.get(i).getPdseq()==llist.get(j).getPdseq()) {
					pdlist.get(i).setLiked("t");
					break;
				}
			}
		}
	    
	    mv.setViewName("product/searchList");
	    
	    return mv;
	}
	
	// 2020-08-04 메뉴를 눌렀을 때 출력되는 상품 페이지
	@RequestMapping(value="/mpdlist")
	public ModelAndView mpdlist(
			ModelAndView mv, MenuVO mvo, HttpSession session,
			String mubcode, String mucategory) throws Exception {

		// 커피, 디저트, 음료, 식품, 스페셜 출력
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);

		List<ProductVO> ctlist = pdservice.category(mvo);
		mv.addObject("ctlist", ctlist);
		mv.addObject("mubcode", mubcode);
		
		// menu category 출력 (커피, 디저트, 음료, 식품, 스페셜을 눌렀을 때 각 하위 메뉴 출력)
		/* String menucategory = mvo.getMucategory(); */
		List<MenuVO> cpdlist = muservice.productList(mvo);
		mv.addObject("cpdlist", cpdlist);
		
		// menu category 클릭 시 상품 리스트 출력
		String muname = mvo.getMuname();
		int count = pdservice.mProductCount(mvo); 
		List<ProductVO> mpdlist = pdservice.mProductList(mvo);
		
		mv.addObject("count", count);
		mv.addObject("muname", muname);
		
		if (mpdlist != null) {
			mv.addObject("mpdlist", mpdlist);

		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("product/mproductList");
		return mv;
	} 
	
	@RequestMapping(value="/pdinsertf")
	public ModelAndView pdinsertf(ModelAndView mv, ProductVO vo, HttpSession session) {
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<FranchiseVO> frlist = frservice.selectList();
		List<MenuVO> mulist = muservice.selectList();
				
		if(mulist != null || frlist != null) {			
			mv.addObject("mulist", mulist);
			mv.addObject("frlist", frlist);
		}	
		
		mv.setViewName("product/productWrite");
		return mv;
	}
	
	@RequestMapping(value="/bnameinsert")
	public ModelAndView bnameinsert(ModelAndView mv, ProductVO vo) {
		
		System.out.println("bnameinsert=>"+vo);
		
		List<ProductVO> catem = pdservice.categoryM(vo); // 메서드 명 소문자
		System.out.println("catem0=>"+catem.get(0));
		
		System.out.println("catemSize=>"+catem.size());
		mv.addObject("catem", catem);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/mnameinsert")
	public ModelAndView mnameinsert(ModelAndView mv, ProductVO vo) {
		
		System.out.println("mnameinsert=>"+vo);
		List<ProductVO> cates = pdservice.categoryS(vo);
		
		System.out.println("cates0=>"+cates.get(0));
		
		System.out.println("catesSize=>"+cates.size());
		mv.addObject("cates", cates);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/pdinsert")
	public ModelAndView pdinsert(ModelAndView mv, ProductVO vo) throws IOException {

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
				/* file1 = "C:/Users/Green_Computer/git/daldalhang/src/main/webapp/resources/img_product/" */
				file1 = "C:/resources/img_product/"
							+uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
				uploadfilef.transferTo(new File(file1));
				file2="resources/img_product/"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
			}
		}
		
		vo.setPduploadfile(file2);
		
		if (pdservice.insert(vo) > 0) {
			// 성공
			mv.setViewName("redirect:listPage");
		} else {
			// 실패
			mv.setViewName("home");
		}
		return mv;
	}
	
	@RequestMapping(value = "/pdetail")
	public ModelAndView pdetail(ModelAndView mv, ProductVO vo, HttpSession session) throws IOException {
		
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<FranchiseVO> frlist = frservice.selectList();
		List<MenuVO> mulist = muservice.selectList();
		
		mv.addObject("mulist", mulist);
		mv.addObject("frlist", frlist);
		
		vo = pdservice.pdetail(vo);
		mv.addObject("pdetail", vo);
		mv.setViewName("product/productDetail");
		return mv;
	}
	
	@RequestMapping(value = "/pdelete")
	public ModelAndView pdelete(ModelAndView mv, ProductVO vo) throws IOException {
		
		if (pdservice.delete(vo) > 0) {
			// 성공
			mv.addObject("deleteCode", "deleteS");
		} else {
			// 실패
			mv.addObject("deleteCode", "deleteF");
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
}