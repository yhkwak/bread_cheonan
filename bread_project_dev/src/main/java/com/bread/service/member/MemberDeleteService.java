package com.bread.service.member;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.MemberDAO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("mDelete")
public class MemberDeleteService implements MemberService {

	private MemberDAO dao;
	
	@Override
	public int delete(int member_idx) {
		int result = 0;
		
		try {
			result = dao.delete(member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
