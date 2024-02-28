package com.bread.service.adminProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.AdminProductVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

public interface AdminProductService {

	default int update(AdminProductVO vo, HttpServletRequest request) {return 0;}

    default int delete(int bread_idx) {return 0;}

    default AdminProductVO getBoard(int bread_idx) {return null;}

    default List<AdminProductVO> getBoards(SearchVO vo) {return null;}

	default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock) {return null;}
	
	default int getTotalCount(SearchVO vo) {return 0;}

	default List<AdminProductVO> getDeletedProducts() {return null;}
	
}
