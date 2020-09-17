package service;

import java.util.List;

import ProductCri.Criteria;
import ProductCri.PageMaker;
import vo.MenuVO;
import vo.ProductVO;

public interface PDService {
	
	public List<ProductVO> fsortList(ProductVO vo);

	public List<ProductVO> categoryM(ProductVO vo);
	
	public List<ProductVO> categoryS(ProductVO vo);
	
	public List<ProductVO> listCriteria (PageMaker pageMaker) throws Exception;
	
	public int TotalCount() throws Exception;
	
	// 메뉴 목록
	public List<ProductVO> Cricategory(MenuVO mvo, PageMaker pageMaker) throws Exception;
		
	// 메뉴 갯수
	public int CricategoryCount(MenuVO mvo) throws Exception;
	
	// public List<ProductVO> category(String mubcode, String mucategory) throws Exception;
	public List<ProductVO> category(MenuVO mvo) throws Exception;
	
	public int categoryCount(MenuVO mvo) throws Exception;
	
	public List<ProductVO> SeasonList();
	
	public List<ProductVO> NewList();
	
	public List<ProductVO> BestList();
	
	List<ProductVO> selectList();
	
	ProductVO selectOne(ProductVO vo);
	
	int insert(ProductVO vo);
	
	int delete(ProductVO vo);
	
	ProductVO pdetail(ProductVO vo);
	
	List<ProductVO> mProductList(MenuVO mvo);
	
	// 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ProductVO> listAll(String searchOption, String keyword) throws Exception;
	
	// 게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	// 해시태그 전체 목록 ==> 키워드 매개변수 추가
	public List<ProductVO> hashtagAll(String keyword) throws Exception;
	
	// 해시태그 레코드 갯수 메서드 추가
	public int hashtagCount(String keyword) throws Exception;
	
	// 서브 메뉴 갯수
	public int mProductCount(MenuVO mvo) throws Exception;
}