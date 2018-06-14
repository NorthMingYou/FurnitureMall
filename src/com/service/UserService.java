package com.service;

import com.entity.User;

public interface UserService {
	
	/**
	 * 检查手机号
	 * @param phone
	 * @return
	 */
	int checkPhone(String phone);
	
	/**
	 * 添加用户
	 * @param u
	 * @return
	 */
	int addUser(User u);
	
	
	/**
	 * 通过手机号和密码检查登录
	 * @param phone
	 * @param password
	 * @return
	 */
	int checkUserByPhoneAndPwd(String phone,String password);
	
	/**
	 * 登录后获取用户
	 * @param phone
	 * @param password
	 * @return
	 */
	User getAUserByPhoneAndPwd(String phone,String password);
	
	
	int updataUser(User user);
	
}
