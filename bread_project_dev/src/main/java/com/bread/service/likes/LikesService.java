package com.bread.service.likes;

import com.bread.app.vo.LikesVO;

public interface LikesService {

	//매장 찜 여부 확인
	default int checkBL(LikesVO lvo) {return 0;}
	default int checkBL2(LikesVO lvo) {return 0;}
	
	//매장 찜하기
	default int addBL(LikesVO lvo) {return 0;}
	
	//매장 찜 해제
	default int delBL(LikesVO lvo) {return 0;}
	
}
