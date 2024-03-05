package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("mFindPw")
public class MemberFindPwService implements MemberService {
	
	private MemberDAO dao;
	
	@Override
	public MemberVO findPw(String member_id, String member_phone) {
		MemberVO memberVO = null;//회원가입 실패시 결과값
		
		try {
			
			memberVO=dao.getFindPw(member_id, member_phone);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}


}
