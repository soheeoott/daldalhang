package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MetacodeDAO;
import vo.MetacodeVO;

@Service
public class MetaServiceImpl implements MetaService {
	
	@Autowired
	MetacodeDAO dao;
	
	@Override
	public List<MetacodeVO> selectList() {
		return dao.selectList();
	}
	
	@Override
	public MetacodeVO selectOne(MetacodeVO mvo) {
		return dao.selectOne(mvo);
	}
}