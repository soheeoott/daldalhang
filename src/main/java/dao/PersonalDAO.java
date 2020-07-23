package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PersonalVO;

@Repository
public class PersonalDAO {
	
	@Autowired // 자동주입
	private SqlSession sqlsession;
	private static final String PS = "ver01.mappers.personalMapper."; // NameSpace 상수 = 대문자
	
	public void verify(PersonalVO vo){
		sqlsession.update(PS + "verify", vo);
	}
	
	// @Override : 조상에 아무것도 없는데 Override 지정 - 오류
	public List<PersonalVO> selectList() {
		return (List)sqlsession.selectList(PS + "selectList");
	}
	
	public PersonalVO selectOne(PersonalVO vo) {
		return sqlsession.selectOne(PS + "selectOne", vo);
	}
	
	public int insert(PersonalVO vo) {
		return sqlsession.insert(PS + "insert", vo);
	}
	
	public int update(PersonalVO vo) {
		return sqlsession.update(PS + "update", vo);
	}
	
	public int delete(PersonalVO vo) {
		return sqlsession.delete(PS + "delete", vo);
	}

	public int IdCheck(String id) {
		return sqlsession.selectOne(PS + "IdCheck", id);
	}

	public PersonalVO findid(PersonalVO vo) {
		return sqlsession.selectOne(PS + "findid", vo);
	}

	public void updatepw(PersonalVO vo) {
		sqlsession.update(PS + "updatepw", vo);
	}
}