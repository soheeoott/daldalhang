package service;

import java.util.List;

import vo.FranchiseVO;
import vo.ProductVO;

public interface FRService {
	
	int insert(FranchiseVO fvo);
	
	FranchiseVO fdetail(FranchiseVO fvo);
	
	List<FranchiseVO> selectList();
	
	FranchiseVO selectOne(FranchiseVO fvo);

	public int fsortCount(ProductVO pvo);
	
	List<FranchiseVO> franchiseMenu(ProductVO pvo);
	
	List<ProductVO> franchiseSubMenu(ProductVO pvo);
	
	public int franchiseSubCount(ProductVO pvo);

	List<FranchiseVO> fsortList(ProductVO pvo);
}