package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service("mUpdate")
@AllArgsConstructor
public class MemberUpdateService implements MemberService {
	
	private MemberDAO dao;
	
	@Override
	public MemberVO update(MemberVO memberVO) {
		
		MemberVO newVO = null;
		
		try {
			newVO = dao.updateMember(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newVO;
	}
}
