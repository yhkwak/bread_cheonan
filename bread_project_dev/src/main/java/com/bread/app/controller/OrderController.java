package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bread.app.common.FivePageNav;
import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.OrderListVO;
import com.bread.service.order.OrderService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class OrderController {

	@Setter(onMethod_ = {@Autowired})
	OrderService oList, oPage;

	@Setter(onMethod_ = {@Autowired})
	private OrderDAO dao;
	 

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) {

	    // 세션에서 회원 정보를 가져옴.
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    
	    // 회원 번호를 사용하여 주문 목록을 조회.
	    List<OrderListVO> orderList = dao.orderList(memberVO.getMember_idx());
	    
	    // 조회된 주문 목록을 모델에 추가하여 JSP 페이지에 전달.
	    model.addAttribute("orderList", orderList);
  
	    // 주문 조회 페이지로 이동.
	    return "mypage/orderList";
	}


}
