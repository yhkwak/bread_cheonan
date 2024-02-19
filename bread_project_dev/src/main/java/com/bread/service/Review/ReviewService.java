package com.bread.service.Review;

import com.bread.app.vo.ReviewVO;
import com.bread.app.vo.SearchVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

    default List<ReviewVO> getBoards(SearchVO vo) {
        return null;
    }

    default void increaseViewCount(int review_idx){}
    default List<ReviewVO> getTopReviews() {
        return null;}
}
