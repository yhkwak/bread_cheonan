package com.bread.app.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_idx;
	private int member_idx;
	private int bread_idx;
	private int bread_count;
	private String bread_name;
	private String bakery_name;
	private int bread_price;
}
