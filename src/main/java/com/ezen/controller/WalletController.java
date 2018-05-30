package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.WalletDAO;
import coinweb.vo.WalletVO;

@Controller
public class WalletController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="wallet.do", method=RequestMethod.GET)
	public ModelAndView wallet(HttpSession session){
		ModelAndView mv = new ModelAndView();
		int sid = 0;
	 	if (session.getAttribute("sid") != null)  {
	 		sid = ((Integer) session.getAttribute("sid")).intValue(); } else { sid = 0; }
	 	
		//DB����
	 	WalletDAO dao = sqlSession.getMapper(WalletDAO.class);		

		mv.setViewName("/wallet/wallet");
				
		return mv;
	}
	
	@RequestMapping(value="wallet_result.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONObject wallet_result(int id, String coin_name){
		
		WalletDAO dao = sqlSession.getMapper(WalletDAO.class);
		WalletVO vo = dao.getWalletResult(id, coin_name);
				
		JSONObject obj = new JSONObject();
		obj.put("coin", vo.getCoin_name());
		obj.put("available", vo.getAvailable_balance());
		obj.put("using", vo.getUsing_balance());
		obj.put("tot", vo.getTot_balance());
		obj.put("coin_avail", vo.getCoin_avail());
		obj.put("coin_using", vo.getCoin_using());
		obj.put("coin_tot", vo.getCoin_tot());
		obj.put("state", vo.getState());		
		return obj;
	}
	
/*	@RequestMapping(value="wallet_update.do", method=RequestMethod.GET)
	public String wallet_update(int id, String coin){
		
		
	}*/
}
