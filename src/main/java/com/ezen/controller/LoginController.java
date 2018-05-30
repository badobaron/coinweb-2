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

	/* �α��� ó�� - login_controller.jsp ������ ������ ���� */
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login_check(MemberVO vo, HttpSession session,HttpServletRequest request,
			Model model,HttpServletResponse response)throws Exception{
		response.setContentType("text/html; charset=UTF-8");  
		request.setCharacterEncoding("utf-8");                        
		PrintWriter writer = response.getWriter(); 
		
		ModelAndView mv = new ModelAndView();
		
		//DB����
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = dao.getLoginResult(vo);
		
		//������ 
		if(result != 0){	
			/* ������������� ȣ��Ǵ� ��ü�� ���ǿ� �߰��Ͽ� ���!! */
			vo = dao.getResultVO(vo.getEmail());
			session.setAttribute("sid", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			mv.setViewName("index");
		}else{
			mv.setViewName("index");
			writer.println("<script>");
			writer.println("alert('�̸��� Ȥ�� ��й�ȣ�� Ȯ���ϼ���.'); location.href='index.do';");        
		    writer.println("</script>");
		    writer.flush();
		}
				
		return mv;
	}
		
	/* �α׾ƿ� */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session){
		int sid = 0;
		sid = (Integer) session.getAttribute("sid");

    	if(sid != 0)
    		session.invalidate();
		
		return "index";
	}
	
	/*��й�ȣ ���� ���̵� ��й�ȣ ��*/
	@RequestMapping(value="/password_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String pw_check(String email, String pass ,HttpSession session){
		
		int id = ((Integer) session.getAttribute("sid"));
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result =dao.getLoginCheckResult(email,pass, id);		
			
		return String.valueOf(result);
		
	}
	
	/*��й�ȣ ��������*/
	@RequestMapping(value="/password_update_c.do")
	public String password_update_c(MemberVO vo, HttpSession session,HttpServletRequest request,
			Model model,HttpServletResponse response)throws Exception{
		response.setContentType("text/html; charset=UTF-8");  
		request.setCharacterEncoding("utf-8");                        
		PrintWriter writer = response.getWriter(); 
		String page = "";		
	
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		int result = 0;
		System.out.println("������ �̸���="+vo.getEmail());
		System.out.println("������ ���="+vo.getPass());
		result = dao.getPassWordChangeResult(vo);
	
		
		if(result==1){
			page="index";
			writer.println("<script type='text/javascript'>");                    
			writer.println("alert('���������� ����Ǿ����ϴ�.'); location.href='index.do';");        
			writer.println("</script>");
			writer.flush();
		}
		
		return page;
	}
		
}








