package com.bread.service.adminMembership;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminMemDAO;

import lombok.AllArgsConstructor;

@Service("aDel")
@AllArgsConstructor
public class AdminMemDelService implements AdminMemService {

	private AdminMemDAO dao;

	@Override
	public int deleteMem(int memeber_idx) {
		return dao.deleteMem(memeber_idx);

	}
}