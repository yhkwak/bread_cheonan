package com.bread.service.order;

import java.util.List;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.OrderListVO;
import com.bread.app.vo.PageVO;

public interface OrderService {

	default List<OrderListVO> orderList(PageVO vo){return null;}
	default int getTotalCount(PageVO vo) {return 0;}
	default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock){return null;}
	
}
