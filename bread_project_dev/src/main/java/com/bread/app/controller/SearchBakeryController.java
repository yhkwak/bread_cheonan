package com.bread.app.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.LikesVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.likes.LikesService;
import com.bread.service.search.SearchService;

import lombok.Setter;

@Controller
@RequestMapping("/search")
public class SearchBakeryController {
	
		@Setter(onMethod_= {@Autowired})
		SearchService bkList, bkPage, bkTotalCount, vBakery, getBreads;
		@Setter(onMethod_= {@Autowired})
		FivePageNav pageNav;
		@Setter(onMethod_= {@Autowired})
		LikesService blCheck, blAdd;
	
		@GetMapping("/searchBakery.do")
		public String searchBakery(@ModelAttribute("sVO") SearchVO searchVO, Model model) {
			
			//pageNum이 0이면 1로 세팅, 처음 호출시 0이라서 오류 발생
			if(searchVO.getPageNum() == 0) {
				searchVO.setPageNum(1);
			}
			
			//빵집 목록 요청에 대해 처리할 수 있는 Service 클래스 이용
			List<BakeryVO> bakeryList = bkList.getBakerys(searchVO);
			model.addAttribute("bakeryList", bakeryList);
			
			pageNav.setTotalRows(bkTotalCount.getTotalCount(searchVO));
			
			pageNav = bkPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());
			
			model.addAttribute("pageNav", pageNav);
			
			
			return "search/searchBakery";
		}
		
//		@GetMapping("/viewBakery.do")
//		public String viewBakery(int bakery_idx, HttpServletRequest request, Model model) {
//			String viewPage = "search/viewBakery";
//			
//			BakeryVO bakeryVO = vBakery.getBakery(bakery_idx);
//			HttpSession session = request.getSession();
//			session.setAttribute("bakery", bakeryVO);
//			
//			List<BreadVO> breadList = getBreads.getBreads(bakery_idx);
//			model.addAttribute("breadList", breadList);
//			
//			return viewPage;
//		}

		
		@GetMapping("/viewBakery.do")
		public String viewBakery(int bakery_idx, int member_idx, HttpSession session, Model model) {
		    String viewPage = "search/viewBakery";

		    // 세션에서 회원 정보를 가져옴.
		    MemberVO memberVO = (MemberVO) session.getAttribute("member");
		    
		    // 좋아요 객체 생성
		    LikesVO like = new LikesVO();
		    like.setBakery_idx(bakery_idx);
		    
		    // 세션에서 가져온 회원 정보가 null이 아닌 경우만 회원 번호 설정
		    if(memberVO != null) {
		        like.setMember_idx(memberVO.getMember_idx());
		    }

		    // 해당 회원이 설정한 좋아요 상태 가져오기
		    like = blCheck.checkBL(like);
		    
		    // 좋아요 객체가 null일 경우 초기화
		    if(like == null) {
		        like = new LikesVO();
		        like.setLikes_check(0); // 디폴트 상태로 설정
		    }

		    // 베이커리 정보 세션에 추가
		    BakeryVO bakeryVO = vBakery.getBakery(bakery_idx);
		    session.setAttribute("bakery", bakeryVO);

		    // 빵 리스트 모델에 추가
		    List<BreadVO> breadList = getBreads.getBreads(bakery_idx);
		    model.addAttribute("breadList", breadList);

		    // 좋아요 결과 모델에 추가
		    model.addAttribute("result", like);
		    
		    
		    return viewPage;
		}

		
}
