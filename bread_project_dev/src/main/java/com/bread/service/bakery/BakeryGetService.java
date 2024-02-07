package com.bread.service.bakery;

import org.springframework.stereotype.Service;

import com.bread.app.dao.BakeryDAO;
import com.bread.app.vo.BakeryVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("bakeryGet")
public class BakeryGetService implements BakeryService {
	
	private BakeryDAO dao;
	
	@Override
	public BakeryVO bakeryGet(int member_idx) {
		
		BakeryVO result = null;//회원가입 실패시 결과값
		
		result = dao.getBakery(member_idx);

		return result;
	}

}
