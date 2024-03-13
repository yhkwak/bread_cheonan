package com.bread.service.Review;

import org.springframework.stereotype.Service;

import com.bread.app.dao.ReviewDAO;

import lombok.AllArgsConstructor;

@Service("rUpdate")
@AllArgsConstructor
public class ReviewUpdateService implements ReviewService {

	private ReviewDAO dao;

	@Override
	 public int updateReviewStatus(int review_idx) {
        
            return dao.updateReviewStatus(review_idx);
        }
}