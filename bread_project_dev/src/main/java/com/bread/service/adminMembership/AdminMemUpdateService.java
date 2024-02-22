package com.bread.service.adminMembership;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminMemDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service("aUpdate")
@AllArgsConstructor
public class AdminMemUpdateService implements AdminMemService {

	private AdminMemDAO dao;

	@Override
	public MemberVO adminMemUpdate(MemberVO memberVO, HttpServletRequest request) {
		// 데이터베이스 업데이트
		MemberVO newVO = null;
		try {
			newVO = dao.adminMemUpdate(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newVO;
	}
}