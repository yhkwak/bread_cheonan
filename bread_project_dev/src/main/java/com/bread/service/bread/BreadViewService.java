package com.bread.service.bread;

import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.BreadVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service("bView")
@AllArgsConstructor
public class BreadViewService implements BreadService {

    private BreadDAO dao;

    @Override
    public BreadVO getBoard(int bread_inx) {
        return dao.getBoard(bread_inx);
    }
}