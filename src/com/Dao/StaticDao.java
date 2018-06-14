package com.Dao;

import java.util.List;

public interface StaticDao {
	/**
	 * 根据用户请求的时间和家具的风格获取销售的数量
	 * @param year  统计的年份
	 * @param month 统计的月份
	 * @param style	统计的家具风格
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List getSaleByDateAndType(String year, String month, String style);
	
	
	@SuppressWarnings("rawtypes")
	List getIncomeByDate(String year, String month);
}
