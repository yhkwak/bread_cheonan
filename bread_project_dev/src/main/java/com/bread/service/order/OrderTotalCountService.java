package com.bread.service.order;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;

@Service("oTotalCount")
@AllArgsConstructor
public class OrderTotalCountService implements OrderService {
	private OrderDAO dao;
	
	@Override
	public int getTotalCount(PageVO vo) {
		return dao.getTotalCount(vo);
	}
}
