package com.bread.service.cart;

import java.util.List;

import com.bread.app.vo.CartVO;
import com.bread.app.vo.OrderVO;

public interface CartService {

	default int addCart(int int_member_idx, int int_bread_idx, int int_bread_count) {return 0;}

	default List<CartVO> getCarts(int member_idx){return null;}

	default OrderVO getOrder(String order_idx) {return null;}

}
