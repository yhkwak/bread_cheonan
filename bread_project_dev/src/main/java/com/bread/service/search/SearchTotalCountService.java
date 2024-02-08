package com.bread.service.search;

import org.springframework.stereotype.Service;

import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("bkTotalCount")
@AllArgsConstructor
public class SearchTotalCountService implements SearchService {
	private SearchDAO dao;
	
	@Override
	public int getTotalCount(SearchVO vo) {
		return dao.getTotalCount(vo);
	}
}
