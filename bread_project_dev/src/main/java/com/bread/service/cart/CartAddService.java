package com.bread.service.cart;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.CartDAO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("cAdd")
public class CartAddService implements CartService {
	
	private CartDAO dao;
	
	@Override
	public int addCart(int int_member_idx, int int_bread_idx, int int_bread_count) {
		int result = 0;
		
		try {
			result = dao.addCart(int_member_idx, int_bread_idx, int_bread_count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
