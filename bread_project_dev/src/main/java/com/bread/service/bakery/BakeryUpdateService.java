package com.bread.service.bakery;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.bread.app.dao.BakeryDAO;
import com.bread.app.vo.BakeryVO;

import lombok.AllArgsConstructor;


@AllArgsConstructor
@Service("bakeryUpdate")
public class BakeryUpdateService implements BakeryService {
	
	private BakeryDAO dao;
	
	@Override
	public BakeryVO update(BakeryVO bakeryVO) {
		
		BakeryVO newVO = null;
		
		try {
			newVO=dao.update(bakeryVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newVO;
	}

}
