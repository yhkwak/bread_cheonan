package com.bread.app.vo;

import lombok.Data;

@Data
public class LikesVO {

	private int likes_idx;
	private int member_idx;
	private int likes_check;
	private int bakery_idx; // 매장 찜
	private int review_idx; // 리뷰 좋아요
	
}
