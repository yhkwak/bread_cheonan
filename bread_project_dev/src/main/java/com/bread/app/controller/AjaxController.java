package com.bread.app.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.bread.service.member.MemberService;
import com.bread.service.sms.SmsService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@AllArgsConstructor
@Slf4j
public class AjaxController {
	//private SmsService smsService;
    private MemberDAO memberDAO;
    private SearchDAO searchDAO;
    private AdminMemDAO adminMemDAO;
    private AdminStoreDAO adminStoreDAO;
    private CartDAO cartDAO;
    private MemberService mUpdate, mFindId, mDelete, mFindPw;

    
    //////////////////// 중복 검사 ////////////////////
    
    //아이디 중복검사 처리 요청
    @PostMapping("/member/checkIdProcess.do")
    public String checkIdProcess(String member_id) throws SQLException {
        String result="0";//중복 아이디가 없는 경우 결과값
        
        System.out.println("member_id:"+member_id);
        
        int checkId = memberDAO.checkId(member_id);
        if(checkId != 0) { //중복일경우
            result = "1";//중복 아이디가 있는 경우 결과값
        }

        return result;
    }
  //닉네임 중복검사
    @PostMapping("/member/checkNicknameProcess.do")
    public String checkNicknameProcess(String member_nickname) throws SQLException {
        String result="0";//중복 닉네임이 없는 경우
        
        int checkNickname = memberDAO.checkNickname(member_nickname);
        if(checkNickname != 0) { //중복일경우
            result = "1";
        }

        return result;
    }
    
    //전화번호 중복검사
    @PostMapping("/member/checkPhoneNumberProcess.do")
    public String checkPhoneNumberProcess(String member_phone) throws SQLException {
        String result="0";//중복이 없는 경우
        
        int checkPhoneNumber = memberDAO.checkPhoneNumber(member_phone);
        if(checkPhoneNumber != 0) { //중복일경우
            result = "1";
        }

        return result;
    }
    
    @PostMapping("/member/checkUpdateNicknameProcess.do")
    public int checkUpdateNicknameProcess(String member_nickname, int member_idx) throws SQLException {
        Integer idx = memberDAO.checkUpdateNickname(member_nickname);
        return (idx == null || idx.equals(member_idx)) ? 0 : 1;
    }

    @PostMapping("/member/checkUpdatePhoneNumberProcess.do")
    public int checkUpdatePhoneNumberProcess(String member_phone, int member_idx) throws SQLException {
        Integer idx = memberDAO.checkUpdatePhoneNumber(member_phone);
        return (idx == null || idx.equals(member_idx)) ? 0 : 1;
    }
    //회원가입 alert
    @PostMapping("/member/joinProcess.do")
    public ResponseEntity<?> joinProcessAjax(@ModelAttribute MemberVO memberVO) { //ResponseEntity<?> ajax성공이나 오류 즉, 상태를 response출력해주기위해 사용됨
        Map<String, Object> response = new HashMap<>();
        try {

            int result = memberDAO.join(memberVO);
            if (result == 1) {
                // 회원가입 성공
                response.put("status", "success");
                response.put("message", "회원가입이 성공적으로 완료되었습니다.\n로그인하여 서비스를 이용해주세요.");
                return ResponseEntity.ok(response);
            } else {
                // 회원가입 실패
                response.put("status", "fail");
                response.put("message", "회원가입에 실패했습니다. 입력 정보를 다시 확인해 주세요."); 
                return ResponseEntity.badRequest().body(response);
            }
        } catch (Exception e) {
            // 예외 발생시 상세한 에러 로그 출력
            log.error("회원가입 도중 예외 발생", e);

            response.put("status", "error");
            response.put("message", "서버 오류로 인해 처리할 수 없습니다. 관리자에게 문의해 주세요."); 
            return ResponseEntity.badRequest().body(response);
        }
    }

    @PostMapping("/member/updateProcess.do")
    public ResponseEntity<?> updateProcessAjax(@ModelAttribute MemberVO memberVO, HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        try {
            MemberVO updatedMember = mUpdate.update(memberVO, request);
            if (updatedMember != null) {
                // 회원 정보 업데이트 성공
                HttpSession session = request.getSession();
                session.removeAttribute("member");
                session.setAttribute("member", updatedMember);

                response.put("status", "success");
                response.put("message", "회원 정보가 성공적으로 업데이트되었습니다.");
                return ResponseEntity.ok(response);
            } else {
                // 회원 정보 업데이트 실패
                response.put("status", "fail");
                response.put("message", "업데이트에 실패했습니다. 입력 정보를 다시 확인해 주세요.");
                return ResponseEntity.badRequest().body(response);
            }
        } catch (Exception e) {
            // 예외 발생 시
            log.error("회원 정보 업데이트 도중 예외 발생", e);
            response.put("status", "error");
            response.put("message", "서버 오류로 인해 처리할 수 없습니다. 관리자에게 문의해 주세요.");
            return ResponseEntity.badRequest().body(response);
        }
    }
    
    @PostMapping("/member/findIdProcess.do")
    public Map<String, String> findIdProcess(String member_name, String member_phone) {
        Map<String, String> resultMap = new HashMap<String, String>();
        MemberVO memberVO = mFindId.findId(member_name, member_phone);

        
        // 데이터베이스에서 가져온 정보와 사용자가 입력한 이름과 전화번호가 일치하는지를 확인
        if (memberVO != null) {
            resultMap.put("status", "success");
            resultMap.put("member_id", memberVO.getMember_id());
            resultMap.put("message", "아이디를 성공적으로 찾았습니다.");
        } else {
            resultMap.put("status", "failure");
            resultMap.put("message", "아이디를 찾는데 실패했습니다. 올바른 정보를 입력해주세요.");
        }

        return resultMap;
    
    }
    
    @PostMapping("/member/findPwProcess.do")
    public Map<String, String> findPwProcess(String member_id, String member_phone) {
    	
        Map<String, String> resultMap = new HashMap<String, String>();
        MemberVO memberVO = mFindPw.findPw(member_id, member_phone);

        // 데이터베이스에서 가져온 정보와 사용자가 입력한 이름과 전화번호가 일치하는지를 확인
        if (memberVO != null) {
            resultMap.put("status", "success");
            resultMap.put("member_id", memberVO.getMember_id());
            resultMap.put("member_pw", memberVO.getMember_pw());
            resultMap.put("member_phone", memberVO.getMember_phone());
            resultMap.put("message", "비밀번호를 성공적으로 찾았습니다.");
        } else {
            resultMap.put("status", "failure");
            resultMap.put("message", "비밀번호를 찾는데 실패했습니다. 올바른 정보를 입력해주세요.");
        }

        return resultMap;
    
    }
    
    
    //회원탈퇴
    @PostMapping("/deleteProcess.do")
    public Map<String, Object> deleteProcess(HttpServletRequest request) {
        Map<String, Object> response = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("member");
        int member_idx = vo.getMember_idx();

        try {
            if (mDelete.delete(member_idx) == 1) {
                session.invalidate();
                response.put("status", "success");
                response.put("message", "회원 탈퇴가 완료되었습니다.");
            } else {
                response.put("status", "fail");
                response.put("message", "회원 탈퇴에 실패하였습니다.");
            }
        } catch (Exception e) {
            log.error("회원 탈퇴 도중 예외 발생", e);
            response.put("status", "error");
            response.put("message", "서버 오류로 인해 처리할 수 없습니다. 관리자에게 문의해 주세요.");
        }
        return response;
    }
    //////////////////// 장바구니 페이지 ////////////////////
    
    @PostMapping("/search/cartAdd.do")
    public BreadVO cartAdd(int bread_idx, int member_idx) throws SQLException{
    	BreadVO breadVO = null;
    	if(searchDAO.checkCart(bread_idx, member_idx) != 0) {
    		
    	}else {
    		breadVO = searchDAO.getBread(bread_idx);
    	}
    	
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
//        String message = String.format("주문이 성공적으로 처리되었습니다. 주문 번호: %s, 금액: %d", order_idx, amount);
//        smsService.sendSms(memberPhone, message); // 수정된 부분: member_phone 대신 조회한 회원의 전화번호 사용

        return "OK";
    }
    
    @PostMapping("/**/deleteCart.do")
    public int deleteCart(int cart_idx) {
    	int result = 0;
    	
    	result = cartDAO.deleteCart(cart_idx);
    	
    	return result;
    }
    
    @PostMapping("/**/updateCount.do")
    public void updateCount(int cart_idx, int bread_count) {
    	cartDAO.updateCount(cart_idx, bread_count);
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
