package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.MemberDAO;
import coinweb.vo.RankingVO;

@Controller
public class RankingController {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@RequestMapping(value="rangking.do", method=RequestMethod.GET)
	public ModelAndView ranking(){
		ModelAndView mv = new ModelAndView();
		MemberDAO dao =sqlSession.getMapper(coinweb.dao.MemberDAO.class);
		ArrayList<RankingVO> list = dao.getRankingList();
		
		
		mv.addObject("list",list);
	
		
		mv.setViewName("/rangking/rangking");
		
		return mv;
	}
}
