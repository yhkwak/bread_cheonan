package com.bread.service.search;

import org.springframework.stereotype.Service;

import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.BakeryVO;

import lombok.AllArgsConstructor;

@Service("vBakery")
@AllArgsConstructor
public class SearchViewBakeryService implements SearchService {
	
	private SearchDAO dao;
	
	@Override
	public BakeryVO getBakery(int bakery_idx) {
		
		BakeryVO bakeryVO = null;
		
		bakeryVO = dao.getBakery(bakery_idx);
		
		return bakeryVO;
	}

}
