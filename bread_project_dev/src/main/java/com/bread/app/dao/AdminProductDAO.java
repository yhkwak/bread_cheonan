package com.bread.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.AdminProductVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminProductDAO {

    public static final String MAPPER = "com.bread.app.AdminProductMapper";
    
    private final SqlSession sqlSession;
    

    public int insert(AdminProductVO vo) {
        return sqlSession.insert(MAPPER + ".insert", vo);
    }

    public AdminProductVO getBoard(int bread_idx) {
        return sqlSession.selectOne(MAPPER + ".getBoard", bread_idx);
    }

    public List<AdminProductVO> getBoards(SearchVO vo) {
        return sqlSession.selectList(MAPPER + ".getBoards", vo);
    }

    
	// Read 모든 게시글 조회
	public int getTotalCount(SearchVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}

    public int update(AdminProductVO vo) {
        return sqlSession.update(MAPPER + ".update", vo);
    }
    

}
