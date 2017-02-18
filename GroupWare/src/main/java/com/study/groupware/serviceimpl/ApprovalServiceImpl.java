package com.study.groupware.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.study.groupware.dao.ApprovalDAO;
import com.study.groupware.service.ApprovalService;
import com.study.groupware.vo.ApprovalVO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

  @Inject
  private ApprovalDAO dao;

  
  @Transactional
  @Override
  public void regist(ApprovalVO approval) throws Exception {
  
    dao.create(approval);

    }   
  

  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public ApprovalVO read(Map param) throws Exception {
    
    return dao.read(param);
  }


  @Transactional
  @Override
  public void modify(ApprovalVO approval) throws Exception {
	  dao.update(approval);
   
    }
  
  @Transactional
  @Override
  public void remove(String apv_sq) throws Exception {
    dao.delete(apv_sq);
  } 

  @Override
  public List<ApprovalVO> listAll(int div_apv_sq) throws Exception {
    return dao.listAll(div_apv_sq);
  }


  @Override
	public List<ApprovalVO> aplist() throws Exception
	{
		return dao.aplist();
	}
  
  


}
