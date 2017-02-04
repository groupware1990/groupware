package com.study.groupware.controller;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.groupware.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminService service;

	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST})
	public void index(HttpServletRequest request) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}
	
	@RequestMapping(value = "/officerList", method = { RequestMethod.GET, RequestMethod.POST})
	public void officerList(HttpServletRequest request, Model model) throws Exception {

		logger.info("-------------start officerList [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		List officerList = new ArrayList<HashMap<String, Object>>();
		Map officerListCount = new HashMap<String, Object>();
		Map params = new HashMap<String, Object>();
		List selectAdmn_Tb = new ArrayList<HashMap<String, Object>>();
		List selectRnk_Tb = new ArrayList<HashMap<String, Object>>();
		List selectDpt_Div_Tb = new ArrayList<HashMap<String, Object>>();
		
		try {
			
			officerList = service.officerList(params);
			officerListCount = service.officerListCount(params);
			selectAdmn_Tb = service.selectAdmn_Tb();
			selectRnk_Tb = service.selectRnk_Tb();
			selectDpt_Div_Tb = service.selectDpt_Div_Tb();
			
			model.addAttribute("officerList", officerList);
			model.addAttribute("officerListCount", officerListCount);
			model.addAttribute("selectAdmn_Tb", selectAdmn_Tb);
			model.addAttribute("selectRnk_Tb", selectRnk_Tb);
			model.addAttribute("selectDpt_Div_Tb", selectDpt_Div_Tb);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end officerList [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

	}
	
	@ResponseBody
	@RequestMapping(value = "/officerListSearch", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> officerListSearch(@RequestBody Map<String, Object> params, HttpServletRequest request) throws Exception {

		logger.info("-------------start officerListSearch [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		Map<String, Object> result = new HashMap<String, Object>();
		List officerList = new ArrayList<HashMap<String, Object>>();
		Map<String, Object> officerListCount = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("================================================================================="+params);
		
		try {
			
			officerList = service.officerList(params);
			officerListCount = service.officerListCount(params);
			map.put("officerList", officerList);
			map.put("officerListCount", officerListCount);
			
			result.putAll(map);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end officerListSearch [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/console", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> test(@RequestBody Map<String, Object> param) throws Exception {

		logger.info("-------------start console");

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			/*
			List contents = service.test(param);

			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("contents", contents);
			
			result.putAll(map);
			 */

		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("----------------end console");
		
		return result;
	}
}
