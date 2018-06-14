package com.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@SuppressWarnings("serial")
@Entity
@Table(name="OrderDetail")
public class OrderDetail implements Serializable{
	private String detailid;//订单详情id
	private FOrder fOrder;//订单
	private Furniture furniture;//家具
	private Integer quantity;//购买数量
	private Double allmoney;//商品价格
	

	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getDetailid() {
		return detailid;
	}
	public void setDetailid(String detailid) {
		this.detailid = detailid;
	}
	@ManyToOne
	@JoinColumn(name="orderid",referencedColumnName="orderid")
	public FOrder getfOrder() {
		return fOrder;
	}

	public void setfOrder(FOrder fOrder) {
		this.fOrder = fOrder;
	}

	public Integer getQuantity() {
		return quantity;
	}
	

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(Double allmoney) {
		this.allmoney = allmoney;
	}
	
	@ManyToOne 
	@JoinColumn(name = "fid", referencedColumnName = "fid")
	public Furniture getFurniture() {
		return furniture;
	}
	public void setFurniture(Furniture furniture) {
		this.furniture = furniture;
	}
	public OrderDetail() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public OrderDetail(String detailid, FOrder fOrder, Furniture furniture, Integer quantity, Double allmoney) {
		super();
		this.detailid = detailid;
		this.fOrder = fOrder;
		this.furniture = furniture;
		this.quantity = quantity;
		this.allmoney = allmoney;
	}

	@Override
	public String toString() {
		return "OrderDetail [detailid=" + detailid + ", furniture=" + furniture + ", quantity="
				+ quantity + ", allmoney=" + allmoney + "]";
	}

}
