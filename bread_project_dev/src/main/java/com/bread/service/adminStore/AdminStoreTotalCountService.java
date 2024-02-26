package com.bread.service.adminStore;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminStoreDAO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("asTotalCount")
@AllArgsConstructor
public class AdminStoreTotalCountService implements AdminStoreService {
	private AdminStoreDAO dao;
	
	@Override
	public int getTotalCount(SearchVO vo) {
		return dao.getTotalCount(vo);
	}
}
