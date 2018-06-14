package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="ShopCartDetail")
public class ShopCartDetail {
	private String ShortCartDetailId;
	private Shopcart shopcart;
	private Furniture furniture;//家具
	private Integer quantity;//购买车对应商品数量
	private Double totalprice;//总额
	private String adddate;//添加日期
	
	
	public ShopCartDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ShopCartDetail(String shortCartDetailId, Shopcart shopcart, Furniture furniture, Integer quantity,
			Double totalprice, String adddate) {
		super();
		ShortCartDetailId = shortCartDetailId;
		this.shopcart = shopcart;
		this.furniture = furniture;
		this.quantity = quantity;
		this.totalprice = totalprice;
		this.adddate = adddate;
	}
	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getShortCartDetailsId() {
		return ShortCartDetailId;
	}
	public void setShortCartDetailsId(String shortCartDetailsId) {
		ShortCartDetailId = shortCartDetailsId;
	}
	
	
	@ManyToOne
	@JoinColumn(name="scid",referencedColumnName="scid")
	public Shopcart getShopcart() {
		return shopcart;
	}
	public void setShopcart(Shopcart shopcart) {
		this.shopcart = shopcart;
	}
	@ManyToOne
	@JoinColumn(name="fid",referencedColumnName="fid")
	public Furniture getFurniture() {
		return furniture;
	}
	public void setFurniture(Furniture furniture) {
		this.furniture = furniture;
	}
	
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
	public Double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}
	
	
	public String getAdddate() {
		return adddate;
	}
	public void setAdddate(String adddate) {
		this.adddate = adddate;
	}
	
	
	@Override
	public String toString() {
		return "ShortCartDetails [ShortCartDetailsId=" + ShortCartDetailId + ", shopcart=" + shopcart + ", furniture="
				+ furniture + ", quantity=" + quantity + ", totalprice=" + totalprice + ", adddate=" + adddate + "]";
	}
	
	
}
