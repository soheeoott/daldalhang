package service;

import java.util.List;

import ProductCri.Criteria;
import ProductCri.PageMaker;
import vo.ProductVO;

public interface PDService {

	public List<ProductVO> listCriteria (PageMaker pageMaker) throws Exception;
	
	public int TotalCount() throws Exception;
	
	public List<ProductVO> SeasonList();
	
	public List<ProductVO> NewList();
	
	public List<ProductVO> BestList();
	
	List<ProductVO> selectList();
	
	ProductVO selectOne(ProductVO vo);
	
	int insert(ProductVO vo);
	
	List<ProductVO> mProductList(String muname);
	
	// 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ProductVO> listAll(String searchOption, String keyword) throws Exception;
	
	// 게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	// 해시태그 전체 목록 ==> 키워드 매개변수 추가
	public List<ProductVO> hashtagAll(String keyword) throws Exception;
	
	// 해시태그 레코드 갯수 메서드 추가
	public int hashtagCount(String keyword) throws Exception;
	
	// 메뉴 목록
	public List<ProductVO> category(String mubcode, String mucategory, PageMaker pageMaker) throws Exception;
	
	// 메뉴 갯수
	public int categoryCount(String mubcode) throws Exception;
	
	// 서브 메뉴 갯수
	public int mProductCount(String muname) throws Exception;
	
}