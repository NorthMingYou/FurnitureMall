package com.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@SuppressWarnings("serial")
@Entity
@Table(name="furniture_count")
public class Furniture_count implements Serializable{
	private String fcid;//id
	private String fid;//家具id
	//private Integer count;//家具数量
	private Integer sales;//销售量
	
	private String date;		
	
	public Furniture_count() {
		// TODO Auto-generated constructor stub
		super();
	}
	public Furniture_count(String fid,Integer sales,String date) {
		super();
		this.fid=fid;
		//this.count=count;
		this.sales=sales;
		this.date=date;
	}
	
	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getFcid() {
		return fcid;
	}
	public void setFcid(String fcid) {
		this.fcid = fcid;
	}
	
	@Column(length = 32)
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	
	@Column(length = 32)
	public Integer getSales() {
		return sales;
	}
	public void setSales(Integer sales) {
		this.sales = sales;
	}
	
	@Column(length = 32)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
