package com.study.groupware.controller;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.groupware.service.AdminService;
import com.study.groupware.util.FileUpload;
import com.study.groupware.vo.OfficerVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		
	@Inject
	private AdminService service;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 관리자 페이지와 일반페이지를 나누려고 했으나 나눌 필요는 없는 것 같다.
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

	// 관리 - 구성원 관리 페이지
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
	
	// 관리 - 구성원 관리 - 검색 - 사원 목록 Ajax
	@ResponseBody
	@RequestMapping(value = "/officerListSearch", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> officerListSearch(@RequestBody Map<String, Object> params, HttpServletRequest request) throws Exception {

		logger.info("-------------start officerListSearch [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		Map<String, Object> result = new HashMap<String, Object>();
		List officerList = new ArrayList<HashMap<String, Object>>();
		Map<String, Object> officerListCount = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
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
	@RequestMapping(value = "/selectStf_Sq", method = { RequestMethod.GET, RequestMethod.POST})
	public int selectStf_Sq(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {

		logger.info("-------------start selectStf_Sq [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		System.out.println("==============================================================================" + params);
		
		int result = 0;
		
		try {
			result = service.selectStf_Sq(params);
		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end selectStf_Sq [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		return result;
	}
	
	// 관리 - 구성원 관리 - 구성원 추가 Ajax
	@ResponseBody
	@RequestMapping(value = "/officerInsert", method = { RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> officerInsert(MultipartHttpServletRequest request, MultipartFile file, OfficerVO vo, Model model) throws Exception {

		logger.info("-------------start officerInsert [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");	
	
		logger.info("originalName : " + file.getOriginalFilename());	// 파일명.확장자
		logger.info("size : " + file.getSize());						// 파일 용량(byte)
		logger.info("contentType : " + file.getContentType());			// 파일 종류
		
		FileUpload fileupload = new FileUpload();
		
		ResponseEntity<String> entity = null;

		try {
		
			String savedName = fileupload.uploadfile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			vo.setStf_pt_rt("/resources/img/" + savedName);
			vo.setStf_pt_nm(file.getOriginalFilename());
			
			service.officerInsert(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}

		logger.info("---------------end officerInsert [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		return entity;
	}
	
	
	
	
	/*
	@RequestMapping(value = "/boardList", method = { RequestMethod.GET, RequestMethod.POST})
	public void boardList(HttpServletRequest request, Model model) throws Exception {

		logger.info("-------------start boardList [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
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

		logger.info("---------------end boardList [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

	}
	*/
	
	/*
	@ResponseBody
	@RequestMapping(value = "/console", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> test(@RequestBody Map<String, Object> param) throws Exception {

		logger.info("-------------start console");

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			List contents = service.test(param);

			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("contents", contents);
			
			result.putAll(map);
			 

		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("----------------end console");
		
		return result;
	}
	*/
}
