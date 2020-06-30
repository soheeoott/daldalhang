package service;

import java.util.List;

import vo.PersonalVO;

public interface PService {

	List<PersonalVO> selectList();
	
	PersonalVO selectOne(PersonalVO vo);
	
	int insert(PersonalVO vo);
	
	int update(PersonalVO vo);
	
	int delete(PersonalVO vo);

	int IdCheck(String id);
}