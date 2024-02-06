package com.bread.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@GetMapping("/notice.do")
	public String notice() {
		return "board/notice";
	}
	
	@GetMapping("/noticeWrite.do")
	public String noticeWrite() {
		return "board/noticeWrite";
	}
}
