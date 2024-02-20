package com.bread.service.order;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;

import lombok.AllArgsConstructor;

@Service("oTotalCount")
@AllArgsConstructor
public class OrderTotalCountService implements OrderService {
	private OrderDAO dao;
	
	@Override
	public int getTotalCount(int member_idx) {
		return dao.getTotalCount(member_idx);
	}
}
