package com.bread.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDAO {
	
	public static final String MAPPER = "com.bread.app.OrderMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 주문내역 조회 - 오더
	public List<OrderVO> order(PageVO vo) {
		return sqlSession.selectList(MAPPER+".order",vo);
	}
	// 주문내역 조회 - 아이템
	public List<ItemVO> item(PageVO vo){
		return sqlSession.selectList(MAPPER+".item", vo);
	}
	//개인 주문내역의 총 갯수-페이징...
	public int getTotalCount(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
}
