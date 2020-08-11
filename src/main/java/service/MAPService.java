package service;

import java.util.List;

import vo.LlmapVO;

public interface MAPService {
	
	List<LlmapVO> selectList();
	LlmapVO selectOne(LlmapVO lvo);
	
	List<LlmapVO> mapSearch(String searchOption, String keyword) throws Exception;
}
