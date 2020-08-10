package service;

import java.util.List;

import vo.FranchiseVO;

public interface FRService {
	
	List<FranchiseVO> selectList();
	
	FranchiseVO selectOne(FranchiseVO fvo);
}
