package com.bread.service.adminProduct;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminProductDAO;
import com.bread.app.vo.AdminProductVO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("APList")
@AllArgsConstructor
public class AdminProductListService implements AdminProductService {
	
	private AdminProductDAO dao;
	
	@Override
	public List<AdminProductVO> getBoards(SearchVO vo) {
	vo.setStartIdx((vo.getPageNum()-1)*10);
	return dao.getBoards(vo);

	}

}
