package com.bread.service.member;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.vo.MemberVO;

public interface MemberService {
	
    default int join(MemberVO memberVO) {
        return 0;
    }

    default MemberVO login(String member_id, String member_pw) {
        return null;
    }

    default MemberVO update(MemberVO memberVO, HttpServletRequest request) {
        return null;
    }

    default int cancel(int member_idx) {
        return 0;
    }

    default int checkId(String Member_Id) {
    	return 0;
    }

	default MemberVO findId(String member_name, String member_phone) {
		return null;
	}

	default MemberVO findPw(String member_id, String member_phone) {
		return null;
	}

	default MemberVO changePw(MemberVO memberVO, HttpServletRequest request) {
		return null;
	}

}
