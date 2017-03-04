package com.study.groupware.controller;

import java.net.InetAddress;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.ApprovalService;
import com.study.groupware.vo.ApprovalVO;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Inject
	private ApprovalService service;

	@RequestMapping(value = "/approvalList", method = RequestMethod.GET)
	public void listAll(@RequestParam int div_apv_sq, Model model) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());

		model.addAttribute("approvalList", service.listAll(div_apv_sq));  //model 을 이용해서 모든 게시물을 jsp로 전송
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}


	@ResponseBody
	@RequestMapping(value = "/approvalRead", method = {RequestMethod.POST})
	public ApprovalVO approvalRead(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {



		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		ApprovalVO vo = service.read(param);


		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return vo;
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("apv_sq") String apv_sq, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		service.remove(apv_sq);


		rttr.addFlashAttribute("msg", "SUCCESS");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/approval/approvalList?div_apv_sq=1";
	}

	@ResponseBody
	@RequestMapping(value = "/approvalOk", method = RequestMethod.POST)
	public ResponseEntity<String> modifyPagingPOST(@RequestBody Map<String, Object> param) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		ResponseEntity<String> entity = null;
		ApprovalVO vo = service.modify(param);

		entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return entity;
	}
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(Model model) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		logger.info("regist get ...........");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(ApprovalVO approval, RedirectAttributes rttr) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		logger.info("regist post ...........");
		logger.info(approval.toString());

		service.regist(approval);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/approval/approvalList?div_apv_sq=1";
	}
}
