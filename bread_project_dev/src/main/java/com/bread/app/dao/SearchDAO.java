package com.bread.app.dao;

import java.util.List;

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
	
	public BreadVO getBread(int bread_idx) {
		return sqlSession.selectOne(MAPPER+".getBread", bread_idx);
	}
	
}
