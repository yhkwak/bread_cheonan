package com.bread.app.common;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TenPageNav {
	private int totalRows;
	private int rows_page;
	private int pages_pageBlock;
	private int pageNum;
	private int startNum;
	private int endNum;
	private int pageBlock;
	private int total_pageNum;
	private int last_pageBlock;
}
