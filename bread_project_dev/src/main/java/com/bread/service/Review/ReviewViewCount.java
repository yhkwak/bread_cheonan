package com.bread.service.Review;

import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("rViewCount")
@AllArgsConstructor
public class ReviewViewCount implements ReviewService {

    private ReviewDAO dao;
    @Override
    public void increaseViewCount(int review_idx) {
        dao.increaseViewCount(review_idx);
    }
}
