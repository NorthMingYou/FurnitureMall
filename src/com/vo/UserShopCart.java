package com.vo;

import java.util.List;

import com.entity.Shopcart;

public class UserShopCart {
	
	private List<Shopcart> shopcartlist;
	private Double  allmoney;
	
	
	
	public List<Shopcart> getShopcartlist() {
		return shopcartlist;
	}
	public void setShopcartlist(List<Shopcart> shopcartlist) {
		this.shopcartlist = shopcartlist;
	}
	public Double getAllmoney() {
		return allmoney;
	}
	public void setAllmoney() {
		Double tem=0.0;
		for(Shopcart shopcart:shopcartlist) {
			tem=tem+shopcart.getTotalprice();
		}
		System.out.println(tem);
		this.allmoney = tem;
	}
	
	

}
