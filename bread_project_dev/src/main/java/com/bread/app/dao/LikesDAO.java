package com.bread.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.LikesVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class LikesDAO {
	
	public static final String MAPPER = "com.bread.app.LikesMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
		
	//매장 찜여부 확인
	public LikesVO checkBL(LikesVO lvo) {
		return sqlSession.selectOne(MAPPER+".checkBL", lvo);
	}
	
	//매장 찜 하기
	public int addBL(LikesVO lvo) {
		return sqlSession.insert(MAPPER+".addBL", lvo);
	}
	
	//매장 찜 해제
	public int delBL(LikesVO lvo) {
		return sqlSession.delete(MAPPER+".delBL", lvo);
	}
	
	// 매장 찜 상태 업데이트
	public int updateBL(LikesVO lvo) {
		return sqlSession.update(MAPPER + ".updateBL", lvo);
	}
	
	//리뷰 좋아요
}
