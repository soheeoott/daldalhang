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

import ProductCri.Criteria;
import ProductCri.PageMaker;
import service.FRService;
import service.MUService;
import service.PDService;
import vo.FranchiseVO;
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

	@RequestMapping(value = "/listPage", method = RequestMethod.GET) 
	public ModelAndView listPage(MenuVO mvo, HttpSession session,
			@ModelAttribute("cri") PageMaker pageMaker, ModelAndView mv) throws Exception {
		
		System.out.println("pageMaker=> " + pageMaker);
		
		pageMaker.setPerPageNum(20);
		pageMaker.setSno();
		
		if (pageMaker.getPage() < 1) {
			pageMaker.setPage(1);
		}
		
		int totalNum = pdservice.TotalCount();
	    pageMaker.setTotalCount(totalNum);
	    
		List<ProductVO> pvo = pdservice.listCriteria(pageMaker);
	    
	    mv.addObject("pageMaker", pageMaker);
	    
	    System.out.println("pageMaker=> " + pageMaker);
	    
	    mv.addObject("list", pvo);
	    
	    List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		// menu 클릭했을 때 나오는 category 출력
		String mucategory = mvo.getMucategory();

		List<MenuVO> cpdlist = muservice.productList(mucategory);
		mv.addObject("cpdlist", cpdlist);
		
		if (pvo != null) {
			mv.addObject("pdlist", pvo);

		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		
	    mv.setViewName("product/productList");
	    
	    return mv;
	}
	
	@RequestMapping(value = "/categorylist", method = RequestMethod.GET) 
	public ModelAndView category
	(ModelAndView mv, MenuVO mvo, 
			String mubcode, String mucategory, HttpSession session,
			@ModelAttribute("cri") PageMaker pageMaker) throws Exception{
		
		System.out.println("pageMaker=> " + pageMaker);
		System.out.println("mubcode => " + mubcode);
		
		pageMaker.setPerPageNum(20);
		pageMaker.setSno();
		
		if (pageMaker.getPage() < 1) {
			pageMaker.setPage(1);
		}
		
		int totalNum = pdservice.categoryCount(mubcode);
	    pageMaker.setTotalCount(totalNum);
	    
	    mv.addObject("pageMaker", pageMaker);
	    
	    System.out.println("pageMaker=> " + pageMaker);
	    
	    List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		List<MenuVO> cpdlist = muservice.productList(mucategory);
		mv.addObject("cpdlist", cpdlist);
		
		// menu(커피, 디저트, 음료, 식품, 스페셜 출력)
		List<ProductVO> ctlist = pdservice.category(mubcode, mucategory, pageMaker);
		mv.addObject("ctlist", ctlist);
		
		System.out.println("ctlist =>" + ctlist.get(0));
		
		// 메뉴 상품 갯수
	    int count = pdservice.categoryCount(mubcode); 
	    
		/* List<MenuVO> mulist = muservice.menu(); */
		mv.addObject("count", count);
		mv.addObject("mubcode", mubcode);
		
		mv.setViewName("product/categoryList");
	    
	    return mv;
	}
	
	/*
	@RequestMapping(value="/category")
	public ModelAndView category(ModelAndView mv, MenuVO mvo, String mubcode, String mucategory, HttpSession session) throws Exception{
		
		System.out.println("mubcode => " + mubcode);
		
		// menu(커피, 디저트, 음료, 식품, 스페셜 출력)
		List<ProductVO> ctlist = pdservice.category(mubcode, mucategory);
		mv.addObject("ctlist", ctlist);
		
		System.out.println("ctlist =>" + ctlist.get(0));
		
		// menu category 출력 (커피, 디저트, 음료, 식품, 스페셜을 눌렀을 때 각 하위 메뉴 출력)
		List<MenuVO> cpdlist = muservice.productList(mucategory);
		mv.addObject("cpdlist", cpdlist);
		
		// 메뉴 상품 갯수
	    int count = pdservice.categoryCount(mubcode); 
	    
		/* List<MenuVO> mulist = muservice.menu(); */
	
	/*
		mv.addObject("count", count);
		mv.addObject("mubcode", mubcode);
		
		mv.setViewName("product/categoryList");
		
		return mv;
	}
	*/
	
	@RequestMapping(value="/hashtagList")
	public ModelAndView hashtagList(ModelAndView mv, String keyword) throws Exception{
	    
		System.out.println("keyword => " + keyword);
		
		List<ProductVO> htlist = pdservice.hashtagAll(keyword);
		
		// 레코드의 갯수
	    int count = pdservice.hashtagCount(keyword);
	    
	    mv.addObject("htlist", htlist);
	    
	    System.out.println("htlist =>" + htlist.get(0));
	    
	    mv.addObject("count", count);
	    mv.addObject("keyword", keyword);
	    mv.setViewName("product/hashtagList");
	    
	    return mv;
	}
	
	// @RequestParam(defaultValue="") ==> 기본값 할당	
	@RequestMapping(value="/searchList")
	public ModelAndView searchlist(
				String searchOption, String keyword) throws Exception{
	    
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
	    
	    mv.setViewName("product/searchList");
	    
	    return mv;
	}
	
	// 2020-08-04 메뉴를 눌렀을 때 출력되는 상품 페이지
	@RequestMapping(value="/mpdlist")
	public ModelAndView mpdlist(
			ModelAndView mv, MenuVO mvo, HttpSession session,
			String mubcode, String mucategory, PageMaker pageMaker) throws Exception {
		
		// 세션에 저장된 값 menu 불러와 다시 저장 => session null
/*		String menulist = (String)session.getAttribute("menulist");
		mv.addObject("menulist", menulist);		
		System.out.println("menulist => "+menulist);
*/		
		// 커피, 디저트, 음료, 식품, 스페셜 출력
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
//		// 2020.08.03 menu 출력
//		List<MenuVO> mulist = muservice.menu();
//		mv.addObject("mulist", mulist);
		
		List<ProductVO> ctlist = pdservice.category(mubcode, mucategory, pageMaker);
		mv.addObject("ctlist", ctlist);
		mv.addObject("mubcode", mubcode);
		
		// menu category 출력 (커피, 디저트, 음료, 식품, 스페셜을 눌렀을 때 각 하위 메뉴 출력)
		String menucategory = mvo.getMucategory();
		List<MenuVO> cpdlist = muservice.productList(menucategory);
		mv.addObject("cpdlist", cpdlist);
		
		// menu category 클릭 시 상품 리스트 출력
		String muname = mvo.getMuname();
		int count = pdservice.mProductCount(muname); 
		List<ProductVO> mpdlist = pdservice.mProductList(muname);
		
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
	
	@RequestMapping(value="/pdlist")
	public ModelAndView pdlist(ModelAndView mv, MenuVO mvo, HttpSession session) {
		
		// 세션에 저장된 값 menu 불러와 다시 저장 => session null
/*		String menulist = (String)session.getAttribute("menulist");
		mv.addObject("menulist", menulist);
	*/	
		List<MenuVO> menulist = muservice.menu();
		session.setAttribute("menulist", menulist);
		
		// 상품 리스트 출력
		List<ProductVO> pdlist = pdservice.selectList();

		// 2020.08.03 menu 출력
//		List<MenuVO> mulist = muservice.menu();
//		mv.addObject("mulist", mulist);
		
		// menu 클릭했을 때 나오는 category 출력
		String mucategory = mvo.getMucategory();

		List<MenuVO> cpdlist = muservice.productList(mucategory);
		mv.addObject("cpdlist", cpdlist);
		
		if (pdlist != null) {
			mv.addObject("pdlist", pdlist);

		} else {
			mv.addObject("message", "검색된 자료가 없습니다.");
		}
		mv.setViewName("product/productList");
		return mv;
	}
	
	@RequestMapping(value="/pdinsertf")
	public ModelAndView pinsertf(ModelAndView mv, List<MenuVO> mulist, 
			List<FranchiseVO> frlist) {
		
		mulist = muservice.menu();
		frlist = frservice.selectList();
		
		if(mulist != null || frlist != null) {			
			mv.addObject("mulist", mulist);
			mv.addObject("frlist", frlist);
		}	
		
		mv.setViewName("product/productWrite");
		return mv;
	}
	
	@RequestMapping(value = "/pdinsert")
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
				file1 = "C:/Users/Green_Computer/git/daldalhang/src/main/webapp/resources/img_product/"
							+uploadfilef.getOriginalFilename(); // 드라이브에 저장되는 실제 경로
				uploadfilef.transferTo(new File(file1));
				file2="resources/img_product"+uploadfilef.getOriginalFilename(); // DB에서 사용하는 경로
			}
		}
		
		vo.setPduploadfile(file2);
		
		if (pdservice.insert(vo) > 0) {
			// 성공
			mv.setViewName("pdlist");
		} else {
			// 실패
			mv.setViewName("home");
		}
		return mv;
	}
}