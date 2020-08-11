package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FranchiseDAO;
import vo.FranchiseVO;

@Service
public class FRServiceImpl implements FRService {
	
	@Autowired
	FranchiseDAO dao;
	
	@Override
	public List<FranchiseVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public FranchiseVO selectOne(FranchiseVO fvo) {
		return dao.selectOne(fvo);
	}

	@Override
	public List<FranchiseVO> fsortList(String frcode) {
		return dao.fsortList(frcode);
	}

	@Override
	public int fsortCount(String frcode) {
		return dao.fsortCount(frcode);
	}
}