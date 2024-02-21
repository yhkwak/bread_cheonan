package com.bread.app.vo;

import lombok.Data;

@Data
public class PageVO {

	//페이징
	private int pageNum;
	private int pageBlock;
	private int startIdx;
	
	private int member_idx;
}
