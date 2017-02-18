package com.study.groupware.serviceimpl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.study.groupware.dao.EmailDAO;
import com.study.groupware.service.EmailService;
import com.study.groupware.vo.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {

  @Inject
  private EmailDAO dao;

  
  @Transactional
  @Override
  public void regist(EmailVO email) throws Exception {
    dao.create(email);
    }   
  
  @Transactional
  @Override
  public void regist2(EmailVO email) throws Exception {
    dao.create2(email);
    }   
  
  @Transactional
  @Override
  public void regist3(EmailVO email) throws Exception {
    dao.create3(email);
    }  
  

  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public EmailVO read(Map param) throws Exception {
    return dao.read(param);
  }

  @Transactional
  @Override
  public void modify(Map param) throws Exception {
	 dao.update(param);
   
    }
  
  @Transactional
  @Override
  public void remove(Map param) throws Exception {
     dao.delete(param);
	
  } 

  @Override
  public List<EmailVO> sndListAll(int stf_snd_sq) throws Exception {
    return dao.sndListAll(stf_snd_sq);
  }
  
  @Override
  public List<EmailVO> rcvListAll(int stf_rcv_sq) throws Exception {
    return dao.rcvListAll(stf_rcv_sq);
  }


  @Override
  public List<EmailVO> keepListAll(int stf_rcv_sq) throws Exception {
    return dao.keepListAll(stf_rcv_sq);
  }

 
}
