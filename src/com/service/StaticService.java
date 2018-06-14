package com.service;

import java.util.List;

public interface StaticService {
	
	@SuppressWarnings("rawtypes")
	List getSale(String year, String month, String style);
	@SuppressWarnings("rawtypes")
	List getIncome(String year, String month);
	
}
