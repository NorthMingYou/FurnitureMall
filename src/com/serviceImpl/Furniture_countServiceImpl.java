package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.Furniture_countDao;
import com.entity.Furniture_count;
import com.service.Furniture_countService;


@Service
@Transactional
public class Furniture_countServiceImpl implements Furniture_countService {
	
	@Autowired
	private Furniture_countDao furniture_countDao;
	
	
	@Override
	public List<Furniture_count> getTop10() {
		
		return furniture_countDao.getTop10();
	}


	@Override
	public void update(Furniture_count fc) {
		// TODO Auto-generated method stub
		furniture_countDao.update(fc);
	}


	public Furniture_count get(String id,String date) {
		// TODO Auto-generated method stub
		return furniture_countDao.get(id,date);
	}

}
