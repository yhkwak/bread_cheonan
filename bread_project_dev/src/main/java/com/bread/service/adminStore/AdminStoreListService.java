package com.bread.service.adminStore;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminStoreDAO;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("asList")
@AllArgsConstructor
public class AdminStoreListService implements AdminStoreService {

    private AdminStoreDAO dao;
    
    
    @Override
    public List<BakeryVO> adminStore(SearchVO vo){
    	vo.setStartIdx((vo.getPageNum()-1)*10);
        return dao.adminStore(vo);
    }
}