package com.bread.service.bakery;

import javax.servlet.http.HttpServletRequest;

import com.bread.app.vo.BakeryVO;

public interface BakeryService {
	
    default int join(BakeryVO bakeryVO) {
        return 0;
    }

	default BakeryVO update(BakeryVO bakeryVO, HttpServletRequest reques) {
		return null;
	}

	default BakeryVO bakeryGet(int member_idx) {
		return null;
	}
}
