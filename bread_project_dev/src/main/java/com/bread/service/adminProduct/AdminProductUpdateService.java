package com.bread.service.adminProduct;




import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminProductDAO;
import com.bread.app.vo.AdminProductVO;

import lombok.AllArgsConstructor;



@Service("APUpdate")
@AllArgsConstructor
public class AdminProductUpdateService implements AdminProductService {

    private AdminProductDAO dao;

    @Override
    public int update(AdminProductVO vo, HttpServletRequest request) {
        int result = 0;

        result = dao.update(vo);

        return result;
    }
}