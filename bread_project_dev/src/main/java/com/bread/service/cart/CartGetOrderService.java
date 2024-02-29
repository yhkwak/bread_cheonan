package com.bread.service.cart;

import org.springframework.stereotype.Service;

import com.bread.app.dao.CartDAO;
import com.bread.app.vo.OrderVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("gOrder")
public class CartGetOrderService implements CartService {
	
	private CartDAO dao;
	
	@Override
	public OrderVO getOrder(String order_idx) {
		OrderVO orderVO = dao.getOrder(order_idx);
		return orderVO;
	}

}
