package com.bread.service.Review;

import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.ReviewVO;
import com.bread.app.vo.SearchVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service("rList")
@AllArgsConstructor
public class ReviewListService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public List<ReviewVO> getBoards(SearchVO vo) {
        vo.setStartIdx((vo.getPageNum()-1)*10);
        return dao.getBoards(vo);
    }

    @Override
    public List<ReviewVO> getTopReviews() {
        return dao.getTopReviews();
    }
}
