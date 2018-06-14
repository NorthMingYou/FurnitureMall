package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="post")
public class Post {
	private String postid;//快递id
	private String postno;//快递编号
	private String orderid;//订单编号
	private String posttype;//快递类型
	private Double postfee;//快递费用
	private String deliveraddress;//发货地址
	private String receiptaddress;//收货地址
	private String deliverstate;//发货状态（是/否）
	private String receiptstate;//收货状态（是/否）
	public Post() {
		// TODO Auto-generated constructor stub
		super();
	}
	public Post(String postid,String postno,String orderid,String posttype,Double postfee,String deliveraddress,String receiptaddress,String deliverstate,String receiptstate) {
		super();
		this.postid=postid;
		this.postno=postno;
		this.orderid=orderid;
		this.posttype=posttype;
		this.postfee=postfee;
		this.deliveraddress=deliveraddress;
		this.receiptaddress=receiptaddress;
		this.deliverstate=deliverstate;
		this.receiptaddress=receiptaddress;
	}
	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	
	@Column(length = 32)
	public String getPostno() {
		return postno;
	}
	public void setPostno(String postno) {
		this.postno = postno;
	}
	
	@Column(length = 32)
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	@Column(length = 32)
	public String getPosttype() {
		return posttype;
	}
	public void setPosttype(String posttype) {
		this.posttype = posttype;
	}
	
	public Double getPostfee() {
		return postfee;
	}
	public void setPostfee(Double postfee) {
		this.postfee = postfee;
	}
	
	public String getDeliveraddress() {
		return deliveraddress;
	}
	public void setDeliveraddress(String deliveraddress) {
		this.deliveraddress = deliveraddress;
	}
	public String getReceiptaddress() {
		return receiptaddress;
	}
	public void setReceiptaddress(String receiptaddress) {
		this.receiptaddress = receiptaddress;
	}
	
	@Column(length = 32)
	public String getDeliverstate() {
		return deliverstate;
	}
	public void setDeliverstate(String deliverstate) {
		this.deliverstate = deliverstate;
	}
	
	@Column(length = 32)
	public String getReceiptstate() {
		return receiptstate;
	}
	public void setReceiptstate(String receiptstate) {
		this.receiptstate = receiptstate;
	}
	
}
