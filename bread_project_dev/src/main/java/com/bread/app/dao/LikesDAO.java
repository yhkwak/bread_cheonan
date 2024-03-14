package com.bread.app.dao;

import java.util.List;

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
	public int checkBL(LikesVO lvo) {
		return sqlSession.selectOne(MAPPER+".checkBL", lvo);
	}
	// 매장 중복 찜 방지
	public int checkBL2(LikesVO lvo) {
		return sqlSession.selectOne(MAPPER+".checkBL2", lvo);
	}
	
	//최초 매장 찜 하기
	public int addBL(LikesVO lvo) {
		return sqlSession.insert(MAPPER+".addBL", lvo);
	}
	
	//매장 찜 해제
	public int delBL(LikesVO lvo) {
		return sqlSession.delete(MAPPER+".delBL", lvo);
	}
	
	//찜목록 
	public List<LikesVO> likeList(LikesVO lvo){
		return sqlSession.selectList(MAPPER+".likeList", lvo);
	}
	//페이징용 찜갯수
	public int getLikeListTotalCount(LikesVO lvo) {
		return sqlSession.selectOne(MAPPER+".getLikeListTotalCount",lvo);
	}

}
