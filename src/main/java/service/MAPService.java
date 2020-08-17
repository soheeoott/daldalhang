package service;

import java.util.List;

import vo.LlmapVO;

public interface MAPService {
	
	List<LlmapVO> selectList();
	LlmapVO selectOne(LlmapVO lvo);
	
	List<LlmapVO> mapBSearch(String mapBKeyword) throws Exception;
	List<LlmapVO> mapFSearch(String mapFKeyword) throws Exception;
}
