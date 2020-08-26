package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CalendarVO;

@Repository
public class CalendarDAO {
	
	@Autowired
	private SqlSession dao;
	private static final String CD="daldal.mappers.calendarMapper.";

	public List<CalendarVO>selectList(CalendarVO vo){
		return dao.selectList(CD+"selectList", vo);
	}
	
	public int listCount(CalendarVO vo) {
		return dao.selectOne(CD+"listCount", vo);
	}

	public CalendarVO selectOne(CalendarVO vo) {
		return dao.selectOne(CD+"selectDetail", vo);
	}

	public int insert(CalendarVO vo) {
		return dao.insert(CD+"insertCalendar", vo);
	}

	public int update(CalendarVO vo) {
		return dao.update(CD+"updateCalendar", vo);
	}

	public int delete(CalendarVO vo) {
		return dao.delete(CD+"deleteCalendar", vo);
	}
	
	public CalendarVO CalendarView(String calseq) {
		return dao.selectOne(CD+"CalendarView", calseq);
	}
} // class
