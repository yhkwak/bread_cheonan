package com.bread.service.order;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.bread.app.dao.OrderDAO;
import com.bread.app.vo.OrderListVO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service("oList")
@RequiredArgsConstructor
public class OrderListViewService implements OrderService {
    @Setter(onMethod_ = {@Autowired})
    private OrderDAO dao;
    
    @Override
    public List<OrderListVO> orderList(int member_idx){
        return dao.orderList(member_idx);
    }
}