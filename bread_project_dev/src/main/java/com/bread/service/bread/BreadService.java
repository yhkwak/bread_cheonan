package com.bread.service.bread;

import com.bread.app.vo.BreadVO;
import com.bread.app.vo.SearchVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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
}