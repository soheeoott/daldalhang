package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PersonalVO;
import vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired // 자동주입
	private SqlSession sqlsession;
	private static final String PD = "ver01.mappers.productMapper.";
	
	public List<ProductVO> selectList() {
		return (List)sqlsession.selectList(PD + "selectList");
	}
	
	public ProductVO selectOne(ProductVO vo) {
		return sqlsession.selectOne(PD + "selectOne", vo);
	}
}