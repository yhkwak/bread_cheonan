package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.OrderListVO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;

@Service("oList")
@AllArgsConstructor
public class OrderListViewService implements OrderService {

    private OrderDAO dao;
    
    
    @Override
    public List<OrderListVO> orderList(PageVO vo){
    	vo.setStartIdx((vo.getPageNum()-1)*10);
        return dao.orderList(vo);
    }
}