package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FranchiseVO;

@Repository
public class FranchiseDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String FD = "daldal.mappers.franchiseMapper.";
	
	public List<FranchiseVO> selectList() {
		return sqlsession.selectList(FD + "selectList");
	}
	
	public FranchiseVO selectOne(FranchiseVO fvo) {
		return sqlsession.selectOne(FD + "selectOne", fvo);
	}
}