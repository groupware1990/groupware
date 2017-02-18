package com.study.groupware.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import com.study.groupware.dao.ScheduleDAO;
import com.study.groupware.service.ScheduleService;
import com.study.groupware.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

  @Inject
  private ScheduleDAO dao;

  
  @Transactional
  @Override
  public void regist(ScheduleVO schedule) throws Exception {
    dao.create(schedule);
    }   
  
  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public ScheduleVO read(Map param) throws Exception {
    return dao.read(param);
  }

  @Transactional
  @Override
  public void modify(ScheduleVO schedule) throws Exception {
	  dao.update(schedule); 
    }
  
  @Transactional
  @Override
  public void remove(int bs_scd_sq) throws Exception {
    dao.delete(bs_scd_sq);
  } 

  @Override
  public List<ScheduleVO> listAll(int scd_sq) throws Exception {
    return dao.listAll(scd_sq);
  }

  @Override                                                                                                     
	public List<ScheduleVO> sclist() throws Exception{
		return dao.sclist();
	}



}