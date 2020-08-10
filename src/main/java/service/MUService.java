package service;

import java.util.List;

import vo.MenuVO;

public interface MUService {
	
	List<MenuVO> selectList();
	
	MenuVO selectOne(MenuVO mvo);
	
	List<MenuVO> productList(String mucategory);
}