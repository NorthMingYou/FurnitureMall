package com.Dao;

import java.util.List;

import com.entity.Furniture_count;

public interface Furniture_countDao extends BaseDao{
	List<Furniture_count> getTop10();

	Furniture_count get(String id,String date);
}
