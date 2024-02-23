package com.bread.service.notice;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.NoticeDAO;
import com.bread.app.vo.NoticeVO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("nList")
@AllArgsConstructor
public class NoticeListService implements NoticeService {

	private NoticeDAO dao;
	@Override
	public List<NoticeVO> getBoards(SearchVO vo) {
		vo.setStartIdx((vo.getPageNum()-1)*10);
		return dao.getBoards(vo);
	}
}
