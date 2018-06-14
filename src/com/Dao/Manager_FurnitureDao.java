package com.Dao;

import java.util.List;

import com.entity.Furniture;

public interface Manager_FurnitureDao extends BaseDao {
	//int addFurniture(Furniture f);//添加商品

	int updateFurniture(Furniture f);//修改商品

	//int updateFurnitureState(Furniture f);//修改商品状态

	int deleteFurniture(String fid);//通过id删除商品

	Furniture findFurnitureById(String fid);//通过id查找商品

	List<Furniture> findFurnitureByName(String fname);//通过商品名称模糊查找商品

	List<Furniture> findFurnitureByType(String ftype);//通过类型查找商品

	List<Furniture> findFurnitureByStyle(String fstyle);//通过风格查找商品
	
	
	
	
}
