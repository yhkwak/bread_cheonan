package com.bread.app.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bread.app.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAO {
	public static final String MAPPER = "com.bread.app.MemberMapper";
	
	// db연결작업
	private	final SqlSession sqlSession;
	
	// 회원가입 정보 입력
	public int join(MemberVO vo) throws SQLException {
		return sqlSession.insert(MAPPER+".join",vo);
	}
	//로그인
		public MemberVO login(String member_id, String member_pw) throws SQLException{
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_id", member_id);
			map.put("member_pw", member_pw);
			return sqlSession.selectOne(MAPPER+".login", map);
		}

		// 아이디 중복검사
	    public int checkId(String member_id) throws SQLException {
	        return sqlSession.selectOne(MAPPER+".checkId",member_id);
	    }
	    
	    //닉네임 중복검사
	    public int checkNickname(String member_nickname) throws SQLException {
	        return sqlSession.selectOne(MAPPER+".checkNickname",member_nickname);
	    }
	    
	    //전화번호 중복검사
	    public int checkPhoneNumber(String member_phone) throws SQLException {
	        return sqlSession.selectOne(MAPPER+".checkPhoneNumber",member_phone);
	    }
		// 회원정보 findAll
		public List<MemberVO> getMembers() throws SQLException {
			return sqlSession.selectList(MAPPER+".getMembers");
		}
		
		// 회원정보 한명만 가져오기 findById
		public MemberVO getMember(int member_idx) throws SQLException {
			return sqlSession.selectOne(MAPPER+".getMember", member_idx);
		}
		
		// 회원정보 update
		public MemberVO updateMember(MemberVO vo) throws SQLException{
			MemberVO newVO = null;		
			if(sqlSession.update(MAPPER+".updateMember", vo) == 1) {//회원정보 업데이트 성공
				newVO = getMember(vo.getMember_idx());
			}
			return newVO;
		}
		
		//아이디 찾기
		public MemberVO getFindId(String member_name, String member_phone) throws SQLException{
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_name", member_name);
			map.put("member_phone", member_phone);
			return sqlSession.selectOne(MAPPER+".getFindId", map);
		}
		
		//비밀번호 찾기
		public MemberVO getFindPw(String member_id, String member_phone) throws SQLException{
			Map<String, String> map = new HashMap<String, String>();
			map.put("member_id", member_id);
			map.put("member_phone", member_phone);
			return sqlSession.selectOne(MAPPER+".getFindPw", map);
		}
		
		// 회원정보 update
		public MemberVO changePw(MemberVO vo) throws SQLException{
			MemberVO newVO = null;		
			if(sqlSession.update(MAPPER+".changePw", vo) == 1) {//회원정보 업데이트 성공
				newVO = getFindPw(vo.getMember_id(), vo.getMember_phone());
			}
			return newVO;
		}

}
