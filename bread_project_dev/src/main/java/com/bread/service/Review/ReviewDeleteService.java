package com.bread.service.Review;

import com.bread.app.dao.ReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("rDelete")
public class ReviewDeleteService implements ReviewService {

    @Autowired
    private ReviewDAO dao;

    @Override
    public int reviewDelete(int review_idx) {
        return dao.reviewDelete(review_idx);
    }
}
