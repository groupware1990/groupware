package com.study.groupware.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.ScheduleService;
import com.study.groupware.vo.ScheduleVO;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

  private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

  @Inject
  private ScheduleService service;

  @RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
  public void listAll(@RequestParam int scd_sq, Model model) throws Exception {

    logger.info(toString());

    model.addAttribute("scheduleList", service.listAll(scd_sq));  //model 을 이용해서 모든 게시물을 jsp로 전송
    
  }
  

  @RequestMapping(value = "/read", method = RequestMethod.POST)
  public ScheduleVO read(@RequestBody Map<String, Object> param)throws Exception {

	  ScheduleVO vo = service.read(param);
	  return vo;
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bs_scd_sq") int bs_scd_sq, RedirectAttributes rttr) throws Exception {

    service.remove(bs_scd_sq);


    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/schedule/scheduleList?scd_sq=1";
  }

  /*@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bs_scd_sq, Model model) throws Exception {

    model.addAttribute(service.read(bs_scd_sq));
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(ScheduleVO schedule, RedirectAttributes rttr) throws Exception {

    logger.info(toString());
    service.modify(schedule);
    
    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/schedule/scheduleList?scd_sq=1";
  }*/

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public void registGET(Model model) throws Exception {

    logger.info("regist get ...........");
    
    model.addAttribute("sclist", service.sclist());
  }

  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registPOST(ScheduleVO schedule, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(schedule.toString());

    service.regist(schedule);

    rttr.addFlashAttribute("msg", "SUCCESS");
   

    return "redirect:/schedule/scheduleList?scd_sq=1";
  }







}
