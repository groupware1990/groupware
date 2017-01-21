package com.study.groupware.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.groupware.service.TestService;

@Controller
@RequestMapping("/officer/*")
public class OfficerController {

	private static final Logger logger = LoggerFactory.getLogger(OfficerController.class);

	@Inject
	private TestService service;

	@RequestMapping(value = "/list", method = { RequestMethod.GET, RequestMethod.POST})
	public void list() throws Exception {

		logger.info("-------------start list");

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {


		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("----------------end list");
	}
	
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
}
