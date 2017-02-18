package com.study.groupware.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.groupware.service.NtcReplyService;
import com.study.groupware.vo.NtcReplyVO;

@RestController
@RequestMapping("/ntcReplies")
public class NtcReplyController {
	
	 private static final Logger logger = LoggerFactory.getLogger(NtcReplyController.class);
	
	@Inject
	private NtcReplyService service;
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public NtcReplyVO register(@RequestBody Map<String, Object> param) throws Exception{
		
		
		
		NtcReplyVO vo =	service.addReply(param);
			return vo;
	}

	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public NtcReplyVO update(@RequestBody Map<String, Object> param) throws Exception{
		
		NtcReplyVO vo =	service.modifyReply(param);
			return vo;
	}
	
	
	
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public void delete(@RequestBody Map<String, Object> param) throws Exception{
		
		service.removeReply(param);
			
	}
	
	
	
	
	
	

	}
