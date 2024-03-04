package com.bread.service.order;

import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;

import lombok.AllArgsConstructor;

@Service("gBakery")
@AllArgsConstructor
public class OrderGetBakeryIdxService implements OrderService {
	private OrderDAO dao;
 
    @Override
    public int getBakeryIdx(int member_idx){
        return dao.getBakeryIdx(member_idx);
    }
    
}
