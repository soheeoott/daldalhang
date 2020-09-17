package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.LlmapVO;

@Repository
public class LlmapDAO {
	
	@Autowired
	private SqlSession sqlsession;
	private static final String LD = "daldal.mappers.llmapMapper.";
	
	public List<LlmapVO> selectList() {
		return sqlsession.selectList(LD + "selectList");
	}
	
	public LlmapVO selectOne(LlmapVO lvo) {
		return sqlsession.selectOne(LD + "selectOne", lvo);
	}
	
	public List<LlmapVO> mapBSearch(String mapBKeyword) throws Exception {	
		return sqlsession.selectList(LD + "mapBSearch", mapBKeyword);
	}
	
	public List<LlmapVO> mapFSearch(String mapFKeyword) throws Exception {
		return sqlsession.selectList(LD + "mapFSearch", mapFKeyword);
	}
}
