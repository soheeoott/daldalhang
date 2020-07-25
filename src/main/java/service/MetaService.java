package service;

import java.util.List;

import vo.MetacodeVO;

public interface MetaService {
	
	List<MetacodeVO> selectList();
	
	MetacodeVO selectOne(MetacodeVO mvo);
}