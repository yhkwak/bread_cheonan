package com.bread.service.member;

import com.bread.app.vo.MemberVO;

public interface MemberService {
	
    default int join(MemberVO memberVO) {
        return 0;
    }

    default MemberVO login(String member_id, String member_pw) {
        return null;
    }

    default MemberVO update(MemberVO memberVO) {
        return null;
    }

    default int cancel(int member_idx) {
        return 0;
    }

    default int checkId(String Member_Id) {
    	return 0;
    };
}
