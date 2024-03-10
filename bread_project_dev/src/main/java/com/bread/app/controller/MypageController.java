package com.bread.app.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bread.app.common.TenPageNav;
import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.LikesVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.bakery.BakeryService;
import com.bread.service.bread.BreadService;
import com.bread.service.likes.LikesService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Setter(onMethod_ = {@Autowired})
	BakeryService bakeryJoin, bakeryUpdate, bakeryGet;
	@Setter(onMethod_ = {@Autowired})
	BreadService bDelete, bDownload, bInsert, bList, bUpdate, bView, bPage, bTotalCount;
	@Setter(onMethod_= {@Autowired})
	TenPageNav pageNav;
	@Setter(onMethod_ = {@Autowired})
	private BreadDAO breadDAO;
	@Setter(onMethod_ = {@Autowired})
	LikesService lList, lTotalCount, lPage;

	@GetMapping("/shopinfo.do")
	public String shopinfo(int member_idx, HttpServletRequest request) {

		String viewPage = "mypage/shopinfo";
		BakeryVO bakeryVO = bakeryGet.bakeryGet(member_idx);
		HttpSession session = request.getSession();
		session.setAttribute("bakery", bakeryVO);
		return viewPage;
	}

	@PostMapping("/joinProcess.do")
	public String joinProcess(BakeryVO bakeryVO, HttpServletRequest request) {
		//회원가입 양식에서 전달된 입력값을 받을 수 있도록 커맨드 객체를 정의함
		//커맨드 객체: 폼의 name과 같은 필드를 가지고 set메소드를 정의하고 있어야 함 - VO클래스
		String viewPage = "mypage/shopinfo.do";//가게정보 등록 실패 시 JSP페이지

		if (bakeryJoin.join(bakeryVO, request) == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("bakery", bakeryVO);
			viewPage = "redirect:/main.do";
		}

		return viewPage;
	}

	@PostMapping("/updateProcess.do")
	public String updateProcess(BakeryVO bakeryVO, HttpServletRequest request, Model model) {

		String viewPage = "mypage/shopinfo";


		BakeryVO newBakeryVO = bakeryUpdate.update(bakeryVO, request);

		if (newBakeryVO != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("bakery");
			session.setAttribute("bakery", newBakeryVO);
			viewPage = "redirect:/main.do";
		} else {
			model.addAttribute("msg", "가게정보 변경에 실패 하였습니다.");
		}
		return viewPage;
	}

	@GetMapping("/productManagement.do")
	public String productManagement(SearchVO searchVO, PageVO pageVO, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("member");
	    if (member != null) {
	        searchVO.setMember_idx(member.getMember_idx());
	    }

	    if (searchVO.getPageNum() == 0) {
	        searchVO.setPageNum(1);
	    }

	    List<BreadVO> breadList = bList.getBoards(searchVO);
	    model.addAttribute("breadList", breadList);

	    int totalRows = bTotalCount.getTotalCount(searchVO); // 검색 조건을 반영한 총 상품 수 계산
	    pageNav.setTotalRows(totalRows);

	    pageNav = bPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());

	    model.addAttribute("pageNav", pageNav);

	    return "mypage/productManagement";
	}
	
	@GetMapping("/productWrite.do")
	public String productWrite(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 세션에서 MemberVO 가져오기
		if (member != null) {
			int member_idx = member.getMember_idx(); // MemberVO에서 member_idx 가져오기
			BakeryVO bakeryVO = bakeryGet.bakeryGet(member_idx); // member_idx를 사용해 BakeryVO 조회
			model.addAttribute("bakery", bakeryVO); // 모델에 BakeryVO 추가
		} else {
			Enumeration<String> attributeNames = session.getAttributeNames();
			while (attributeNames.hasMoreElements()) {
				String attributeName = attributeNames.nextElement();
				log.info(attributeName + ": " + session.getAttribute(attributeName));
			}
		}
		return "mypage/productRegister";
	}

	@PostMapping("/productWriteProcess.do")
	public String productWriteProcess(BreadVO vo, HttpServletRequest request) {
		String viewPage = "mypage/productRegister";

		int result = bInsert.insert(vo, request);

		if (result == 1) {
			viewPage = "redirect:/mypage/productManagement.do";
		}

		return viewPage;
	}

	@GetMapping("/productUpdate.do")
	public String productUpdate(@RequestParam("bread_idx") int bread_idx, Model model) {
		BreadVO bread = bView.getBoard(bread_idx);
		model.addAttribute("bread", bread);
		return "mypage/productUpdate";
	}

	@PostMapping("/productUpdateProcess.do")
	public String productUpdateProcess(BreadVO vo, HttpServletRequest request) {

		String viewPage = "mypage/productUpdate";

		int result = bUpdate.update(vo, request);

		if (result == 1) {
			viewPage = "redirect:productManagement.do";
		}

		return viewPage;
	}

	@GetMapping("/productDelete.do")
	public String delete(int bread_idx) {

		int result = bDelete.delete(bread_idx);

		String viewPage = "mypage/productUpdate";

		if (result == 1) {
			viewPage = "redirect:/mypage/productManagement.do";
		}
		return viewPage;
	}
	
	//찜목록
	@GetMapping("/likeList.do")
	public String likeList(LikesVO lvo, HttpSession session, Model model) {
		//pageNum이 0인 경우 1로 세팅함
		if(lvo.getPageNum()==0) {
			lvo.setPageNum(1);
		}
	    // 세션에서 회원 정보를 가져옴.
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    lvo.setMember_idx(memberVO.getMember_idx());

	    // 회원 번호를 사용하여 찜 목록을 조회
	    List <LikesVO> likeList = lList.likeList(lvo);
	    model.addAttribute("likeList", likeList);

	    //페이징
	    pageNav.setTotalRows(lTotalCount.getLikeListTotalCount(lvo));
	    pageNav=lPage.setPageNav(pageNav,lvo.getPageNum(),lvo.getPageBlock());
	    
	    model.addAttribute("pageNav", pageNav);
	    // 찜목록으로 이동
	    return "mypage/likeList";
	}
	
}
