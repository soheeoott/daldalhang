package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MetacodeVO;

@Repository
public class MetacodeDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String MT = "ver01.mappers.metacodeMapper.";
	
	public List<MetacodeVO> selectList() {
		return (List)sqlsession.selectList(MT + "selectList");
	}
	
	public MetacodeVO selectOne(MetacodeVO mvo) {
		return sqlsession.selectOne(MT + "selectOne", mvo);
	}
}