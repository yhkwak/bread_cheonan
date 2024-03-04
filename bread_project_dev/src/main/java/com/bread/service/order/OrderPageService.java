package com.bread.service.order;

import org.springframework.stereotype.Service;

import com.bread.app.common.TenPageNav;

@Service("oPage")
public class OrderPageService implements OrderService {
	//페이지 네비게이션을 위한 9개의 변수에 대한 설정
	@Override
	public TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock) {
		int totalRows = pageNav.getTotalRows();//1. 총게시물수 : totalRows
		int rows_page = 5;//2. 한 페이지에 보여줄 게시물수 : rows_page
		int pages_pageBlock = 5;//3. 한 페이지블록에 보여줄 페이지수 : pages_pageBlock
		
		pageNav.setRows_page(rows_page);
		pageNav.setPages_pageBlock(pages_pageBlock);
		
		int pNum = 0;
		if(pageNum == 0) {
			pNum = 1;
		}else {
			pNum = pageNum;
		}
		pageNav.setPageNum(pNum);//4. 현재 페이지번호 : pageNum
		
		int pBlock = 0;
		if(pageBlock == 0) {
			pBlock = 1;
		}else {
			pBlock = pageBlock;
		}
		pageNav.setPageBlock(pBlock);//7. 현재 페이지블록번호 : pageBlock 
		
		int startNum = (pNum-1)*rows_page + 1;//5. 게시물의 시작번호 : startNum
		int endNum = pNum*rows_page;//6. 게시물의 끝번호 : endNum
		int total_pageNum = (int)Math.ceil((double)totalRows/rows_page);//8. 마지막/총 페이지번호 : total_pageNum
		int last_pageBlock = (int)Math.ceil((double)total_pageNum/pages_pageBlock);//9. 마지막 페이지블록번호 : last_pageBlock
		
		pageNav.setStartNum(startNum);
		pageNav.setEndNum(endNum);
		pageNav.setTotal_pageNum(total_pageNum);
		pageNav.setLast_pageBlock(last_pageBlock);
		
		return pageNav;
	}
}
