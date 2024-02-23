package com.bread.app.controller;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.bread.app.dao.MemberDAO;
import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.CartVO;
import com.bread.service.cart.CartService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.AllArgsConstructor;
import lombok.Setter;

//Ajax 요청을 처리하는 전용 Controller
@RestController
@AllArgsConstructor
public class AjaxController {

    private MemberDAO memberDAO;
    private SearchDAO searchDAO;
    private IamportClient api;
    
    @Setter(onMethod_={@Autowired})
	CartService cList;
    
    public AjaxController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
    	this.api = new IamportClient("8722736711151264","YrGDTA681mLC0DVBWDM2VuKKuULN5M0xWoYYblWO1rFafbyj58125fwAenIQoDWd697EaZ6VwVCj6OhM");
    }
    
    
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
    
    @PostMapping("/search/cartAdd.do")
    public BreadVO cartAdd(int bread_idx) throws SQLException{
    	BreadVO breadVO = null;
    	
    	breadVO = searchDAO.getBread(bread_idx);
    	
    	return breadVO;
    }
    
    @ResponseBody
	@RequestMapping(value="/cart/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
    	
			return api.paymentByImpUid(imp_uid);
	}
    
    @PostMapping("/cart/payProcess.do")
    public String payProcess(@RequestBody List<CartVO> cartList) {
 //   	List<CartVO> cartList2 = (List<CartVO>) cartList;
    	
    	System.out.println(cartList.size());
    	
    	return null;
    }
    
    @PostMapping("/cart/getCartList.do")
	public List<CartVO> getCartList(int member_idx) {
		List<CartVO> cartList = cList.getCarts(member_idx);
		return cartList;
	}
}