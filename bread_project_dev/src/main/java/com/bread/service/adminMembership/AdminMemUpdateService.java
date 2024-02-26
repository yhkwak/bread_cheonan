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
	 public MemberVO updateMem(MemberVO memberVO, HttpServletRequest request) {
        try {
            // DAO 계층을 통해 회원 정보를 업데이트
            return dao.updateMem(memberVO);
        } catch (SQLException e) {
            // SQL 예외 발생 시 처리
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            // 그 외의 예외 발생 시 처리
            e.printStackTrace();
            return null;
        }
    }
}