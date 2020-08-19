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
	public List<ProductVO> SeasonList() {
		return dao.SeasonList();
	}
	
	@Override
	public List<ProductVO> NewList() {
		return dao.NewList();
	}
	
	@Override
	public List<ProductVO> BestList() {
		return dao.BestList();
	}
	
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

	@Override
	public List<ProductVO> mProductList(String muname) {
		return dao.mProductList(muname);
	}
	
	// 05. 게시글 전체 목록 boardDAO.listAll메서드 호출
	@Override
	public List<ProductVO> listAll(String searchOption, String keyword) throws Exception {
	    return dao.listAll(searchOption, keyword);
	}
	
	// 07. 게시글 레코드 갯수 boardDao.countArticle메서드 
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
	    return dao.countArticle(searchOption, keyword);
	}

	@Override
	public List<ProductVO> hashtagAll(String keyword) throws Exception {
		return dao.hashtagAll(keyword);
	}

	@Override
	public int hashtagCount(String keyword) throws Exception {
		return dao.hashtagCount(keyword);
	}

	@Override
	public List<ProductVO> category(String mubcode, String mucategory) throws Exception {
		return dao.category(mubcode, mucategory);
	}

	@Override
	public int categoryCount(String mubcode) throws Exception {
		return dao.categoryCount(mubcode);
	}

	@Override
	public int mProductCount(String muname) throws Exception {
		return dao.mProductCount(muname);
	}
}