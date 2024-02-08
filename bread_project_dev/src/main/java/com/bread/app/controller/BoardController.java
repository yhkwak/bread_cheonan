package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.vo.NoticeVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.notice.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_={ @Autowired })
	NoticeService nList, nInsert, nView, nUpdate, nDelete, nDownload;
	
	@GetMapping("/notice.do")
	public String notice(SearchVO searchVO, Model model) {
		 List<NoticeVO> noticeList = nList.getBoards(searchVO);
	     model.addAttribute("noticeList", noticeList);
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
	
}
