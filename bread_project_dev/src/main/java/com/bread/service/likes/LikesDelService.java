package com.bread.service.likes;

import org.springframework.stereotype.Service;

import com.bread.app.dao.LikesDAO;
import com.bread.app.vo.LikesVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("blDel")
public class LikesDelService implements LikesService {
	
	private LikesDAO dao;
	
	@Override
	public int delBL(LikesVO lvo) {
		return dao.delBL(lvo);
		
	}
}
