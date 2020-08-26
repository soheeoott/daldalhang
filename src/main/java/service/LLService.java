package service;

import java.util.List;

import vo.LikeListVO;
import vo.PersonalVO;

public interface LLService {
	
	int likecreate(LikeListVO vo);
	
	int likecheck(LikeListVO vo);
	
	int delete(LikeListVO vo);
	
	List<LikeListVO> selectList(LikeListVO vo);
	
	List<LikeListVO> idList(LikeListVO vo);
	
	LikeListVO selectOne(LikeListVO vo);
	
}
