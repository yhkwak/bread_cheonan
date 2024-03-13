package com.bread.service.Review;


import org.springframework.stereotype.Service;

import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;

import lombok.AllArgsConstructor;

@Service("sUpdate")
@AllArgsConstructor
public class ReviewUpdateStatusService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public int Updatestatus(ReviewVO vo) {
        return dao.updateStatus(vo);
    }
}
