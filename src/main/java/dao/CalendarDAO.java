package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CalendarVO;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private static final String CD="daldal.mappers.calendarMapper.";

	public List<CalendarVO>selectList(CalendarVO vo){
		return sqlsession.selectList(CD+"selectList", vo);
	}
	
	public List<CalendarVO> eventOne(String frcode) throws Exception {
		return sqlsession.selectList(CD+"eventOne", frcode);
	}
	
	public int listCount(CalendarVO vo) {
		return sqlsession.selectOne(CD+"listCount", vo);
	}

	public CalendarVO selectOne(CalendarVO vo) {
		return sqlsession.selectOne(CD+"selectDetail", vo);
	}

	public int insert(CalendarVO vo) {
		return sqlsession.insert(CD+"insertCalendar", vo);
	}

	public int update(CalendarVO vo) {
		return sqlsession.update(CD+"updateCalendar", vo);
	}

	public int delete(CalendarVO vo) {
		return sqlsession.delete(CD+"deleteCalendar", vo);
	}
	
	public CalendarVO CalendarView(String calseq) {
		return sqlsession.selectOne(CD+"CalendarView", calseq);
	}
} // class
