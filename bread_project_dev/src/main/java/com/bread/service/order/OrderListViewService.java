package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;

@Service("oList")
@AllArgsConstructor
public class OrderListViewService implements OrderService {

    private OrderDAO dao;
    
    
    @Override
    public List<ItemVO> item(PageVO vo){
        return dao.item(vo);
    }
    @Override
    public List<OrderVO> order(PageVO vo) {
    	vo.setStartIdx((vo.getPageNum()-1)*5);
    	return dao.order(vo);
    }
}