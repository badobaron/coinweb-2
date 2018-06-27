package com.ezen.controller;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.MemberDAO;
import coinweb.vo.MemberVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MemberController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="member_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray memberList(){
		JSONArray jarray = new JSONArray();
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		ArrayList<MemberVO> list = dao.getResultList();
		
		for(MemberVO vo: list){
			JSONObject obj = new JSONObject();
			obj.put("id", vo.getId());
			obj.put("email", vo.getEmail());
			obj.put("name", vo.getName());
			jarray.add(obj);
		}
		return jarray;
	}
}
