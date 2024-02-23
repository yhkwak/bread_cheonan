package com.bread.service.adminProduct;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminProductDAO;
import com.bread.app.vo.AdminProductVO;

import lombok.AllArgsConstructor;

@Service("APView")
@AllArgsConstructor
public class AdminProductViewService implements AdminProductService {

	private AdminProductDAO dao;
	
	@Override
	public AdminProductVO getBoard(int bread_idx) {

		return dao.getBoard(bread_idx);
	}
	
}
