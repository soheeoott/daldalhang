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
	public List<ProductVO> fsortList(ProductVO vo) {
		return dao.fsortList(vo);
	}
	
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
	public int CricategoryCount(MenuVO mvo) throws Exception {
		return dao.CricategoryCount(mvo);
	}
	
	@Override
	public List<ProductVO> category(MenuVO mvo) throws Exception {
		return dao.category(mvo);
	}

	@Override
	public int categoryCount(MenuVO mvo) throws Exception {
		return dao.categoryCount(mvo);
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
	public int delete(ProductVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public ProductVO pdetail(ProductVO vo) {
		return dao.pdetail(vo);
	}

	@Override
	public List<ProductVO> mProductList(MenuVO mvo) {
		return dao.mProductList(mvo);
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
	public int mProductCount(MenuVO mvo) throws Exception {
		return dao.mProductCount(mvo);
	}
}