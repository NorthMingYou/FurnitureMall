package com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.UserDao;
import com.entity.User;
import com.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userdao;
	
	@Override
	public int checkPhone(String phone) {
		// TODO Auto-generated method stub
		
		return userdao.checkPhoneExist(phone);
	}

	@Override
	public int addUser(User u) {
		// TODO Auto-generated method stub
		return userdao.save(u);
	}

	@Override
	public User getAUserByPhoneAndPwd(String phone, String password) {
		// TODO Auto-generated method stub
		return userdao.getAUserByPhoneAndPassword(phone, password);
	}

	@Override
	public int checkUserByPhoneAndPwd(String phone, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updataUser(User user) {
		// TODO Auto-generated method stub
		return userdao.update(user);
	}

}
