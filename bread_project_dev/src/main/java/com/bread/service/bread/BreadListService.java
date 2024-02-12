package com.bread.service.bread;


import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.BreadVO;
import com.bread.app.vo.SearchVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bList")
@AllArgsConstructor
public class BreadListService implements BreadService {

    private BreadDAO dao;

    @Override
    public List<BreadVO> getBoards(SearchVO vo) {

        vo.setStartIdx((vo.getPageNum()-1)*10);

        return dao.getBoards(vo);
    }
}