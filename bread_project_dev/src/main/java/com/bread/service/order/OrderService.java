package com.bread.service.order;

import java.util.List;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;

public interface OrderService {
	
	default List<ItemVO> item(PageVO vo){return null;}
	default List<OrderVO> order(PageVO vo){return null;}
	default int getTotalCount(PageVO vo) {return 0;}
	default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock){return null;}
}
