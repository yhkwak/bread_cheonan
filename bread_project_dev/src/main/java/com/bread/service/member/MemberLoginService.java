package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("mLogin")
public class MemberLoginService implements MemberService {
	
	private MemberDAO dao;
	
	@Override
	public MemberVO login(String member_id, String member_pw) {
		MemberVO memberVO = null;//회원가입 실패시 결과값
		
		try {
			
			memberVO=dao.login(member_id, member_pw);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}


}
