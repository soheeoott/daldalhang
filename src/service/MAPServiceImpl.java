package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LlmapDAO;
import vo.LlmapVO;

@Service
public class MAPServiceImpl implements MAPService {

	@Autowired
	LlmapDAO dao;
	
	@Override
	public List<LlmapVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public LlmapVO selectOne(LlmapVO lvo) {
		return dao.selectOne(lvo);
	}
}
