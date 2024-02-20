package com.bread.app.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.CartVO;

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
}
