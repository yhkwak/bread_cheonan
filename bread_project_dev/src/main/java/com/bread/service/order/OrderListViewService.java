package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.OrderListVO;

import lombok.RequiredArgsConstructor;

@Service("oList")
@RequiredArgsConstructor
public class OrderListViewService implements OrderService {
	
	private OrderDAO dao;
	
	@Override
	public List<OrderListVO> orderList(int member_idx){
		return  dao.orderList(member_idx);
	}

}
