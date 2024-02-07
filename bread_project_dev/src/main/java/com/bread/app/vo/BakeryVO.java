package com.bread.app.vo;

import lombok.Data;

@Data
public class BakeryVO {
	
	private int bakery_idx;
	private int member_idx; 
	private String bakery_name;
	private String bakery_phone;
	private String bakery_postcode;
	private String bakery_address;
	private String bakery_detail_address;
	private String bakery_homepage;
	private String bakery_img;
	private String bakery_img_save;
	private int bakery_del;
	
}
