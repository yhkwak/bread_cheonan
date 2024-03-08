package com.bread.service.order;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.bread.app.dao.OrderDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("oCancel")
@AllArgsConstructor
public class OrderCancelService implements OrderService {

    private OrderDAO dao;
    
    @Override
    public int cancel(String order_idx) {
    	
    	
        int result = 0;
        
        try {
            result = dao.orderCancel(order_idx.trim());
            System.out.println("서비스 result : "+result);
            System.out.println("서비스 order_idx:" + order_idx);
        	
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        
        return result;
    }
}