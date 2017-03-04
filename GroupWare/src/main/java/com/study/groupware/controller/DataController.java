package com.study.groupware.controller;

import java.net.InetAddress;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.DataReplyService;
import com.study.groupware.service.DataService;
import com.study.groupware.vo.DataVO;

@Controller
@RequestMapping("/data/*")
public class DataController {

	private static final Logger logger = LoggerFactory.getLogger(DataController.class);

	@Inject
	private DataService service;

	@Inject
	private DataReplyService service1;


	@RequestMapping(value = "/dataList", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		model.addAttribute("list",service.listAll());
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}


	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("data_sq") int data_sq , Model model)
			throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		model.addAttribute(service.read(data_sq));
		model.addAttribute("list", service1.listReply(data_sq));
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("data_sq") int data_sq, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		service.remove(data_sq);


		rttr.addFlashAttribute("msg", "SUCCESS");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/data/dataList";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int data_sq, Model model) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		System.out.println("dddddddddddddddddddddddddddddddddddd");
		System.out.println(data_sq);
		model.addAttribute(service.read(data_sq));
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(DataVO data, RedirectAttributes rttr) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		service.modify(data);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/data/dataList";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info("regist get ...........");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(DataVO data, RedirectAttributes rttr) throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info("regist post ...........");
		logger.info(data.toString());

		service.regist(data);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/data/dataList";
	}







}
