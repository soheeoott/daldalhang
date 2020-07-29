package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import vo.LlmapVO;

@Repository
public class LlmapDAO {
	
	private SqlSession sqlsession;
	private static final String LD = "daldal.mappers.llmapMapper.";
	
	public List<LlmapVO> selectList() {
		return sqlsession.selectList(LD + "selectList");
	}
	
	public LlmapVO selectOne(LlmapVO lvo) {
		return sqlsession.selectOne(LD + "selectOne", lvo);
	}
}
