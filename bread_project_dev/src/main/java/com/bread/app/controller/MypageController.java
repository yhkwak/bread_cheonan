package com.bread.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;
import com.bread.service.bread.BreadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bread.app.vo.BakeryVO;
import com.bread.service.bakery.BakeryService;

import lombok.Setter;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Enumeration;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Setter(onMethod_ = {@Autowired})
	BakeryService bakeryJoin, bakeryUpdate, bakeryGet;
	@Setter(onMethod_ = {@Autowired})
	BreadService bDelete, bDownload, bInsert, bList, bUpdate, bView;

	@Setter(onMethod_ = {@Autowired})
	private BreadDAO breadDAO;

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

		if (bakeryJoin.join(bakeryVO) == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("bakery", bakeryVO);
			viewPage = "redirect:/main.do";
		}

		return viewPage;
	}

	@PostMapping("/updateProcess.do")
	public String updateProcess(BakeryVO bakeryVO, HttpServletRequest request, Model model) {

		String viewPage = "mypage/shopinfo";


		BakeryVO newBakeryVO = bakeryUpdate.update(bakeryVO);

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
	public String productManagement(SearchVO searchVO,HttpServletRequest request, Model model) {
//		HttpSession session = request.getSession();
//		BakeryVO bakery = (BakeryVO) session.getAttribute("bakery");

//		if (bakery != null) {
//			searchVO.setBakery_idx(bakery.getBakery_idx());

			List<BreadVO> breadList = bList.getBoards(searchVO);
			model.addAttribute("breadList", breadList);
//		} else {
//			return "redirect:/member/login"; // 수정된 리다이렉트 경로
//		}
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
		BreadVO bread = bView.getBoard(bread_idx);  // 특정 빵의 상세 정보를 조회합니다.
		model.addAttribute("bread", bread);  // 조회된 정보를 모델에 추가합니다.
		return "mypage/productUpdate";  // 뷰 이름을 반환합니다.
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
	@GetMapping("/orderManagement.do")
	public String orderManagement() {
		return "mypage/orderManagement";
	}

}
