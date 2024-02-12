package com.bread.app.vo;

import lombok.Data;

@Data
public class SearchVO {
	private String searchWord;
	//보완된 SQL문으로 인해 추가함
	private int pageNum;
	private int pageBlock;
	private int startIdx; //BoardMapper.xml에서 게시물 목록 가져올 때 limit 함수의 매개값으로 사용
	//BoardListService 클래스의 getBoards() 메소드에서 startIdx 값을 (pageNum-1)*10으로 세팅해줌
	private int bakery_idx;// bakery_idx 속성 추가 BreadMapper의 SQL 쿼리에서 사용하기 위함

}