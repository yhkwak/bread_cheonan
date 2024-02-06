package com.bread.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	///////// 페이지 매핑 ///////////
	
	@GetMapping("/cart.do")
	public String cart() {
		return "cart/cart";
	}
	
	
}
