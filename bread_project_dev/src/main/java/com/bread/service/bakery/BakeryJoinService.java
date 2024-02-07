package com.bread.service.bakery;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.BakeryDAO;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.MemberVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("bakeryJoin")
public class BakeryJoinService implements BakeryService {
	
	private BakeryDAO dao;
	
	@Override
	public int join(BakeryVO bakeryVO) {
		
		int result = 0;//회원가입 실패시 결과값
		
		try {
			result=dao.join(bakeryVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
