package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;
import com.bread.service.order.OrderService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class OrderController {

	@Setter(onMethod_ = {@Autowired})
	OrderService oList, oPage, oTotalCount, oManage, gBakery;
	
	@Setter(onMethod_={ @Autowired } )
	TenPageNav pageNav;

	@RequestMapping(value = "/orderList.do", method = RequestMethod.GET)
	public String item(PageVO vo, HttpSession session, Model model) {
		//pageNum이 0인 경우 1로 세팅함
		if(vo.getPageNum()==0) {
			vo.setPageNum(1);
		}
	    // 세션에서 회원 정보를 가져옴.
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    vo.setMember_idx(memberVO.getMember_idx());
	    
	    // 회원 번호를 사용하여 주문 목록을 조회. - 전체
	    List <OrderVO> order = oList.order(vo);
	    
	    // orderVO안에 필요한 List<ItemVO>를 불러옴
	    for(int i=0; i < order.size(); i++) {
	    	String order_idx = order.get(i).getOrder_idx();
	    	vo.setOrder_idx(order_idx);
		    List <ItemVO> item = oList.item(vo);
		    order.get(i).setItemList(item);
	    }
		    
	    model.addAttribute("orderList", order);

	    //페이징
	    pageNav.setTotalRows(oTotalCount.getTotalCount(vo));
	    pageNav=oPage.setPageNav(pageNav,vo.getPageNum(),vo.getPageBlock());
	    
	    model.addAttribute("pageNav", pageNav);

	    
	    // 주문 조회 페이지로 이동...
	    return "mypage/orderList";
	}
	
	@RequestMapping(value = "/orderManagement.do", method = RequestMethod.GET)
	public String orderManagement(PageVO vo, HttpSession session, Model model) {
		//pageNum이 0인 경우 1로 세팅함
		if(vo.getPageNum()==0) {
			vo.setPageNum(1);
		}
	    // 세션에서 회원 정보를 가져옴.
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    vo.setMember_idx(memberVO.getMember_idx());
	    vo.setBakery_idx(gBakery.getBakeryIdx(memberVO.getMember_idx()));
	    
	    // 회원 번호를 사용하여 주문 목록을 조회. - 전체
	    List <OrderVO> order = oManage.order2(vo);
	    
	    // orderVO안에 필요한 List<ItemVO>를 불러옴
	    for(int i=0; i < order.size(); i++) {
	    	String order_idx = order.get(i).getOrder_idx();
	    	vo.setOrder_idx(order_idx);
		    List <ItemVO> item = oManage.item2(vo);
		    order.get(i).setItemList(item);
	    }
		    
	    model.addAttribute("orderList", order);

	    //페이징
	    pageNav.setTotalRows(oTotalCount.getTotalCount2(vo));
	    pageNav=oPage.setPageNav(pageNav,vo.getPageNum(),vo.getPageBlock());
	    System.out.println(vo);
	    
	    model.addAttribute("pageNav", pageNav);

	    
	    // 주문 조회 페이지로 이동...
	    return "mypage/orderManagement";
	}
}
