package com.study.groupware.controller;

import java.net.InetAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST})
	public String loginForm() throws Exception {

		logger.info("-------------start loginForm [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		try {
			
		} catch(Exception e) {
			e.printStackTrace();
		}

		logger.info("---------------end loginForm [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		
		return "loginForm";
	}
	
	
}
