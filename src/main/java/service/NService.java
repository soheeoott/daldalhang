package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.NoticeVO;
import vo.PrevNextVO;

public interface NService {

	// Search Criteria
	public int searchRowCount(SearchCriteria cri);
	public List<NoticeVO> searchList(SearchCriteria cri);
	PrevNextVO selectPrevNext(PrevNextVO pnvo);	// 이전글다음글
	
	int totalRowCount();
	
	int countUp(NoticeVO vo);				// countUp
	
	List<NoticeVO> selectList();

	NoticeVO selectOne(NoticeVO vo);

	int update(NoticeVO vo);

	int insert(NoticeVO vo);

	int delete(NoticeVO vo);
}