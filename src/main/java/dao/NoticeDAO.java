package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criTest.Criteria;
import criTest.SearchCriteria;
import vo.NoticeVO;
import vo.PageVO;
import vo.PrevNextVO;

@Repository
public class NoticeDAO {
	// @Inject =>  Java 제공
	// @Autowired => 스프링 제공
	@Autowired
	private SqlSession sqlsession;
	private static final String NS="daldal.mappers.noticeMapper.";

	// Search Criteria
	public int searchRowCount(SearchCriteria cri) {
		return sqlsession.selectOne(NS+"searchRowCount",cri);
	} // searchRowCount
	
	public List<NoticeVO> searchList(SearchCriteria cri) {
		return sqlsession.selectList(NS+"searchList",cri);
	} // searchList()
	
	public PrevNextVO selectPrevNext(PrevNextVO pnvo){
		return sqlsession.selectOne(NS+"selectPrevNext",pnvo);
	} // selectPrevNext()
	
	// Paging Test
	public int totalRowCount() {
		return sqlsession.selectOne(NS+"totalRowCount");
	} // totalRowCount
	
	public int countUp(NoticeVO vo) {
		return sqlsession.update(NS+"countUp",vo);
	} // countUp() 조회수
	
	public List<NoticeVO> selectList() {
		return sqlsession.selectList(NS+"selectList");
	} // selectList()

	public NoticeVO selectOne(NoticeVO vo){
		return sqlsession.selectOne(NS+"selectOne",vo);
	} // selectOne()
	
	public int insert(NoticeVO vo) {
		return sqlsession.insert(NS+"insert",vo);
	} // insert()
	
	public int update(NoticeVO vo) {
		return sqlsession.update(NS+"update",vo);
	} // update()
	
	public int delete(NoticeVO vo) {
		return sqlsession.delete(NS+"delete",vo);
	} // delete()
}