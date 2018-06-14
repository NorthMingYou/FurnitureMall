package com.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

@SuppressWarnings("serial")
@Entity
@Table(name = "FOrder")
public class FOrder implements Serializable{
	private String orderid;// 订单id
	private User user;
	private String remark;// 备注
	private Double totalprice;// 总额
	private String buydate;// 购买日期
	private String receiptaddress;// 收货地址
	private String receiptPeople;// 收货人
	private String receiptTel;// 联系电话
	private Integer state;// 订单状态		1已支付（待发货）   0未支付   2代表已发货  3代表已签收
	private String cancel;// 是否退单
	private Integer validity;// 是否有效
	private Set<OrderDetail> orderDetails;

	public FOrder() {
		// TODO Auto-generated constructor stub
		super();
	}

	

	@Override
	public String toString() {
		return "FOrder [orderid=" + orderid + ", user=" + user + ", remark=" + remark + ", totalprice=" + totalprice
				+ ", buydate=" + buydate + ", receiptaddress=" + receiptaddress + ", receiptPeople=" + receiptPeople
				+ ", receiptTel=" + receiptTel + ", state=" + state + ", cancel=" + cancel + ", validity=" + validity
				+ ", orderDetails=" + orderDetails + "]";
	}



	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}

	public String getBuydate() {
		return buydate;
	}

	@ManyToOne
	@JoinColumn(name = "userid", referencedColumnName = "userid")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	@Column(length = 32)
	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getReceiptaddress() {
		return receiptaddress;
	}

	public void setReceiptaddress(String receiptaddress) {
		this.receiptaddress = receiptaddress;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getValidity() {
		return validity;
	}

	public void setValidity(Integer validity) {
		this.validity = validity;
	}

	@OneToMany(mappedBy = "fOrder", fetch = FetchType.LAZY)
	@Cascade(value = { org.hibernate.annotations.CascadeType.ALL })
	@JsonIgnore
	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public String getReceiptPeople() {
		return receiptPeople;
	}

	public void setReceiptPeople(String receiptPeople) {
		this.receiptPeople = receiptPeople;
	}

	public String getReceiptTel() {
		return receiptTel;
	}

	public void setReceiptTel(String receiptTel) {
		this.receiptTel = receiptTel;
	}

}
