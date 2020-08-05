package service;

import java.util.List;

import vo.ProductVO;

public interface PDService {

	List<ProductVO> selectList();
	
	ProductVO selectOne(ProductVO vo);
	
	int insert(ProductVO vo);
	
	List<ProductVO> mProductList(String muname);
	
	// 05. 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ProductVO> listAll(String searchOption, String keyword) throws Exception;
	
	// 07. 게시글 레코드 갯수 메서드 추가
	public int countArticle(String searchOption, String keyword) throws Exception;
}