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

import com.study.groupware.service.BoardService;
import com.study.groupware.vo.BoardVO;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

	@Inject
	private BoardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(@RequestParam int ntc_div_sq, Model model) throws Exception {


		logger.info(toString());

		model.addAttribute("list", service.listAll(ntc_div_sq));  //model 을 이용해서 모든 게시물을 jsp로 전송

	}


	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("ntc_sq") String ntc_sq , Model model)
			throws Exception {

		model.addAttribute(service.read(ntc_sq));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("ntc_sq") String ntc_sq, RedirectAttributes rttr) throws Exception {

		service.remove(ntc_sq);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(String ntc_sq, Model model) throws Exception {

		model.addAttribute(service.read(ntc_sq));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info(toString());
		service.modify(board);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info(rttr.toString());

		return "redirect:/sboard/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {

		logger.info("regist get ...........");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());

		service.regist(board);

		rttr.addFlashAttribute("msg", "SUCCESS");


		return "redirect:/sboard/list?ntc_div_sq=1";
	}







}
