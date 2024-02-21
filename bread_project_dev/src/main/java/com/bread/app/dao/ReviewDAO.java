package com.bread.app.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.PageVO;
import com.bread.app.vo.ReviewVO;
import com.bread.app.vo.SearchVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReviewDAO {

    public static final String MAPPER = "com.bread.app.ReviewMapper";

    private final SqlSession sqlSession;

    // Create 글작성
    public int insert(ReviewVO vo) {
        return sqlSession.insert(MAPPER + ".insert", vo);
    }

    // Read 하나의 게시글 조회
    public ReviewVO getBoard(int review_idx) {
        return sqlSession.selectOne(MAPPER + ".getBoard", review_idx);
    }

    // Read 모든 게시글 조회
    public List<ReviewVO> getBoards(PageVO vo) {
        return sqlSession.selectList(MAPPER + ".getBoards", vo);
    }

    // Update 수정하기
    public int update(ReviewVO vo) {
        return sqlSession.update(MAPPER + ".update", vo);
    }

    // Delete 삭제 처리
    public int delete(int review_idx) {
        return sqlSession.update(MAPPER + ".delete", review_idx);
    }

    // 조회수 증가
    public int increaseViewCount(int review_idx) {
        return sqlSession.update(MAPPER + ".increaseViewCount", review_idx);
    }

    // 상위 게시글만을 조회
    public List<ReviewVO> getTopReviews() {
        return sqlSession.selectList(MAPPER + ".getTopReviews");
    }
	// Read 모든 게시글 조회
	public int getTotalCount(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}

}
