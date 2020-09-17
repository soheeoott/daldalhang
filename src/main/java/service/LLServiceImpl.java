package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LikeListDAO;
import vo.LikeListVO;
import vo.PersonalVO;

@Service
public class LLServiceImpl implements LLService {

	@Autowired
	LikeListDAO dao;
	
	@Override
	public int likecreate(LikeListVO vo) {
		return dao.likecreate(vo);
	}
	
	@Override
	public int likecheck(LikeListVO vo) {
		return dao.likecheck(vo);
	}
	
	@Override
	public int delete(LikeListVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public List<LikeListVO> selectList(LikeListVO vo) {
		return dao.selectList(vo);
	}
	
	@Override
	public List<LikeListVO> idList(LikeListVO vo) {
		return dao.idList(vo);
	}
	
	@Override
	public LikeListVO selectOne(LikeListVO vo) { 
		return dao.selectOne(vo); 
	}
}
