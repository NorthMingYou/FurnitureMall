package com.service;

import java.util.List;

import com.entity.Furniture_count;

public interface Furniture_countService {
	/**
	 * 获取家具的top10月销量
	 * @return
	 */
	List<Furniture_count> getTop10();
	
	void update(Furniture_count fc);
	
	Furniture_count get(String id,String date);
}
