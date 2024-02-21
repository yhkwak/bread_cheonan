package com.bread.service.Review;

import org.springframework.stereotype.Service;

import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("rTotalCount")
@AllArgsConstructor
public class ReviewTotalCountService implements ReviewService {
	private ReviewDAO dao;
	
	@Override
	public int getTotalCount(PageVO vo) {
		 int totalCount = dao.getTotalCount(vo);
	        log.info("Total count={}", totalCount);
		return dao.getTotalCount(vo);
	}
}
