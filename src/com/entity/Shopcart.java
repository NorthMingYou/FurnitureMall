package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="shopcart")
public class Shopcart {
	private String scid;//购物车id
	private User user;//对应用户
	private Furniture furniture;//家具
	private Integer quantity;//购买车对应商品数量
	private Double totalprice;//总额
	private String adddate;//添加日期
	
	public Shopcart() {
		// TODO Auto-generated constructor stub
		super();
	}

	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getScid() {
		return scid;
	}
	public void setScid(String scid) {
		this.scid = scid;
	}
	
	

	@OneToOne
	@JoinColumn(name="userid",referencedColumnName="userid")
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
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

	
	
}
