package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired // 자동주입
	private SqlSession sqlsession;
	private static final String PD = "daldal.mappers.productMapper.";
	
	public List<ProductVO> selectList() {
		return sqlsession.selectList(PD + "selectList");
	}
	
	public ProductVO selectOne(ProductVO vo) {
		return sqlsession.selectOne(PD + "selectOne", vo);
	}
	
	public int insert(ProductVO vo) {
		return sqlsession.insert(PD + "insert", vo);
	}
	
	public List<ProductVO> productList() {
		return sqlsession.selectList(PD + "productList");
	}

	public List<ProductVO> mProductList(String muname) {
		return sqlsession.selectList(PD + "mProductList", muname);
	}
}