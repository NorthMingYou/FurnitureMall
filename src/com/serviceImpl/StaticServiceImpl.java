package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.StaticDao;
import com.service.StaticService;

@Service
public class StaticServiceImpl implements StaticService {

	@Autowired
	private StaticDao staticDao;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List getSale(String year, String month, String style) {
		// TODO Auto-generated method stub
		return staticDao.getSaleByDateAndType(year, month, style);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List getIncome(String year, String month) {
		// TODO Auto-generated method stub
		return staticDao.getIncomeByDate(year, month);
	}
	
}
