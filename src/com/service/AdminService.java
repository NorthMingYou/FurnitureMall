package com.service;

import com.entity.Admin;

public interface AdminService {
	
	/**
	 * 登录校验
	 * @param adminnmae
	 * @param password
	 * @return
	 */
	public Admin login(String adminnmae,String password);
}
