package com.bread.service.likes;

import org.springframework.stereotype.Service;

import com.bread.app.dao.LikesDAO;
import com.bread.app.vo.LikesVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("blCheck")
public class LikesCheckService implements LikesService {
	
	private LikesDAO dao;
	
	@Override
	public int checkBL(LikesVO lvo) {
		return dao.checkBL(lvo);
	}
	
	@Override
	public int checkBL2(LikesVO lvo) {
		return dao.checkBL2(lvo);
	}
}
