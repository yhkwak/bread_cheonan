package com.bread.app.dao;


import com.bread.app.vo.BreadVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class BreadDAO {

    public static final String MAPPER = "com.bread.app.BreadMapper";

    private final SqlSession sqlSession;

    public int insert(BreadVO vo) {
        return sqlSession.insert(MAPPER + ".insert", vo);
    }

    public BreadVO getBoard(int bread_idx) {
        return sqlSession.selectOne(MAPPER + ".getBoard", bread_idx);
    }

    public List<BreadVO> getBoards(SearchVO vo) {
        return sqlSession.selectList(MAPPER + ".getBoards", vo);
    }
    public int update(BreadVO vo) {
        return sqlSession.update(MAPPER + ".update", vo);
    }

    public int delete(int bread_idx) {
        return sqlSession.update(MAPPER + ".delete", bread_idx);
    }
    
	// Read 모든 게시글 조회
    public int getTotalCount(SearchVO searchVO) {
        return sqlSession.selectOne(MAPPER + ".getTotalCount", searchVO);
    }

}
