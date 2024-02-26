package com.bread.app.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminStoreDAO { //작업중
	
	public static final String MAPPER = "com.bread.app.AdminStoreMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 전체 매장 조회
	public List<BakeryVO> adminStore(SearchVO vo){
		return sqlSession.selectList(MAPPER+".adminStore", vo);
	}
	// 총 매장 수
	public int getTotalCount(SearchVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
	
	// 매장한개정보 가져오기
	public BakeryVO getBakery(int bakery_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER+".getBakery", bakery_idx);
	}

	//매장 삭제 처리
	public int deleteStore(int bakery_idx) {
		return sqlSession.update(MAPPER+".deleteStore",bakery_idx);
	}
}
