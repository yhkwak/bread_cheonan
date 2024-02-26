package com.bread.service.adminStore;

import org.springframework.stereotype.Service;

import com.bread.app.dao.AdminStoreDAO;

import lombok.AllArgsConstructor;

@Service("asDel")
@AllArgsConstructor
public class AdminStoreDelService implements AdminStoreService {

	private AdminStoreDAO dao;

	@Override
	public int deleteStore(int bakery_idx) {
		return dao.deleteStore(bakery_idx);

	}
}