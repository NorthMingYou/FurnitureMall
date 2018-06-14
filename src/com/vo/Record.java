package com.vo;

/**
 * 這是一個值對象
 * 
 * @author Hking
 *
 */
public class Record {
	private String name;//商品名字
	private int count;//销售数目
	private double amount;//销售额
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}

}
