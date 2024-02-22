package com.bread.service.adminMembership;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminMemDAO;
import com.bread.app.vo.MemberVO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("aList")
@AllArgsConstructor
public class AdminMemListService implements AdminMemService {

    private AdminMemDAO dao;
    
    
    @Override
    public List<MemberVO> adminMem(SearchVO vo){
    	vo.setStartIdx((vo.getPageNum()-1)*10);
        return dao.adminMem(vo);
    }
}