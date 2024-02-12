package com.bread.service.bread;

import com.bread.app.dao.BreadDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bDelete")
public class BreadDeleteService implements BreadService {

    @Autowired
    private BreadDAO dao;

    @Override
    public int delete(int bread_idx) {
        return dao.delete(bread_idx);
    }
}