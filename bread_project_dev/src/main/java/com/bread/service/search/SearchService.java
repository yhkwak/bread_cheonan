package com.bread.service.search;

import java.util.List;

import com.bread.app.common.FivePageNav;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.SearchVO;

public interface SearchService {

	default List<BakeryVO> getBakerys(SearchVO vo) {return null;}

	default int getTotalCount(SearchVO vo) {return 0;}

	default FivePageNav setPageNav(FivePageNav pageNav, int pageNum, int pageBlock){return null;}

}
