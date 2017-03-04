package com.study.groupware.vo;

import java.util.Date;

public class DataVO {
	
	private int data_sq;
	private String data_nm;
	private String stf_sq;
	private String stf_nm;
	private String data_cnt;
	private String data_hits;
	private Date data_dt;
	private Date data_mod;
	private String data_crs;
	private String data_pl_nm;
	
	
	public int getData_sq() {
		return data_sq;
	}
	public void setData_sq(int data_sq) {
		this.data_sq = data_sq;
	}
	public String getData_nm() {
		return data_nm;
	}
	public void setData_nm(String data_nm) {
		this.data_nm = data_nm;
	}
	public String getStf_sq() {
		return stf_sq;
	}
	public void setStf_sq(String stf_sq) {
		this.stf_sq = stf_sq;
	}
	public String getStf_nm() {
		return stf_nm;
	}
	public void setStf_nm(String stf_nm) {
		this.stf_nm = stf_nm;
	}
	public String getData_cnt() {
		return data_cnt;
	}
	public void setData_cnt(String data_cnt) {
		this.data_cnt = data_cnt;
	}
	public String getData_hits() {
		return data_hits;
	}
	public void setData_hits(String data_hits) {
		this.data_hits = data_hits;
	}
	public Date getData_dt() {
		return data_dt;
	}
	public void setData_dt(Date data_dt) {
		this.data_dt = data_dt;
	}
	public Date getData_mod() {
		return data_mod;
	}
	public void setData_mod(Date data_mod) {
		this.data_mod = data_mod;
	}
	public String getData_crs() {
		return data_crs;
	}
	public void setData_crs(String data_crs) {
		this.data_crs = data_crs;
	}
	public String getData_pl_nm() {
		return data_pl_nm;
	}
	public void setData_pl_nm(String data_pl_nm) {
		this.data_pl_nm = data_pl_nm;
	}
	@Override
	public String toString() {
		return "DataVO [data_sq=" + data_sq + ", data_nm=" + data_nm + ", stf_sq=" + stf_sq + ", stf_nm=" + stf_nm
				+ ", data_cnt=" + data_cnt + ", data_hits=" + data_hits + ", data_dt=" + data_dt + ", data_mod="
				+ data_mod + ", data_crs=" + data_crs + ", data_pl_nm=" + data_pl_nm + "]";
	}
	
	
	
	
	
	
	
	

}
