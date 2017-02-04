package com.study.groupware.serviceimpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.study.groupware.dao.BoardDAO;
import com.study.groupware.service.BoardService;
import com.study.groupware.vo.BoardVO;
import com.study.groupware.vo.Criteria;
import com.study.groupware.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

  @Inject
  private BoardDAO dao;

  
  @Transactional
  @Override
  public void regist(BoardVO board) throws Exception {
  
    dao.create(board);

    }   
  

  @Transactional(isolation=Isolation.READ_COMMITTED)
  @Override
  public BoardVO read(String ntc_sq) throws Exception {
    dao.updateViewCnt(ntc_sq);
    return dao.read(ntc_sq);
  }


  @Transactional
  @Override
  public void modify(BoardVO board) throws Exception {
	  dao.update(board);
   
    }
  
  @Transactional
  @Override
  public void remove(String ntc_sq) throws Exception {
    dao.delete(ntc_sq);
  } 

  @Override
  public List<BoardVO> listAll(int ntc_div_sq) throws Exception {
    return dao.listAll(ntc_div_sq);
  }

  
  


}
