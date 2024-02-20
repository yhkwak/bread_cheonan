package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.OrderListVO;
import com.bread.service.order.OrderService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class OrderController {

	@Setter(onMethod_ = {@Autowired})
	OrderService oList, oPage, oTotalCount;
	
	@Setter(onMethod_={ @Autowired } )
	TenPageNav pageNav;

	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(@ModelAttribute OrderListVO vo, HttpSession session, Model model) {
		//pageNum이 0인 경우 1로 세팅함
		if(vo.getPageNum()==0) {
			vo.setPageNum(1);
		}
	    // 세션에서 회원 정보를 가져옴.
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    System.out.println(memberVO.getMember_idx());
	    // 회원 번호를 사용하여 주문 목록을 조회.
	    List<OrderListVO> orderList = oList.orderList(memberVO.getMember_idx());
	    
	    //페이징
	    pageNav.setTotalRows(oTotalCount.getTotalCount(memberVO.getMember_idx()));
	    pageNav=oPage.setPageNav(pageNav,vo.getPageNum(),vo.getPageBlock());
	    // 조회된 주문 목록을 모델에 추가하여 JSP 페이지에 전달.
	    model.addAttribute("orderList", orderList);
  
	    // 주문 조회 페이지로 이동.
	    return "mypage/orderList";
	}


}
