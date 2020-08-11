package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 전체 제품 목록 출력
	public List<ProductVO> productList() {
		return sqlsession.selectList(PD + "productList");
	}

	// '메뉴' 이용했을 때 제품 목록 출력
	public List<ProductVO> mProductList(String muname) {
		return sqlsession.selectList(PD + "mProductList", muname);
	}
	
	// 게시글 전체 목록 ==> 검색옵션, 키워드 매개변수 추가
	public List<ProductVO> listAll(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return sqlsession.selectList("listAll", map);
	}
	
	// 게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return sqlsession.selectOne("countArticle", map);
	}
	
	// 해시태그 전체 목록 ==> 키워드 매개변수 추가
	public List<ProductVO> hashtagAll(String keyword) throws Exception {
	    // 키워드 맵에 저장
	    return sqlsession.selectList("hashtagAll", keyword);
	}
	
	// 해시태그 레코드 갯수
	public int hashtagCount(String keyword) throws Exception {
	    // 키워드 맵에 저장
	    return sqlsession.selectOne("hashtagCount", keyword);
	}
	
	// 메뉴 목록
	public List<ProductVO> category(String mubcode) throws Exception {
		return sqlsession.selectList("category", mubcode);
	}
	
	// 메뉴 갯수
	public int categoryCount(String mubcode) throws Exception {
		return sqlsession.selectOne("categoryCount", mubcode);
	}
	
	
	
}