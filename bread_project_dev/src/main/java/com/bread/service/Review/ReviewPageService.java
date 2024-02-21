package com.bread.service.Review;

import org.springframework.stereotype.Service;

import com.bread.app.common.FivePageNav;
import com.bread.app.dao.ReviewDAO;

import lombok.AllArgsConstructor;

@Service("rPage")
@AllArgsConstructor
public class ReviewPageService implements ReviewService {
	//페이지 네비게이션을 위한 9개의 변수에 대한 설정
	@Override
	public FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock) {
		int totalRows = pageNav.getTotalRows(); //1. 총 게시물 수
		int rows_page = 12; //2. 한 페이지에 보여줄 게시물 수
		int pages_pageBlock = 5; //3. 한 페이지에 보여줄 페이지 수
		
		pageNav.setRows_page(rows_page);
		pageNav.setPages_pageBlock(pages_pageBlock);
		
		int pNum = 0;
		if(pageNum == 0) {
			pNum = 1;
		} else {
			pNum = pageNum;
		}
		pageNav.setPageNum(pNum); //4. 현재 페이지번호
		
		int pBlock = 0;
		if(pageBlock == 0) {
			pBlock = 1;
		} else {
			pBlock = pageBlock;
		}
		pageNav.setPageBlock(pBlock); //5. 현재 페이지 블럭
		
		int startNum = (pNum-1)*rows_page + 1; //6. 게시물의 시작번호
		int endNum = pNum*rows_page; //7. 게시물의 끝번호
		int total_pageNum = (int)Math.ceil((double)totalRows/rows_page); //8. 마지막/총 페이지번호
		int last_pageBlock = (int)Math.ceil((double)total_pageNum/pages_pageBlock);//9. 마지막 페이지블럭
		
		pageNav.setStartNum(startNum);
		pageNav.setEndNum(endNum);
		pageNav.setTotal_pageNum(total_pageNum);
		pageNav.setLast_pageBlock(last_pageBlock);
		
		
		return pageNav;
	}
}
