package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criTest.Criteria;
import criTest.SearchCriteria;
import dao.NoticeDAO;
import vo.NoticeVO;
import vo.PageVO;
import vo.PrevNextVO;

@Service
public class NServiceImpl implements NService { 

	@Autowired
	NoticeDAO dao;
	
	// Search Criteria
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return dao.searchRowCount(cri);
	} // searchRowCount
	
	@Override
	public List<NoticeVO> searchList(SearchCriteria cri) {
		return dao.searchList(cri);
	} // searchList()
	
	// 이전글다음글
	@Override
	public PrevNextVO selectPrevNext(PrevNextVO pnvo) {
		return dao.selectPrevNext(pnvo);
	}
	
	// Paging
	@Override
	public int totalRowCount() {
		return dao.totalRowCount();
	} // totalRowCount
	
	@Override
	public List<NoticeVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public int countUp(NoticeVO vo) {
		return dao.countUp(vo);
	}

	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	}
	
	@Override
	public int update(NoticeVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int insert(NoticeVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public int delete(NoticeVO vo) {
		return dao.delete(vo);
	}
}