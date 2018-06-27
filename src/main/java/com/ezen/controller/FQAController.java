package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.bbsDAO;
import coinweb.vo.bbsVO;

@Controller
public class FQAController {
	@Autowired
	ServletContext context;
	@Autowired
	SqlSessionTemplate sqlSession;

	@RequestMapping(value = "bbs.do", method = RequestMethod.GET)
	public ModelAndView bbs(String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		int sid = 0;
	 	if (session.getAttribute("sid") != null)  {
	 		sid = ((Integer) session.getAttribute("sid")).intValue(); } else { sid = 0; }
		
		bbsDAO dao = sqlSession.getMapper(coinweb.dao.bbsDAO.class);
       int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount= dao.execTotalCount();
	    if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize;
		}
        if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize; 
			endCount = reqPage *pageSize;
			
		}else{
			startCount = 0;
			endCount = 10;
			rpage="1";
		}
		ArrayList<bbsVO> list = dao.getResultList(startCount, pageSize, sid);
		mv.addObject("list", list);
		mv.setViewName("/FQA/bbs");
		mv.addObject("list", list);
		mv.addObject("rpage", rpage);
		mv.addObject("dbCount", dbCount);
		return mv;
	}

	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String wirite() {
		return "/FQA/write";
	}
	
	@RequestMapping(value = "guide.do", method = RequestMethod.GET)
	public String guide() {
		return "/guide/guide";
	}

	// �ּ�����
	@RequestMapping(value = "FAQ.do", method = RequestMethod.GET)
	public String FAQ() {
		return "/guide/FAQ";
	}

	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public ModelAndView View(String bbsID) {
		ModelAndView mv = new ModelAndView();
		
		bbsDAO dao =sqlSession.getMapper(bbsDAO.class);
		bbsVO vo =dao.getResultVO(bbsID);
		
		mv.addObject("vo",vo);
		mv.setViewName("/FQA/view");	
		 return mv;
	}

	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public ModelAndView upDate (String bbsID) {
		ModelAndView mv = new ModelAndView();
		bbsDAO dao = sqlSession.getMapper(bbsDAO.class);
		
		bbsVO vo = dao.getResultVO(bbsID);
		mv.addObject("vo",vo);
		mv.setViewName("/FQA/update");

		return mv;
	}



	@RequestMapping(value="/updateAction.do", method=RequestMethod.POST)
	public String updateAction(bbsVO vo){
		
		bbsDAO dao = sqlSession.getMapper(bbsDAO.class);
		dao.getUpdateResult(vo);
		
		return "redirect:/bbs.do";
	}
	
	@RequestMapping(value = "/writeAction.do", method = RequestMethod.POST)
	public String writeA(bbsVO vo) {

		bbsDAO bbsdao = sqlSession.getMapper(bbsDAO.class);
		bbsdao.write(vo);

		return "redirect:/bbs.do";
	}

	 

	@RequestMapping(value = "/deleteAction.do", method = RequestMethod.GET)
	public String board_delete(String bbsID) {
		
		bbsDAO dao = sqlSession.getMapper(bbsDAO.class);
		dao.getDeleteResult(bbsID);
		return "redirect:/bbs.do";
		
	}

}
