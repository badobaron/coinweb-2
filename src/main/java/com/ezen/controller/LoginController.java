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
import coinweb.vo.MemberVO;

@Controller
public class LoginController {
	@Autowired
	SqlSessionTemplate sqlSession;

	/* 로그인 처리 - login_controller.jsp 파일의 역할을 수행 */
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login_check(MemberVO vo, HttpSession session,HttpServletRequest request,
			Model model,HttpServletResponse response)throws Exception{
		response.setContentType("text/html; charset=UTF-8");  
		request.setCharacterEncoding("utf-8");                        
		PrintWriter writer = response.getWriter(); 
		
		ModelAndView mv = new ModelAndView();
		
		//DB연동
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getLoginResult(vo);
		
		//실행결과 
		if(result != 0){	
			/* 모든페이지에서 호출되는 객체는 세션에 추가하여 사용!! */
			vo = dao.getResultVO(vo.getEmail());
			session.setAttribute("sid", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			mv.setViewName("redirect:/index.do");
		}else{
			mv.setViewName("index");
			writer.println("<script>");
			writer.println("alert('이메일 혹은 비밀번호를 확인하세요.'); location.href='index.do';");        
		    writer.println("</script>");
		    writer.flush();
		}
				
		return mv;
	}
		
	/* 로그아웃 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session){
		int sid = 0;
		sid = (Integer) session.getAttribute("sid");

    	if(sid != 0)
    		session.invalidate();
		
		return "redirect:/index.do";
	}
	
	/*비밀번호 변경 아이디 비밀번호 비교*/
	@RequestMapping(value="/password_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String pw_check(String email, String pass ,HttpSession session){
		
		int id = ((Integer) session.getAttribute("sid"));
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result =dao.getLoginCheckResult(email,pass, id);		
			
		return String.valueOf(result);
		
	}
	
	/*비밀번호 변경진행*/
	@RequestMapping(value="/password_update_c.do")
	public String password_update_c(MemberVO vo, HttpSession session,HttpServletRequest request,
			Model model,HttpServletResponse response)throws Exception{
		response.setContentType("text/html; charset=UTF-8");  
		request.setCharacterEncoding("utf-8");                        
		PrintWriter writer = response.getWriter(); 
		String page = "";		
	
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = 0;
		System.out.println("변경할 이메일="+vo.getEmail());
		System.out.println("변경할 비번="+vo.getPass());
		result = dao.getPassWordChangeResult(vo);
	
		
		if(result==1){
			page="index";
			writer.println("<script type='text/javascript'>");                    
			writer.println("alert('성공적으로 변경되었습니다.'); location.href='index.do';");        
			writer.println("</script>");
			writer.flush();
		}
		
		return page;
	}
		
}








