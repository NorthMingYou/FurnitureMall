package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="admin")
public class Admin {
	private String adminid;//用户id
	private String adminname;//用户名
	private String password;//登录密码 
	
	public Admin() {
		// TODO Auto-generated constructor stub
		super();
	}
	public Admin(String adminid,String adminname,String gender,String password,String phone,String address,String money,String headpic) {
		super();
		this.adminid=adminid;
		this.adminname=adminname;
		this.password=password;
	}
	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	
	@Column(length = 32, nullable = true)
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	
	@Column(length = 32, nullable = true)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return "";
	}
	
	
}
