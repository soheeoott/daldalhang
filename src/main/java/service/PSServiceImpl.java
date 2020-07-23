package service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PersonalDAO;
import vo.PersonalVO;

@Service
public class PSServiceImpl implements PSService {
	
	@Autowired
	PersonalDAO dao;
	
	@Override
	public void updatepw(PersonalVO vo){
		dao.updatepw(vo);
	}
	
	@Override
	public PersonalVO findid(PersonalVO vo){
		return dao.findid(vo);
	}
	
	@Override
	public void verify(PersonalVO vo) {
		dao.verify(vo);
	}
	
	@Override
	public int IdCheck(String id) {
		return dao.IdCheck(id);
	}
	
	@Override
	public List<PersonalVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public PersonalVO selectOne(PersonalVO vo) { // row(vo) 전달 받아 수정
		return dao.selectOne(vo); // 처리된 row 갯수 return
	}
	
	@Override
	public int insert(PersonalVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public int update(PersonalVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(PersonalVO vo) {
		return dao.delete(vo);
	}
}