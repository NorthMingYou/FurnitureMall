package com.Dao;

import com.entity.Admin;

public interface AdminDao {
	/**
	 * 获取管理员
	 * @param adminname
	 * @param password
	 * @return
	 */
	Admin get(String adminname,String password);
}
