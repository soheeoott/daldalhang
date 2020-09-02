package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FranchiseVO;
import vo.ProductVO;

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
	
	public List<FranchiseVO> fsortList(ProductVO pvo) {
		return sqlsession.selectList(FD + "fsortList", pvo);
	}

	public int fsortCount(ProductVO pvo) {
	    return sqlsession.selectOne(FD + "fsortCount", pvo);
	}
	
	public List<FranchiseVO> franchiseMenu(ProductVO pvo) {
		return sqlsession.selectList(FD + "franchiseMenu", pvo);
	}
	
	public List<ProductVO> franchiseSubMenu(ProductVO pvo) {
		return sqlsession.selectList(FD + "franchiseSubMenu", pvo);
	}
	
	public int franchiseSubCount(ProductVO pvo) {
		return sqlsession.selectOne(FD + "franchiseSubCount", pvo);
	}

	public int insert(FranchiseVO fvo) {
		return sqlsession.insert(FD + "insert", fvo);
	}
}