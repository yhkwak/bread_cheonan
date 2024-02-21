package com.bread.app.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.NoticeVO;
import com.bread.app.vo.PageVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeDAO {
	
	public static final String MAPPER = "com.bread.app.NoticeMapper";
	
	private final SqlSession sqlSession;
	
	// Create 글작성
	public int insert(NoticeVO vo) {
		return sqlSession.insert(MAPPER+".insert",vo);
	}
	
	//Read 하나의 게시글 조회
	public NoticeVO getBoard(int notice_idx) {
		return sqlSession.selectOne(MAPPER+".getBoard", notice_idx);
	}
	
	// Read 모든 게시글 조회
	public List<NoticeVO> getBoards(PageVO vo) {
		return sqlSession.selectList(MAPPER+".getBoards",vo);
	}
	// Read 모든 게시글 조회
	public int getTotalCount(PageVO vo) {
		return sqlSession.selectOne(MAPPER+".getTotalCount",vo);
	}
	
	
	
	// Update 수정하기
	public int update(NoticeVO vo) {
		return sqlSession.update(MAPPER+".update", vo);
	}
	
	// Delete 삭제 처리
	public int delete(int notice_idx) {
		return sqlSession.update(MAPPER+".delete", notice_idx);
	}
}
