package service;

import java.util.List;

import vo.ProductVO;

public interface PDService {

	List<ProductVO> selectList();
	
	ProductVO selectOne(ProductVO vo);
}