package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ProductCri.Criteria;
import ProductCri.PageMaker;
import dao.ProductDAO;
import vo.MenuVO;
import vo.ProductVO;

@Service
public class PDServiceImpl implements PDService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> categoryM(ProductVO vo) {
		return dao.categoryM(vo);
	}

	@Override
	public List<ProductVO> categoryS(ProductVO vo) {
		return dao.categoryS(vo);
	}
	
	@Override
	public List<ProductVO> listCriteria (PageMaker pageMaker) throws Exception {
		return dao.listCriteria(pageMaker);
	}
	
	@Override
	public int TotalCount() throws Exception {
		return dao.TotalCount();
	}
	
	@Override
	public List<ProductVO> Cricategory(MenuVO mvo, PageMaker pageMaker) throws Exception {
		return dao.Cricategory(mvo, pageMaker);
	}

	@Override
	public int CricategoryCount(String mubcode) throws Exception {
		return dao.CricategoryCount(mubcode);
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
	public int mProductCount(String muname) throws Exception {
		return dao.mProductCount(muname);
	}
}