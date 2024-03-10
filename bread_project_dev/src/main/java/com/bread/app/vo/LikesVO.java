package com.bread.app.vo;

import lombok.Data;

@Data
public class LikesVO {

	private int likes_idx;
	private int member_idx;
	private int likes_check;
	private int bakery_idx; // 매장 찜
	private int review_idx; // 리뷰 좋아요
	
	//찜목록
	private String bakery_img_save; 
	private String bakery_name;
	
	//페이징
	private int pageNum;
	private int pageBlock;
	private int startIdx;
	
}
