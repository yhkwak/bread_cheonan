package com.bread.service.bread;

import org.springframework.stereotype.Service;

import com.bread.app.dao.BreadDAO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("bTotalCount")
@AllArgsConstructor
public class BreadTotalCountService implements BreadService {

	private BreadDAO dao;
	
	@Override
	public int getTotalCount(SearchVO searchVO) {
		return dao.getTotalCount(searchVO);
	}	

}
