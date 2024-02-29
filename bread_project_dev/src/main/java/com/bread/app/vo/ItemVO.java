package com.bread.app.vo;

import lombok.Data;

@Data
public class ItemVO {
	private int item_idx;
	private int bread_idx;
	private int bakery_idx;
	private String order_idx;
	private int bread_count;
	private int review_status;
	private String bread_name; //빵 이름
	private String bread_img_save; //빵 이미지
	private String bakery_name; //가게 이름
	private int bread_price; //빵 가격
	private int member_idx; // member_idx추가 쿼리파람으로 reviewWrite에 member_idx받아오기위함



}
