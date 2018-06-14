package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="user")
public class User {
	private String userid;//用户id
	private String username;//用户名
	private String gender;//性别
	private String password;//登录密码 
	private String phone;//联系电话
	private Double money;//余额
	private String headpic;//头像
	private String address;//联系地址
	private String email;
	private String QQ;
	private String paypassword;//登录密码 
	
	public User() {
		// TODO Auto-generated constructor stub
		super();
	}
	public User(String username,String gender,String password,String phone,String address,String email,String QQ,Double money,String headpic,String paypassword) {
		super();
		this.email=email;
		this.QQ=QQ;
		this.username=username;
		this.gender=gender;
		this.password=password;
		this.phone=phone;
		this.address=address;
		this.money=money;
		this.headpic=headpic;
		this.paypassword=paypassword;
	}
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Column(length = 32)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(length = 32)
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Column(length = 32)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(length = 32)
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	
	@Column(length = 32)
	public String getHeadpic() {
		return headpic;
	}
	public void setHeadpic(String headpic) {
		this.headpic = headpic;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQQ() {
		return QQ;
	}
	public void setQQ(String qQ) {
		QQ = qQ;
	}
	@Column(length = 32)
	public String getPaypassword() {
		return paypassword;
	}
	public void setPaypassword(String paypassword) {
		this.paypassword = paypassword;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", address=" + address + "]";
	}
	
}
