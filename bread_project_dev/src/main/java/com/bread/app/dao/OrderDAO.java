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
	
	// 구매내역 조회 - 오더
	public List<OrderVO> order(PageVO vo) {
		return sqlSession.selectList(MAPPER+".order",vo);
	}
	// 구매내역 조회 - 아이템
	public List<ItemVO> item(PageVO vo){
		return sqlSession.selectList(MAPPER+".item", vo);
	}
	//개인 주문내역의 총 갯수-페이징...
	public int getTotalCount(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
	
	// 주문내역 조회 - 오더
	public List<OrderVO> order2(PageVO vo) {
		return sqlSession.selectList(MAPPER+".order2",vo);
	}
	
	// 주문내역 조회 - 아이템
	public List<ItemVO> item2(PageVO vo){
		return sqlSession.selectList(MAPPER+".item2", vo);
	}
	
	// 가게번호 조회
	public int getBakeryIdx(int member_idx) {
		return sqlSession.selectOne(MAPPER+".getBakeryIdx", member_idx);
	}
	
	// 주문내역 조회용 갯수 조회
	public int getTotalCount2(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount2",vo);
	}
	
	// 주문 취소
	public int orderCancel(String order_idx) {
	    return sqlSession.update(MAPPER+".orderCancel", order_idx);
	}
}
