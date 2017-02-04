package com.study.groupware.dao;

import java.util.List;
import com.study.groupware.vo.ApprovalVO;

public interface ApprovalDAO {
	
	  public void create(ApprovalVO vo) throws Exception;

	  public ApprovalVO read(String apv_sq) throws Exception;

	  public void update(ApprovalVO vo) throws Exception;

	  public void delete(String apv_sq) throws Exception;

	  public List<ApprovalVO> listAll(String div_apv_sq) throws Exception;


}
