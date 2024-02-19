package com.bread.service.Review;


import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service("rView")
@AllArgsConstructor
public class ReviewViewService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public ReviewVO getBoard(int review_idx) {
        return dao.getBoard(review_idx);
    }
}
