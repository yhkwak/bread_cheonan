package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("mJoin")
public class MemberJoinService implements MemberService {
	
	private MemberDAO dao;
	
	
	public int join(MemberVO memberVO) {
		
		int result = 0;//회원가입 실패시 결과값
		
		try {
			result=dao.join(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
