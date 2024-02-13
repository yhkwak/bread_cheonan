package com.bread.service.search;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.BreadVO;

import lombok.AllArgsConstructor;

@Service("getBreads")
@AllArgsConstructor
public class SearchGetBreadService implements SearchService {
	
	private SearchDAO dao;
	
	@Override
	public List<BreadVO> getBreads(int bakery_idx){
		return dao.getBreads(bakery_idx);
	}

}
