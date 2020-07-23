package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FranchiseDAO;
import vo.FranchisecodeVO;

@Service
public class FServiceImpl implements FService {
	
	@Autowired
	FranchiseDAO dao;
	
	@Override
	public List<FranchisecodeVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public FranchisecodeVO selectOne(FranchisecodeVO fvo) {
		return dao.selectOne(fvo);
	}
}