package com.bread.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.OrderListVO;
import com.bread.app.vo.PageVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class OrderDAO {
	
	public static final String MAPPER = "com.bread.app.OrderMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 주문내역 조회
	public List<OrderListVO> orderList(PageVO vo){
		return sqlSession.selectList(MAPPER+".orderList", vo);
	}
	//개인 주문내역의 총 갯수-페이징...
	public int getTotalCount(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
}
