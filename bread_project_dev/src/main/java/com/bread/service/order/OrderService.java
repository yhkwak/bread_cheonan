package com.bread.service.order;

import java.util.List;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.OrderListVO;

public interface OrderService {

	default List<OrderListVO> orderList(int member_idx) {return null;}
	default int getTotalCount(int member_idx) {return 0;}
	default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock){return null;}
	
}
