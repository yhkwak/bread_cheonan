package com.bread.service.cart;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.CartDAO;
import com.bread.app.vo.CartVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("cList")
public class CartListService implements CartService {
	
private CartDAO dao;
	
	@Override
	public List<CartVO> getCarts(int member_idx){
		
		List<CartVO> cartList = null;
		
		try {
			cartList = dao.getCarts(member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cartList;
	}
}
