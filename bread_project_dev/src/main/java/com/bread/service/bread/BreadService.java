package com.bread.service.bread;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bread.app.common.TenPageNav;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.PageVO;
import com.bread.app.vo.SearchVO;

public interface BreadService {

    default int insert(BreadVO vo, HttpServletRequest request) {
        return 0;
    }

    default int update(BreadVO vo, HttpServletRequest request) {
        return 0;
    }

    default int delete(int bread_idx) {
        return 0;
    }

    default void download(String originfile_name, String savefile_name, HttpServletRequest request, HttpServletResponse response) {

    }

    default BreadVO getBoard(int bread_inx) {
        return null;
    }

    default List<BreadVO> getBoards(SearchVO vo) {
        return null;
    }
    
	default int getTotalCount(SearchVO searchVO) {
		return 0;
	}
    
	default TenPageNav setPageNav(TenPageNav pageNav, int pageNum, int pageBlock) {return null;}
}