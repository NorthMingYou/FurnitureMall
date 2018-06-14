package com.Dao;

import com.entity.User;

public interface UserDao extends BaseDao {

	/**
	 * 检查手机号是否已经存在了，如果存在就不能注册了
	 * @param phone
	 * @return
	 */
	int checkPhoneExist(String phone);
	
	/**
	 * 通过手机号查找一个用户
	 * @param phone
	 * @return
	 */
	User getAUserByPhone(String phone);
	
	/**
	 * 通过id查找一个用户
	 * @param userid
	 * @return
	 */
	User getAUserById(String userid);
	
	
	
	
	/**
	 * 通过手机号和密码检查用户是否登录正确
	 * @param phone
	 * @param password
	 * @return
	 */
	User getAUserByPhoneAndPassword(String phone,String  password);
	
}
