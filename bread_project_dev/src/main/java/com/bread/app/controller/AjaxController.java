package com.bread.app.controller;


import java.sql.SQLException;
import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bread.app.dao.AdminMemDAO;
import com.bread.app.dao.AdminStoreDAO;
import com.bread.app.dao.CartDAO;
import com.bread.app.dao.MemberDAO;
import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.CartVO;
import com.bread.app.vo.MemberVO;
import com.bread.service.sms.SmsService;

import lombok.AllArgsConstructor;

//Ajax 요청을 처리하는 전용 Controller
@RestController
@AllArgsConstructor
public class AjaxController {
	private SmsService smsService;
    private MemberDAO memberDAO;
    private SearchDAO searchDAO;
    private AdminMemDAO adminMemDAO;
    private AdminStoreDAO adminStoreDAO;
    private CartDAO cartDAO;
    
    //////////////////// 중복 검사 ////////////////////
    
    //아이디 중복검사 처리 요청
    @PostMapping("/member/checkIdProcess.do")
    public String checkIdProcess(String member_id) throws SQLException {
        String result="0";//중복 아이디가 없는 경우 결과값
        
        int checkId = memberDAO.checkId(member_id);
        if(checkId != 0) { //중복일경우
            result = "1";//중복 아이디가 있는 경우 결과값
        }

        return result;
    }
    
    //닉네임 중복검사 처리 요청
    @PostMapping("/member/checkNicknameProcess.do")
    public String checkNicknameProcess(String member_nickname) throws SQLException {
        String result="0";//중복 닉네임이 없는 경우 결과값
        
        int checkNickname = memberDAO.checkNickname(member_nickname);
        if(checkNickname != 0) { //중복일경우
            result = "1";//중복 닉네임이 있는 경우 결과값
        }

        return result;
    }
    
    //////////////////// 장바구니 페이지 ////////////////////
    
    @PostMapping("/search/cartAdd.do")
    public BreadVO cartAdd(int bread_idx) throws SQLException{
    	BreadVO breadVO = null;
    	
    	breadVO = searchDAO.getBread(bread_idx);
    	
    	return breadVO;
    }
    
    @PostMapping("/**/payProcess.do")
    public String payProcess(String order_idx, int amount, int member_idx) throws SQLException {
        
        // 회원 정보 조회
        MemberVO member = memberDAO.getMember(member_idx);
        String memberPhone = member.getMember_phone(); // 회원 전화번호 가져오기

        List<CartVO> cartList = cartDAO.getCarts(member_idx);
        
        cartDAO.addOrder(order_idx, amount, member_idx);

        for(int i=0; i<cartList.size(); i++) {
            int bread_idx = cartList.get(i).getBread_idx();
            int bakery_idx = cartList.get(i).getBakery_idx();
            int bread_count = cartList.get(i).getBread_count();
            int cart_idx = cartList.get(i).getCart_idx();
            
            cartDAO.addItem(bread_idx, bakery_idx, order_idx, bread_count);
            cartDAO.updateStock(bread_count, bread_idx);
            cartDAO.deleteCart(cart_idx);
        }
        
        // SMS 발송 로직 추가
        String message = String.format("주문이 성공적으로 처리되었습니다. 주문 번호: %s, 금액: %d", order_idx, amount);
        smsService.sendSms(memberPhone, message); // 수정된 부분: member_phone 대신 조회한 회원의 전화번호 사용

        return "OK";
    }
    
    
    //////////////////// 관리자 페이지 ////////////////////

    @PostMapping("/admin/updateMem.do")
    public MemberVO updateMem(MemberVO memberVO) throws SQLException {
        return adminMemDAO.updateMem(memberVO);
    }

    @PostMapping("/admin/deleteMem.do")
    public int deleteMem(int member_idx) throws SQLException {
        return adminMemDAO.deleteMem(member_idx);
    }
    
    @PostMapping("/admin/deleteStore.do")
    public int deleteStore(int bakery_idx) throws SQLException {
        return adminStoreDAO.deleteStore(bakery_idx);
    }
}
