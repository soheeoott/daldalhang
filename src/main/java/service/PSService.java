package service;

import java.util.List;

import vo.PersonalVO;

public interface PSService {

	List<PersonalVO> selectList();
	
	PersonalVO selectOne(PersonalVO vo);
	
	int insert(PersonalVO vo);
	
	int update(PersonalVO vo);
	
	int delete(PersonalVO vo);

	int IdCheck(String id);
	
	void verify(PersonalVO vo);

	PersonalVO findid(PersonalVO vo);
	
	int eupdate(PersonalVO vo);
	
	int pwupdate(PersonalVO vo);
}