package com.bread.app.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminMemDAO { //작업중
	
	public static final String MAPPER = "com.bread.app.AdminMemMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 전체 회원 조회
	public List<MemberVO> adminMem(SearchVO vo){
		return sqlSession.selectList(MAPPER+".adminMem", vo);
	}
	// 총 회원 수
	public int getTotalCount(SearchVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
	
	// 회원정보 한명만 가져오기
	public MemberVO getMember(int member_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER+".getMember", member_idx);
	}
	
	// 회원정보 update
	public MemberVO adminMemUpdate(MemberVO vo) throws SQLException{
		MemberVO newVO = null;		
		if(sqlSession.update(MAPPER+".adminMemUpdate", vo) == 1) {//회원정보 업데이트 성공
			newVO = getMember(vo.getMember_idx());
		}
		return newVO;
	}

	//회원 탈퇴하기
	public int adminMemDel(int member_idx) throws SQLException {
		return sqlSession.update(MAPPER+".adminMemDel",member_idx);
	}
}
