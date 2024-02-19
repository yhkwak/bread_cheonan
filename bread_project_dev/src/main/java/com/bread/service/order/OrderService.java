package com.bread.service.order;

import java.util.List;

import com.bread.app.vo.OrderListVO;

public interface OrderService {

	default List<OrderListVO> orderList(int member_idx) {return null;}

}
