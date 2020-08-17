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
	
	public List<FranchiseVO> fsortList(String frcode) {
		return sqlsession.selectList(FD + "fsortList", frcode);
	}
	
	/*
	public List<FranchiseVO> fsortList(String frcode, String frkname) {
		Map<String, String> fsort = new HashMap<String, String>();
		fsort.put("frcode", frcode);
		fsort.put("frkname", frkname);
		return sqlsession.selectList(FD + "fsortList", fsort);
	}
	*/
	
	public int fsortCount(String frcode) {
	    return sqlsession.selectOne(FD + "fsortCount", frcode);
	}
	
	public List<FranchiseVO> franchiseMenu(String frcode) {
		return sqlsession.selectList(FD + "franchiseMenu", frcode);
	}
	
	public List<FranchiseVO> franchiseSubMenu(String mname, String frcode) {
		
		Map<String, String> submenu = new HashMap<String, String>();
		submenu.put("mname", mname);
		submenu.put("frcode", frcode);
		return sqlsession.selectList(FD + "franchiseSubMenu", submenu);
	}
	
	public int franchiseSubCount(String mname, String frcode) {
		
		Map<String, String> submenu = new HashMap<String, String>();
		submenu.put("mname", mname);
		submenu.put("frcode", frcode);
		return sqlsession.selectOne(FD + "franchiseSubCount", submenu);
	}
}