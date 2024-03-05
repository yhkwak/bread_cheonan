package com.bread.service.member;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bread.app.dao.MemberDAO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;

@Service("mChangePw")
@AllArgsConstructor
public class MemberChangePwService implements MemberService {

	private MemberDAO dao;

	@Override
	public MemberVO changePw(MemberVO memberVO, HttpServletRequest request) {

		// 데이터베이스 업데이트
		MemberVO newVO = null;
		try {
			newVO = dao.changePw(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return newVO;
	}
}