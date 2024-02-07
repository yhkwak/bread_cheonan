package com.bread.app.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.BakeryVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BakeryDAO {
	public static final String MAPPER = "com.bread.app.BakeryMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 회원가입 정보 입력
	public int join(BakeryVO vo) throws SQLException {
		return sqlSession.insert(MAPPER+".join",vo);
	}
	
	public BakeryVO update(BakeryVO vo) throws SQLException{
		BakeryVO newVO = null;
		if(sqlSession.update(MAPPER+".update", vo) == 1) {
			newVO = vo;
		}
		return newVO;
	}

	public BakeryVO getBakery(int member_idx) {
		return sqlSession.selectOne(MAPPER+".getBakery", member_idx);
	}

}
