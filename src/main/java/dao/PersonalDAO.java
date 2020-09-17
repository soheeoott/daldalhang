package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PersonalVO;

@Repository
public class PersonalDAO {
	
	@Autowired // 자동주입
	private SqlSession sqlsession;
	private static final String PS = "daldal.mappers.personalMapper."; // NameSpace 상수 = 대문자
	
	public void verify(PersonalVO vo){
		sqlsession.update(PS + "verify", vo);
	}
	
	// @Override : 조상에 아무것도 없는데 Override 지정 - 오류
	public List<PersonalVO> selectList() {
		return sqlsession.selectList(PS + "selectList");
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
	
	public int emailCheck(String email_id, String email_domain) {
		Map<String, String> email = new HashMap<String, String>();
		email.put("email_id", email_id);
		email.put("email_domain", email_domain);
		return sqlsession.selectOne(PS + "emailCheck", email);
	}

	public PersonalVO findid(PersonalVO vo) {
		return sqlsession.selectOne(PS + "findid", vo);
	}

	public int eupdate(PersonalVO vo) {
		return sqlsession.update(PS+ "eupdate", vo);
	}
	
	public int pwupdate(PersonalVO vo) {
		return sqlsession.update(PS+ "pwupdate", vo);
	}
}