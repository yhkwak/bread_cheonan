package com.bread.service.notice;

import org.springframework.stereotype.Service;

import com.bread.app.dao.NoticeDAO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("nTotalCount")
@AllArgsConstructor
public class NoticeTotalCountService implements NoticeService {
	private NoticeDAO dao;
	
	@Override
	public int getTotalCount(SearchVO vo) {
		return dao.getTotalCount(vo);
	}
}
