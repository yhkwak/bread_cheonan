package com.bread.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchBakeryController {
	
		@GetMapping("/searchBakery.do")
		public String searchBakery() {
			return "search/searchBakery";
		}
		
		@GetMapping("/viewBakery.do")
		public String viewBakery() {
			return "search/viewBakery";
		}

}
