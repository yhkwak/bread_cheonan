package com.bread.service.likes;

import org.springframework.stereotype.Service;

import com.bread.app.dao.LikesDAO;
import com.bread.app.vo.LikesVO;

import lombok.AllArgsConstructor;

@Service("lTotalCount")
@AllArgsConstructor
public class LikesTotalCountService implements LikesService {
	private LikesDAO dao;
	
	@Override
	public int getLikeListTotalCount(LikesVO lvo) {
		return dao.getLikeListTotalCount(lvo);
	}
}
