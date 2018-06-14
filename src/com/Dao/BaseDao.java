package com.Dao;

import java.util.List;

public interface BaseDao {
	/*
	 * 公共部分的dao接口
	 *
	 */
	//增加操作
	public int save(Object object);
	//删除操作
	public int delete(Object object);
	//查找所有记录操作
	public List<?> getList(Class<?> clas);
	//更新操作
	public int update(Object object);
	//根据主键获得实体
	public Object getObject(Class<?> clas,String mainKey);
}
