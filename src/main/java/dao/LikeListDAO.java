package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.LikeListVO;

@Repository
public class LikeListDAO {

	@Autowired
	private SqlSession sqlsession;
	private static final String LL = "daldal.mappers.likeListMapper.";
	
	public int likecreate(LikeListVO vo) {
		return sqlsession.insert(LL + "like_create", vo);
	}
	
	public int likecheck(LikeListVO vo) {
		return sqlsession.update(LL + "like_check", vo);
	}
	
	public int delete(LikeListVO vo) {
		return sqlsession.delete(LL + "delete", vo);
	}
	
	public List<LikeListVO> selectList(LikeListVO vo) {
		return sqlsession.selectList(LL +"selectList", vo);
	}
	
	public List<LikeListVO> idList(LikeListVO vo) {
		return sqlsession.selectList(LL +"idList", vo);
	}

	public LikeListVO selectOne(LikeListVO vo) {
		return sqlsession.selectOne(LL +"selectOne", vo);
	}
}
