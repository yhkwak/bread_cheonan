package com.bread.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.vo.CartVO;
import com.bread.service.cart.CartService;

import lombok.Setter;

@Controller
@RequestMapping
public class CartController {
	
	//회원가입처리를 위한 Service클래스를 필드로 정의하기
	@Setter(onMethod_={@Autowired})
	CartService cAdd, cList;

	
	///////// 페이지 매핑 ///////////
	
	@GetMapping("/cart/cart.do")
	public String cart(int member_idx, Model model) {
		List<CartVO> cartList = cList.getCarts(member_idx);
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}
	
	@GetMapping("/cart/payment_complete.do")
	public String payment_complete() {
		
		return "cart/payment_complete";
	}
	
	@PostMapping("/search/cartProcess.do")
	public String cartProcess(String member_idx, String bread_idx, String bread_count, Model model) {

		String[] arr_member_idx = member_idx.split(",");
		String[] arr_bread_idx = bread_idx.split(",");
		String[] arr_bread_count = bread_count.split(",");
		
		for(int i=0; i <arr_member_idx.length; i++) {
			
			int int_member_idx = Integer.parseInt(arr_member_idx[i]);
			int int_bread_idx = Integer.parseInt(arr_bread_idx[i]);
			int int_bread_count = Integer.parseInt(arr_bread_count[i]);

			
			cAdd.addCart(int_member_idx, int_bread_idx, int_bread_count);
			
		}
		
		List<CartVO> cartList = cList.getCarts(Integer.parseInt(arr_member_idx[0]));
		model.addAttribute("cartList", cartList);
		
		return "cart/cart";
	}
	
}
