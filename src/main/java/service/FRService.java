package service;

import java.util.List;

import vo.FranchiseVO;
import vo.ProductVO;

public interface FRService {
	
	int insert(FranchiseVO fvo);
	
	List<FranchiseVO> selectList();
	
	FranchiseVO selectOne(FranchiseVO fvo);

	public int fsortCount(ProductVO pvo);
	
	List<FranchiseVO> franchiseMenu(ProductVO pvo);
	
	List<FranchiseVO> franchiseSubMenu(String mname, String frcode);
	
	public int franchiseSubCount(String mname, String frcode);

	List<FranchiseVO> fsortList(ProductVO pvo);
}