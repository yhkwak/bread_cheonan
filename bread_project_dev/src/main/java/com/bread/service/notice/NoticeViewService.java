package com.bread.service.notice;

import org.springframework.stereotype.Service;

import com.bread.app.dao.NoticeDAO;
import com.bread.app.vo.NoticeVO;

import lombok.AllArgsConstructor;

@Service("nView")
@AllArgsConstructor
public class NoticeViewService implements NoticeService {
	
	private NoticeDAO dao;
	@Override
	public NoticeVO getBoard(int notice_idx) {
		return dao.getBoard(notice_idx);
	}
}
