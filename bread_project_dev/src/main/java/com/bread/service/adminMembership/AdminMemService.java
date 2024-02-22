package com.bread.service.adminMembership;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

public interface AdminMemService {

	default List<MemberVO> adminMem(SearchVO vo){return null;}
	
    default MemberVO adminMemUpdate(MemberVO memberVO, HttpServletRequest request) {return null;}

    default int adminMemDel(int member_idx) {return 0;}

    default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock){return null;}

    default int getTotalCount(SearchVO vo){return 0;}
}
