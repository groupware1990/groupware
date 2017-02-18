package com.study.groupware.dao;

import java.util.List;
import java.util.Map;

import com.study.groupware.vo.ScheduleVO;

public interface ScheduleDAO {
	
	 public void create(ScheduleVO vo) throws Exception;

	  public ScheduleVO read(Map param) throws Exception;

	  public void update(ScheduleVO vo) throws Exception;

	  public void delete(int bs_scd_sq) throws Exception;

	  public List<ScheduleVO> listAll(int scd_sq) throws Exception;

	  public List<ScheduleVO> sclist() throws Exception; 

	
}
