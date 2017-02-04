package com.study.groupware.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.ApprovalService;
import com.study.groupware.vo.ApprovalVO;

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

  private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

  @Inject
  private ApprovalService service;

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listAll(@RequestParam String div_apv_sq, Model model) throws Exception {

	  
    logger.info(toString());

    model.addAttribute("list", service.listAll(div_apv_sq));  //model 을 이용해서 모든 게시물을 jsp로 전송

  }
  

  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public void read(@RequestParam("apv_sq") String apv_sq , Model model)
      throws Exception {

    model.addAttribute(service.read(apv_sq));
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("apv_sq") String apv_sq, RedirectAttributes rttr) throws Exception {

    service.remove(apv_sq);


    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sboard/list";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(String apv_sq, Model model) throws Exception {

    model.addAttribute(service.read(apv_sq));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(ApprovalVO approval, RedirectAttributes rttr) throws Exception {

    logger.info(toString());
    service.modify(approval);
    
    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/approval/list";
  }

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET() throws Exception {

    logger.info("regist get ...........");
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(ApprovalVO approval, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(approval.toString());

    service.regist(approval);

    rttr.addFlashAttribute("msg", "SUCCESS");
   

    return "redirect:/approval/list?ntc_div_sq=1";
  }







}
