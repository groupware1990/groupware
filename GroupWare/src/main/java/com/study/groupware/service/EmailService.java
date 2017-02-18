package com.study.groupware.service;

import java.util.List;
import java.util.Map;

import com.study.groupware.vo.EmailVO;

public interface EmailService {
	
  public void regist(EmailVO email) throws Exception;
  
  public void regist2(EmailVO email) throws Exception;
  
  public void regist3(EmailVO email) throws Exception;

  public EmailVO read(Map param) throws Exception;

  public void modify(Map param) throws Exception;

  public void remove(Map param) throws Exception;

  public List<EmailVO> sndListAll(int stf_snd_sq) throws Exception;
  
  public List<EmailVO> rcvListAll(int stf_rcv_sq) throws Exception;

  public List<EmailVO> keepListAll(int stf_rcv_sq) throws Exception;
 

}
