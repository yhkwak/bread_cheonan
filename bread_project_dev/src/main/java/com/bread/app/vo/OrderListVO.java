package com.bread.app.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {

	private int payment_status; // 결제상태
	private int order_idx; // 주문번호
	private Date payment_date; // 결제일

	private String bakery_name; //가게 이름
	private String bread_name; //빵 이름
	private int bread_price; //빵 가격
	
	private int count; // 주문 수량
	
	private int member_idx ; //멤버 외래키
	private int bread_idx; // 상품 외래키
	private int bakery_idx; //가게 외래키
	private int cart_idx; // 장바구니 외래키
	
}
