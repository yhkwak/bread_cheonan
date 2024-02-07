package com.bread.service.bakery;

import com.bread.app.vo.BakeryVO;

public interface BakeryService {
	
    default int join(BakeryVO bakeryVO) {
        return 0;
    }

	default BakeryVO update(BakeryVO bakeryVO) {
		return null;
	}

	default BakeryVO bakeryGet(int member_idx) {
		return null;
	}
}
