package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("mFindId")
public class MemberFindIdService implements MemberService {
	
	private MemberDAO dao;
	
	@Override
	public MemberVO findId(String member_name, String member_phone) {
		MemberVO memberVO = null;//회원가입 실패시 결과값
		
		try {
			
			memberVO=dao.getFindId(member_name, member_phone);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberVO;
	}


}
