package com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.AdminDao;
import com.entity.Admin;
import com.service.AdminService;

@Transactional
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	

	@Override
	public Admin login(String adminname, String password) {
		// TODO Auto-generated method stub
		return adminDao.get(adminname, password);
	}

}
