package com.bread.service.Review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;

public interface ReviewService {
    default int insert(ReviewVO vo, HttpServletRequest request) {return 0;}

    default int reviewDelete(int review_idx) {return 0;}

    default ReviewVO getBoard(int review_idx) {return null;}

    default List<ReviewVO> getBoards(PageVO vo) {return null;}

    default void increaseViewCount(int review_idx){}
    
	default FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock){return null;}
	
	default int getTotalCount(PageVO vo) {return 0;}
	
	default int updateReviewStatus(int review_idx){return 0;}
}
