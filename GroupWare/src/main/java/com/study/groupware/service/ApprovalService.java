package com.study.groupware.service;

import java.util.List;
import java.util.Map;

import com.study.groupware.vo.ApprovalVO;

public interface ApprovalService {

	  public void regist(ApprovalVO Approval) throws Exception;

	  public ApprovalVO read(Map param) throws Exception;

	  public ApprovalVO modify(Map param) throws Exception;

	  public void remove(String apv_sq) throws Exception;

	  public List<ApprovalVO> listAll(int div_apv_sq) throws Exception;

	
	
}
