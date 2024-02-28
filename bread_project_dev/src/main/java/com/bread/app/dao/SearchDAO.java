package com.bread.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.SearchVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SearchDAO {
	
	public static final String MAPPER = "com.bread.app.SearchMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 총 빵집 수 조회하기
	public int getTotalCount(SearchVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
	
	// 빵집 모두 조회하기
	public List<BakeryVO> getBakerys(SearchVO vo){
		return sqlSession.selectList(MAPPER+".getBakerys",vo);
	}
	
	// 빵집 모두 조회하기
	public BakeryVO getBakery(int bakery_idx){
		return sqlSession.selectOne(MAPPER+".getBakery", bakery_idx);
	}
	
	// 빵 정보 조회하기
	public List<BreadVO> getBreads(int bakery_idx){
		return sqlSession.selectList(MAPPER+".getBreads", bakery_idx);
	}
	
	// 빵 한 개 정보 조회하기
	public BreadVO getBread(int bread_idx) {
		return sqlSession.selectOne(MAPPER+".getBread", bread_idx);
	}
	
	// 장바구니 유효성 검사
	public int checkCart(int bread_idx, int member_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_idx", member_idx);
		map.put("bread_idx", bread_idx);
		return sqlSession.selectOne(MAPPER+".checkCart", map);
	}
	
}
