package com.bread.service.search;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bread.app.dao.SearchDAO;
import com.bread.app.vo.BakeryVO;
import com.bread.app.vo.SearchVO;

import lombok.AllArgsConstructor;

@Service("bkList")
@AllArgsConstructor
public class SearchBakeryService implements SearchService {
	
	private SearchDAO dao;
	
	@Override
	public List<BakeryVO> getBakerys(SearchVO vo){
		vo.setStartIdx((vo.getPageNum()-1)*5);
		return dao.getBakerys(vo);
	}
}
