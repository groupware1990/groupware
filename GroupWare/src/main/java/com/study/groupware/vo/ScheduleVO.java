package com.study.groupware.vo;

public class ScheduleVO {

	private int bs_scd_sq;                  //일정테이블 키값
	private int scd_sq;                     //일정구분번호 키값
	private String scd_nm;
	private String stf_sq;
	private String stf_nm;
	private String bs_scd_nm;
	private String bs_scd_dt;
	private String bs_scd_tm;
	private String bs_scd_cnt;
	
	
	public int getBs_scd_sq() {
		return bs_scd_sq;
	}
	public void setBs_scd_sq(int bs_scd_sq) {
		this.bs_scd_sq = bs_scd_sq;
	}
	public int getScd_sq() {
		return scd_sq;
	}
	public void setScd_sq(int scd_sq) {
		this.scd_sq = scd_sq;
	}
	public String getScd_nm() {
		return scd_nm;
	}
	public void setScd_nm(String scd_nm) {
		this.scd_nm = scd_nm;
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
	public String getBs_scd_nm() {
		return bs_scd_nm;
	}
	public void setBs_scd_nm(String bs_scd_nm) {
		this.bs_scd_nm = bs_scd_nm;
	}
	public String getBs_scd_dt() {
		return bs_scd_dt;
	}
	public void setBs_scd_dt(String bs_scd_dt) {
		this.bs_scd_dt = bs_scd_dt;
	}
	public String getBs_scd_tm() {
		return bs_scd_tm;
	}
	public void setBs_scd_tm(String bs_scd_tm) {
		this.bs_scd_tm = bs_scd_tm;
	}
	public String getBs_scd_cnt() {
		return bs_scd_cnt;
	}
	public void setBs_scd_cnt(String bs_scd_cnt) {
		this.bs_scd_cnt = bs_scd_cnt;
	}
	@Override
	public String toString() {
		return "ScheduleVO [bs_scd_sq=" + bs_scd_sq + ", scd_sq=" + scd_sq + ", scd_nm=" + scd_nm + ", stf_sq=" + stf_sq
				+ ", stf_nm=" + stf_nm + ", bs_scd_nm=" + bs_scd_nm + ", bs_scd_dt=" + bs_scd_dt + ", bs_scd_tm="
				+ bs_scd_tm + ", bs_scd_cnt=" + bs_scd_cnt + "]";
	}
	
	
	
	
	
}
