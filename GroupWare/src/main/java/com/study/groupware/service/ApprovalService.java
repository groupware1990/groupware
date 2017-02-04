package com.study.groupware.service;

import java.util.List;

import com.study.groupware.vo.ApprovalVO;

public interface ApprovalService {

	  public void regist(ApprovalVO Approval) throws Exception;

	  public ApprovalVO read(String apv_sq) throws Exception;

	  public void modify(ApprovalVO Approval) throws Exception;

	  public void remove(String apv_sq) throws Exception;

	  public List<ApprovalVO> listAll(String div_apv_sq) throws Exception;

	
}
