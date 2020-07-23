package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FranchisecodeVO;

@Repository
public class FranchiseDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String FD = "ver01.mappers.franchiseMapper.";
	
	public List<FranchisecodeVO> selectList() {
		return (List)sqlsession.selectList(FD + "selectList");
	}
	
	public FranchisecodeVO selectOne(FranchisecodeVO fvo) {
		return sqlsession.selectOne(FD + "selectOne", fvo);
	}
}