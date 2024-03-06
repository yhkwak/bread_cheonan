package com.bread.service.likes;

import com.bread.app.vo.LikesVO;

public interface LikesService {

	//매장 찜 여부 확인
	default LikesVO checkBL(LikesVO lvo) {return null;}

	//매장 찜하기
	default int addBL(LikesVO lvo) {return 0;}
	
	//매장 찜 해제
	default void delBL(LikesVO lvo) {return ;}

}
