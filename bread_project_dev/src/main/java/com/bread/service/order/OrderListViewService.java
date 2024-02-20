package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.OrderListVO;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service("oList")
@AllArgsConstructor
public class OrderListViewService implements OrderService {

    private OrderDAO dao;
    
    
    @Override
    public List<OrderListVO> orderList(int member_idx){
    	OrderListVO vo = new OrderListVO();
    	vo.setStartIdx((vo.getPageNum()-1)*10);
        return dao.orderList(member_idx);
    }
}