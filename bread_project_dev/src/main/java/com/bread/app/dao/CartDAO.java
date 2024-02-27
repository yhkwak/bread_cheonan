package com.bread.app.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.CartVO;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CartDAO {
	
	public static final String MAPPER = "com.bread.app.CartMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	public int addCart(int int_member_idx, int int_bread_idx, int int_bread_count) throws SQLException {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_idx", int_member_idx);
		map.put("bread_idx", int_bread_idx);
		map.put("bread_count", int_bread_count);
		return sqlSession.insert(MAPPER+".addCart", map);
	}
	
	public List<CartVO> getCarts(int member_idx) throws SQLException {
		return sqlSession.selectList(MAPPER+".getCarts", member_idx);
	}
	
	public int addOrder(String order_idx, int amount, int member_idx) {
		OrderVO orderVO = new OrderVO();
		
		orderVO.setOrder_idx(order_idx);
		orderVO.setAmount(amount);
		orderVO.setMember_idx(member_idx);
		
		return sqlSession.insert(MAPPER+".addOrder", orderVO);
	}
	
	public int addItem(int bread_idx, int bakery_idx, String order_idx, int bread_count) {
		ItemVO itemVO = new ItemVO();
		
		itemVO.setBread_idx(bread_idx);
		itemVO.setBakery_idx(bakery_idx);
		itemVO.setOrder_idx(order_idx);
		itemVO.setBread_count(bread_count);
		
		return sqlSession.insert(MAPPER+".addItem", itemVO);
	}
	
	public int updateStock(int bread_count, int bread_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("bread_count", bread_count);
		map.put("bread_idx", bread_idx);
		return sqlSession.update(MAPPER+".updateStock", map);
	}
	
	public int deleteCart(int cart_idx) {
		return sqlSession.delete(MAPPER+".deleteCart", cart_idx);
	}
	
	public int updateCount(int cart_idx, int bread_count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_idx", cart_idx);
		map.put("bread_count", bread_count);
		return sqlSession.update(MAPPER+".updateCount", map);
	}
}
