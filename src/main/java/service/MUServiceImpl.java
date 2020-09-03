package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MenuDAO;
import vo.MenuVO;

@Service
public class MUServiceImpl implements MUService {
	
	@Autowired
	MenuDAO dao;
	
	@Override
	public List<MenuVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public MenuVO selectOne(MenuVO mvo) {
		return dao.selectOne(mvo);
	}
	
	@Override
	public List<MenuVO> productList(MenuVO mvo) {
		return dao.productList(mvo);
	}

	@Override
	public List<MenuVO> menu() throws Exception {
		return dao.menu();
	}
}