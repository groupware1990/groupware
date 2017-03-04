package com.study.groupware.controller;

import java.net.InetAddress;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.EmailService;
import com.study.groupware.vo.EmailVO;

@Controller
@RequestMapping("/email/*")
public class EmailController {

	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Inject
	private EmailService service;

	@RequestMapping(value = "/sndList", method = RequestMethod.GET)
	public void sndListAll(Model model,int stf_snd_sq) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		model.addAttribute("sndList",service.sndListAll(stf_snd_sq));
	}
	@RequestMapping(value = "/rcvList", method = RequestMethod.GET)
	public void rcvListAll(Model model,int stf_rcv_sq) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		model.addAttribute("rcvList",service.rcvListAll(stf_rcv_sq));

	}

	@RequestMapping(value = "/keepList", method = RequestMethod.GET)
	public void keepListAll(Model model,int stf_rcv_sq) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		model.addAttribute("keepList",service.keepListAll(stf_rcv_sq));

	}


	@ResponseBody
	@RequestMapping(value = "/emailRead", method = RequestMethod.POST)
	public EmailVO emailRead(@RequestBody Map<String, Object> param)throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		EmailVO vo = service.read(param);
		
		System.out.println("=================================================================" + vo.getRcv_dt());
		
		
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return vo;

	}

	@ResponseBody
	@RequestMapping(value = "/emailRemove", method = RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody Map<String, Object> param) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		ResponseEntity<String> entity = null;

		service.remove(param);
		entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return entity;

	}

	@ResponseBody
	@RequestMapping(value = "/emailKeep", method = RequestMethod.POST)
	public ResponseEntity<String> emailKeep(@RequestBody Map<String, Object> param) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		ResponseEntity<String> entity = null;
		service.modify(param);

		entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]"); 
		return entity;


	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info("regist get ...........");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(EmailVO email, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info("regist post ...........");
		logger.info(email.toString());

		service.regist(email);
		service.regist2(email);
		service.regist3(email);
		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/email/rcvList?stf_rcv_sq=1";
	}


}
