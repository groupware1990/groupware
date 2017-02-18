package com.study.groupware.service;

import java.util.List;
import java.util.Map;

import com.study.groupware.vo.ScheduleVO;

public interface ScheduleService {
	
	  public void regist(ScheduleVO schedule) throws Exception;

	  public ScheduleVO read(Map param) throws Exception;

	  public void modify(ScheduleVO schedule) throws Exception;

	  public void remove(int bs_scd_sq) throws Exception;

	  public List<ScheduleVO> listAll(int scd_sq) throws Exception;
	  
	  public List<ScheduleVO> sclist() throws Exception;


}
