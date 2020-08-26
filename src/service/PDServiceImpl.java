package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProductDAO;
import vo.ProductVO;

@Service
public class PDServiceImpl implements PDService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public ProductVO selectOne(ProductVO vo) { 
		return dao.selectOne(vo);
	}
	
	@Override
	public int insert(ProductVO vo) {
		return dao.insert(vo);
	}
}