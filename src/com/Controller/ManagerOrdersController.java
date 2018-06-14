package com.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Utils.PageBean;
import com.entity.FOrder;
import com.service.ManagerOrdersService;


@Controller
@RequestMapping("/Manager")
public class ManagerOrdersController {
	/*
	 * 订单管理部分
	 */
	@Autowired
	ManagerOrdersService ms;
	
	/*
	 * 以下方法全部不分页,return 页面 各自 写
	 */
	//获取全部订单
	@RequestMapping("/getOrders")
	public String getOrders(Map<String,Object> map){
		List<FOrder> list = ms.getOrders();
		map.put("list", list);
		return "/Manager/Order";
	}
	//搜索订单(ajax)
	
	@RequestMapping("/searchOrders")
	@ResponseBody
	public List<FOrder> searchOrders(String key,String value,Map<String ,Object> map)
	{
		List<FOrder> list = ms.searchOrders(key, value);
		return list;
	}
	//根据订单状态获得订单(ajax)
	@RequestMapping("/getOrdersByState")
	@ResponseBody
	public List<FOrder> getOrdersByState(Integer state,Map<String,Object> map)
	{
		List<FOrder> list = ms.getOrders();
		return list;
	}
	/*
	 * 以下方法进行后台分页，可选
	 */
	//获得全部订单
	@RequestMapping("/getOrdersFY")
	public String getOrdersFY(Integer size,Integer PageCode,Map<String,Object> map)
	{
		@SuppressWarnings("rawtypes")
		PageBean pb = ms.getOrders(size, PageCode);
		map.put("PageBean",pb);
		//返回页面自行改动
		return "";
	}
	//搜索订单(ajax)
	@SuppressWarnings("unchecked")
	@RequestMapping("/searchOrdersFY")
	@ResponseBody
	public PageBean<FOrder> searchOrdersFY(Integer size,Integer PageCode,Map<String,Object> map,
			String key,String value)
	{
		@SuppressWarnings("rawtypes")
		PageBean pb = ms.searchOrders(key, value, PageCode, size);
		return pb;
	}
	//根据订单状态查询(ajax)
	@RequestMapping("/searchOrdersByStateFY")
	@ResponseBody
	public PageBean<FOrder> searchOrdersByStateFY(Integer size,Integer PageCode,
			Integer state,Map<String,Object> map)
	{
		return ms.searchOrders(state, size, PageCode);
	}
	
	//发货处理
	@RequestMapping("/sendProduct")
	public List<FOrder> sendProduct(String fid,Map<String,Object> map)
	{
		Integer result = ms.sendProduct(fid);
		if(result>0)
		{
			List<FOrder> list = ms.getOrders();
			return list;
		}
		return null;
	}
	//退货处理
	@RequestMapping("")
	public List<FOrder> HandleForderCancel(String fid,Map<String,Object> map)
	{
		Integer result = ms.HandleForderCancel(fid);
		if(result>0)
		{
			List<FOrder> list = ms.getOrders();
			return list;
		}
		return null;
	}
}
