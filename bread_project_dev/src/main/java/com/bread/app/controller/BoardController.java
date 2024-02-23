package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.NoticeVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.notice.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Setter(onMethod_={ @Autowired })
	NoticeService nList, nInsert, nView, nUpdate, nDelete, nDownload, nPage, nTotalCount;
	@Setter(onMethod_= {@Autowired})
	FivePageNav pageNav;
	
	@GetMapping("/notice.do")
	public String notice(SearchVO searchVO ,PageVO pageVO, Model model, HttpServletRequest request) {
		
		
		// pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
		if(searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}
		 int totalItems = nTotalCount.getTotalCount(pageVO);
		List<NoticeVO> noticeList = nList.getBoards(searchVO);
		model.addAttribute("noticeList", noticeList);
		pageNav.setTotalRows(nTotalCount.getTotalCount(pageVO));
		int itemsPerPage = 10; // 페이지당 게시물 수
	    int currentPage = pageVO.getPageNum(); // 현재 페이지 번호
	    int startNumber = totalItems - (currentPage - 1) * itemsPerPage; // 현재 페이지의 첫 게시물 번호 계산
	    model.addAttribute("startNumber", startNumber); // 모델에 추가
	    pageNav.setTotalRows(totalItems);

	    
		pageNav = nPage.setPageNav(pageNav, pageVO.getPageNum(), pageVO.getPageBlock());
		
		model.addAttribute("pageNav", pageNav);
		
		return "board/notice";
	}

	@GetMapping("/noticeWrite.do")
	public String noticeWrite() {
		return "board/noticeWrite";
	}

	@PostMapping("/noticeWriteProcess.do")
	public String writeProcess(NoticeVO vo,HttpServletRequest request) {

		String viewPage = "board/noticeWrite"; // 실패시 jsp페이지

		int result = nInsert.insert(vo, request);

		if (result == 1) {
			viewPage = "redirect:notice.do"; // 성공시 jsp페이지
		}

		return viewPage;
	}

	@GetMapping("/view.do")
	public String view(int notice_idx, Model model) {
		NoticeVO vo = nView.getBoard(notice_idx);

		model.addAttribute("notice",vo);

		return "board/noticeView";
	}

	@GetMapping("/update.do")
	public String update(int notice_idx, Model model) {
		NoticeVO vo = nView.getBoard(notice_idx);

		model.addAttribute("notice",vo);

		return "board/noticeUpdate";
	}

	@PostMapping("/updateProcess.do")
	public String updateProcess(NoticeVO vo, HttpServletRequest request) {

		String viewPage = "board/noticeUpdate";

		int result = nUpdate.update(vo, request);

		if (result == 1) {
			viewPage = "redirect:notice.do";
		}
		return viewPage;
	}

	@GetMapping("/delete.do")
	public String delete(int notice_idx) {

		int result = nDelete.delete(notice_idx);

		String viewPage = "board/view";
		if (result == 1) {
			viewPage = "redirect:/board/notice.do";
		}
		return viewPage;
	}

	@GetMapping("/download.do")
	public void download(String originfile_name, String savefile_name,
						 HttpServletRequest request, HttpServletResponse response) {
		nDownload.download(originfile_name, savefile_name, request, response);
	}
}
