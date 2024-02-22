package com.bread.service.adminMembership;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminMemDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service("aDel")
@AllArgsConstructor
public class AdminMemDelService implements AdminMemService {

	private AdminMemDAO dao;

	@Override
	public int adminMemDel(int m_idx) {
		int result = 0;//계정삭제 실패시 결과값
		
		try {
			result=dao.adminMemDel(m_idx);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}