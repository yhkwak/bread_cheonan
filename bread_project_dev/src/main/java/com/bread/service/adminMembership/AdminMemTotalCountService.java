package com.bread.service.adminMembership;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminMemDAO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("aTotalCount")
@AllArgsConstructor
public class AdminMemTotalCountService implements AdminMemService {
	private AdminMemDAO dao;
	
	@Override
	public int getTotalCount(SearchVO vo) {
		return dao.getTotalCount(vo);
	}
}
