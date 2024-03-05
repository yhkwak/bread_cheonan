package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.ItemVO;
import com.bread.app.vo.OrderVO;
import com.bread.app.vo.PageVO;

import lombok.AllArgsConstructor;

@Service("oManage")
@AllArgsConstructor
public class OrderManagementService implements OrderService {
	private OrderDAO dao;
    
    
    @Override
    public List<ItemVO> item2(PageVO vo){
        return dao.item2(vo);
    }
    @Override
    public List<OrderVO> order2(PageVO vo) {
    	vo.setStartIdx((vo.getPageNum()-1)*5);
    	return dao.order2(vo);
    }
}
