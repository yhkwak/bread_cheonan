package com.bread.service.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.NoticeVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

public interface NoticeService {
	default int insert(NoticeVO vo, HttpServletRequest request) {return 0;}
	default int update(NoticeVO vo, HttpServletRequest request) {return 0;}
	default int delete(int notice_idx) {return 0;}
	default void download(String originfile_name, String savefile_name, HttpServletRequest request, HttpServletResponse response) {}
	default NoticeVO getBoard(int notice_idx) {return null;}
	default List<NoticeVO> getBoards(SearchVO vo) {return null;}
	default FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock){return null;}
	default int getTotalCount(SearchVO searchVO) {return 0;}
}
