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
@Table(name="furniture")
public class Furniture implements Serializable{
	private String fid;//家具id
	private String fname;//家具名
	private String ftype;//家具类型
	private String fstyle;//家具风格
	private String fsummary;//家具描述
	
	private Integer fnum;//家具数量
	
	private Double fprice;//家具单价
	private String fpic1;//家具图片1
	private String fpic2;//家具图片2
	private String fpic3;//家具图片3
	private String isdropoff;//是否下架
	//private Integer sales;//家具销售量
	
	private String date;	//添加商品的时间
	
	public Furniture() {
		// TODO Auto-generated constructor stub
		super();
	}
	public Furniture(Integer fnum,String fname,String ftype,String fstyle,String fsummary,Double fprice,String fpic1,String fpic2,String fpic3,String isdropoff) {
		super();
		this.fname=fname;
		this.ftype=ftype;
		this.fstyle=fstyle;
		this.fsummary=fsummary;
		this.fprice=fprice;
		this.fnum=fnum;
		this.fpic1=fpic1;
		this.fpic1=fpic2;
		this.fpic1=fpic3;
		this.isdropoff=isdropoff;
	}
	
	
	@Id
	@Column(length = 32, nullable = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	@Column(length = 32)
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	@Column(length = 32)
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	
	@Column(length = 32)
	public String getFstyle() {
		return fstyle;
	}
	public void setFstyle(String fstyle) {
		this.fstyle = fstyle;
	}
	
	@Column(length = 1000)
	public String getFsummary() {
		return fsummary;
	}
	public void setFsummary(String fsummary) {
		this.fsummary = fsummary;
	}
	
	
	public Double getFprice() {
		return fprice;
	}
	public void setFprice(Double fprice) {
		this.fprice = fprice;
	}
	
	public Integer getFnum() {
		return fnum;
	}
	public void setFnum(Integer fnum) {
		this.fnum = fnum;
	}
	@Column(length = 32)
	public String getFpic1() {
		return fpic1;
	}
	public void setFpic1(String fpic1) {
		this.fpic1 = fpic1;
	}
	
	@Column(length = 32)
	public String getFpic2() {
		return fpic2;
	}
	public void setFpic2(String fpic2) {
		this.fpic2 = fpic2;
	}
	
	@Column(length = 32)
	public String getFpic3() {
		return fpic3;
	}
	public void setFpic3(String fpic3) {
		this.fpic3 = fpic3;
	}
	
	@Column(length = 32)
	public String getIsdropoff() {
		return isdropoff;
	}
	public void setIsdropoff(String isdropoff) {
		this.isdropoff = isdropoff;
	}
	
	@Column(length = 32)
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Furniture [fid=" + fid + ", fname=" + fname + ", ftype=" + ftype + ", fstyle=" + fstyle + ", fsummary="
				+ fsummary + ", fnum=" + fnum + ", fprice=" + fprice + ", fpic1=" + fpic1 + ", fpic2=" + fpic2
				+ ", fpic3=" + fpic3 + ", isdropoff=" + isdropoff + ", date=" + date + "]";
	}

	
}
