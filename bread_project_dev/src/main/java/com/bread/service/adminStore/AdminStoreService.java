package com.bread.service.adminStore;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

public interface AdminStoreService {

	default List<BakeryVO> adminStore(SearchVO vo){return null;}
	
    default MemberVO updateMem(MemberVO memberVO, HttpServletRequest request) {return null;}

    default int deleteStore(int bakery_idx) {return 0;}

    default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock){return null;}

    default int getTotalCount(SearchVO vo){return 0;}
}
