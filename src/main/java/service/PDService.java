package service;

import java.util.List;

import vo.ProductVO;

public interface PDService {

	List<ProductVO> selectList();
	
	ProductVO selectOne(ProductVO vo);
	
	int insert(ProductVO vo);
	
	List<ProductVO> mProductList(String muname);
}