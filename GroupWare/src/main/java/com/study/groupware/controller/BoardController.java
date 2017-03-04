package com.study.groupware.controller;

import java.net.InetAddress;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.groupware.service.BoardService;
import com.study.groupware.service.NtcReplyService;
import com.study.groupware.util.Paging;
import com.study.groupware.vo.BoardVO;

@Controller
@RequestMapping("/sboard/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;
	
	@Inject
	private NtcReplyService service1;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listAll(HttpServletRequest request, @RequestParam int ntc_div_sq, Model model) throws Exception {

		logger.info("-------------start listAll [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
	
		
		  //model 을 이용해서 모든 게시물을 jsp로 전송

		// 페이징 처리 ========================================================================================================
		Paging paging = new Paging();

		// 총 게시물 수 
		int totalCnt = service.count(ntc_div_sq);

		// 현재 페이지 초기화
		int current_page = 1;

		// 만약 사용자로부터 페이지를 받아왔다면
		if (request.getParameter("page") != null) {
			current_page = Integer.parseInt((String)request.getParameter("page"));
		}
		
		String ntc_div = "ntc_div_sq="+ntc_div_sq;

		// jsp에 뿌릴 페이지 태그를 만들어서 보낸다.
		String pageIndexList = paging.pageIndexLista(totalCnt, current_page, ntc_div);

		// SQL 쿼리문에 넣을 조건문
		int startCount = (current_page - 1) * 10 + 1;
		int endCount = current_page * 10;

		BoardVO bvo = new BoardVO();
		bvo.setNtc_div_sq(ntc_div_sq);
		bvo.setStartCount(startCount);
		bvo.setEndCount(endCount);

		
		
		model.addAttribute("list", service.listAll(bvo));

		model.addAttribute("pageIndexList", pageIndexList);
		// ======================================================================================================== 페이징 처리

		
		logger.info("---------------end listAll [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		
	}


	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("ntc_sq") String ntc_sq , Model model)
			throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		model.addAttribute(service.read(ntc_sq));
		model.addAttribute("list", service1.listReply(ntc_sq));            //게시판 댓글 리스트 가져오기
		
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("ntc_sq") String ntc_sq, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		service.remove(ntc_sq);

		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		return "redirect:/sboard/list?ntc_div_sq=1";
		
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(String ntc_sq, Model model) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		model.addAttribute(service.read(ntc_sq));
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info(toString());
		
		service.modify(board);

		rttr.addFlashAttribute("msg", "SUCCESS");
		

		logger.info(rttr.toString());
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		return "redirect:/sboard/list?ntc_div_sq=1";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");

		logger.info("regist get ...........");
		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("-------------start index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		logger.info("regist post ...........");
		logger.info(board.toString());

		service.regist(board);

		rttr.addFlashAttribute("msg", "SUCCESS");

		logger.info("---------------end index [Connect IP : " + InetAddress.getLocalHost().getHostAddress() + "]");
		return "redirect:/sboard/list?ntc_div_sq=1";
		
	}







}
