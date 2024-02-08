package com.bread.service.notice;

import org.springframework.stereotype.Service;

import com.bread.app.dao.NoticeDAO;

@Service("nDelete")
public class NoticeDeleteService implements NoticeService {
	
	private NoticeDAO dao;
	
	@Override
	public int delete(int notice_idx) {
		return dao.delete(notice_idx);
	}
}
