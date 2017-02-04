package com.study.groupware.vo;

import java.util.Date;

public class BoardVO {
	
	private String ntc_sq;
	private String ntc_nm;
	private String ntc_cnt;
	private String stf_sq;
	private String stf_nm;
	private Date ntc_dt;
	private String ntc_hits;
	private int ntc_div_sq;
	private String ntc_div_nm;
	public String getNtc_sq() {
		return ntc_sq;
	}
	public void setNtc_sq(String ntc_sq) {
		this.ntc_sq = ntc_sq;
	}
	public String getNtc_nm() {
		return ntc_nm;
	}
	public void setNtc_nm(String ntc_nm) {
		this.ntc_nm = ntc_nm;
	}
	public String getNtc_cnt() {
		return ntc_cnt;
	}
	public void setNtc_cnt(String ntc_cnt) {
		this.ntc_cnt = ntc_cnt;
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
	public Date getNtc_dt() {
		return ntc_dt;
	}
	public void setNtc_dt(Date ntc_dt) {
		this.ntc_dt = ntc_dt;
	}
	public String getNtc_hits() {
		return ntc_hits;
	}
	public void setNtc_hits(String ntc_hits) {
		this.ntc_hits = ntc_hits;
	}
	public int getNtc_div_sq() {
		return ntc_div_sq;
	}
	public void setNtc_div_sq(int ntc_div_sq) {
		this.ntc_div_sq = ntc_div_sq;
	}
	public String getNtc_div_nm() {
		return ntc_div_nm;
	}
	public void setNtc_div_nm(String ntc_div_nm) {
		this.ntc_div_nm = ntc_div_nm;
	}
	@Override
	public String toString() {
		return "BoardVO [ntc_sq=" + ntc_sq + ", ntc_nm=" + ntc_nm + ", ntc_cnt=" + ntc_cnt + ", stf_sq=" + stf_sq
				+ ", stf_nm=" + stf_nm + ", ntc_dt=" + ntc_dt + ", ntc_hits=" + ntc_hits + ", ntc_div_sq=" + ntc_div_sq
				+ ", ntc_div_nm=" + ntc_div_nm + "]";
	}
	

}
