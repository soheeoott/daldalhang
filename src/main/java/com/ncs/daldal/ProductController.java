package com.ncs.daldal;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	// @RequestParam(defaultValue="") ==> 기본값 할당	
	@RequestMapping(value="/searchList")
	public ModelAndView searchlist(
				String searchOption, String keyword) throws Exception{
	    
		List<ProductVO> pdlist = pdservice.listAll(searchOption, keyword);
		// 레코드의 갯수
	    int count = pdservice.countArticle(searchOption, keyword);
	    
	    // ModelAndView - 모델과 뷰
	    ModelAndView mv = new ModelAndView();
	    /*mav.addObject("list", list); // 데이터를 저장
	    mav.addObject("count", count);
	    mav.addObject("searchOption", searchOption);
	    mav.addObject("keyword", keyword);*/
	    
	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("pdlist", pdlist); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mv에 저장
	    mv.setViewName("product/searchList");
	    
	    return mv;
	}
	
	// 2020-08-04 메뉴를 눌렀을 때 출력되는 상품 페이지
	@RequestMapping(value="/mpdlist")
	public ModelAndView mpdlist(ModelAndView mv, MenuVO mvo, HttpSession session) {
		
		// 세션에 저장된 값 menu 불러와 다시 저장 => session null
/*		String menulist = (String)session.getAttribute("menulist");
		mv.addObject("menulist", menulist);		
		System.out.println("menulist => "+menulist);
*/		
		// 2020.08.03 menu 출력
		List<MenuVO> mulist = muservice.selectList();
		mv.addObject("mulist", mulist);
		
		// menu category 출력
		String menucategory = mvo.getMucategory();
		List<MenuVO> cpdlist = muservice.productList(menucategory);
		mv.addObject("cpdlist", cpdlist);
		
		// menu category 클릭 시 상품 리스트 출력
		String muname = mvo.getMuname();
		List<ProductVO> mpdlist = pdservice.mProductList(muname);
		
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
		// 상품 리스트 출력
		List<ProductVO> pdlist = pdservice.selectList();

		// 2020.08.03 menu 출력
		List<MenuVO> mulist = muservice.selectList();
		mv.addObject("mulist", mulist);
		
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
		
		mulist = muservice.selectList();
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