package com.bread.service.Review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;
import com.bread.app.vo.SearchVO;

public interface ReviewService {
    default int insert(ReviewVO vo, HttpServletRequest request) {
        return 0;
    }

    default int update(ReviewVO vo, HttpServletRequest request) {
        return 0;
    }

    default int delete(int review_idx) {
        return 0;
    }

    default void download(String originfile_name, String savefile_name, HttpServletRequest request, HttpServletResponse response) {
    }

    default ReviewVO getBoard(int review_idx) {
        return null;
    }

    default List<ReviewVO> getBoards(PageVO vo) {
        return null;
    }

    default void increaseViewCount(int review_idx){}
    
    default List<ReviewVO> getTopReviews() {return null;}
    
	default FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock){return null;}
	
	default int getTotalCount(PageVO vo) {return 0;}
}
