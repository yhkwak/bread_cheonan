package com.bread.service.Review;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.ReviewDAO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;

import lombok.AllArgsConstructor;

@Service("rList")
@AllArgsConstructor
public class ReviewListService implements ReviewService {

    private ReviewDAO dao;

    @Override
    public List<ReviewVO> getBoards(PageVO vo) {
        vo.setStartIdx((vo.getPageNum()-1)*12);
        return dao.getBoards(vo);
    }

}
