package com.ezen.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.MemberDAO;
import coinweb.dao.WalletDAO;
import coinweb.vo.MemberVO;

@Controller
public class JoinController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView login_check(MemberVO vo, HttpSession session, HttpServletRequest request,
			Model model,HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");  
	    request.setCharacterEncoding("utf-8");                        
	    PrintWriter writer = response.getWriter(); 
		
		//DB연동
		MemberDAO m_dao = sqlSession.getMapper(MemberDAO.class);
		WalletDAO w_dao = sqlSession.getMapper(WalletDAO.class);
		//dao.getStatement();

		int result = m_dao.getInsertResult(vo);
		vo = m_dao.getJoinIdResult(vo);

		if(result == 1){
			w_dao.getInsertResult(vo.getId());
			mv.setViewName("index");
			writer.println("<script type='text/javascript'>");                    
		    writer.println("alert('회원가입에 성공하셨습니다.'); location.href='index.do';");        
		    writer.println("</script>");
		    writer.flush();
		}
		
		return mv;
	}
	
	@RequestMapping(value="id_check.do", method=RequestMethod.POST)
	@ResponseBody
	public String id_check(String email){
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getIdCheckResult(email);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="name_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String name_check(String name){
		
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getNameCheckResult(name);
		
		return String.valueOf(result);
	}
	
}
