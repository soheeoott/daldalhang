package service;

import java.util.List;

import vo.FranchisecodeVO;

public interface FService {
	
	List<FranchisecodeVO> selectList();
	
	FranchisecodeVO selectOne(FranchisecodeVO fvo);
}
