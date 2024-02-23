package com.bread.service.adminProduct;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminProductDAO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;

@Service("APTotalCount")
@AllArgsConstructor
public class AdminProductTotalCountService implements AdminProductService {

	private AdminProductDAO dao;
	
	@Override
	public int getTotalCount(PageVO vo) {
		return dao.getTotalCount(vo);
	}	
}
