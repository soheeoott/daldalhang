package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String MU = "ver01.mappers.menuMapper.";
	
	public List<MenuVO> selectList() {
		return sqlsession.selectList(MU + "selectList");
	}
	
	public MenuVO selectOne(MenuVO mvo) {
		return sqlsession.selectOne(MU + "selectOne", mvo);
	}
}