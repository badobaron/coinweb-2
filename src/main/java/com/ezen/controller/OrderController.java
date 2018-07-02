package com.ezen.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import coinweb.dao.OrderDAO;
import coinweb.dao.WalletDAO;
import coinweb.vo.HistoryVO;
import coinweb.vo.OrderVO;

@Controller
public class OrderController {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="order.do", method=RequestMethod.GET)
	@ResponseBody
	public String order(String id, String coin, String price, String amount, String type){		
		
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		WalletDAO w_dao = sqlSession.getMapper(WalletDAO.class);
		int result = dao.getOrderResult(id, coin, price, amount, type);
		w_dao.getWalletUpdate(Integer.parseInt(id), coin, price, amount, type);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="order_cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public String order_cancel(String id, String coin, String idx, String type){		
		
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		WalletDAO w_dao = sqlSession.getMapper(WalletDAO.class);
		OrderVO vo = dao.getOrderCancelResult(id, coin, idx);
		w_dao.getWalletCancel(vo);
		int result = dao.getOrderCancel(idx);
		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="order_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray order_list(String id, String coin){
		JSONArray jarray = new JSONArray();
		if(id=="") id="0";
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		ArrayList<OrderVO> list = dao.getOrderListResult(id, coin);
		
		for(OrderVO vo: list){
			JSONObject obj = new JSONObject();
			obj.put("idx", vo.getIdx());
			obj.put("coin", vo.getCoin());
			obj.put("price", vo.getPrice());
			obj.put("price_c", vo.getPrice_completed());
			obj.put("amount", vo.getAmount());
			obj.put("amount_c", vo.getAmount_completed());
			obj.put("date", vo.getOdate());
			obj.put("type", vo.getType());
			
			jarray.add(obj);
		}
		return jarray;
	}
	
	@RequestMapping(value="order_all_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray order_all_list(String coin){
		JSONArray jarray = new JSONArray();
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		ArrayList<OrderVO> list = dao.getOrderAllListResult(coin);
		
		for(OrderVO vo: list){
			JSONObject obj = new JSONObject();
			obj.put("idx", vo.getIdx());
			obj.put("id", vo.getId());
			obj.put("coin", coin);
			obj.put("price", vo.getPrice());
			obj.put("price_c", vo.getPrice_completed());
			obj.put("amount", vo.getAmount());
			obj.put("amount_c", vo.getAmount_completed());
			obj.put("date", vo.getOdate());
			obj.put("type", vo.getType());
			
			jarray.add(obj);
		}
		return jarray;
	}
	
	@RequestMapping(value="history_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray history_list(String id, String coin){
		JSONArray jarray = new JSONArray();
		if(id=="") id="0";
		OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
		ArrayList<HistoryVO> list = dao.getHistoryListResult(id, coin);
		
		for(HistoryVO vo: list){
			JSONObject obj = new JSONObject();
			obj.put("type", vo.getType());
			obj.put("coin", vo.getCoin());
			obj.put("price", vo.getPrice());
			obj.put("amount", vo.getAmount());
			obj.put("price_c", vo.getPrice_completed());
			obj.put("date", vo.getHdate());
			
			jarray.add(obj);
		}
		return jarray;
	}
	
	@RequestMapping(value="thread.do", method=RequestMethod.GET)
	public String thread(HttpServletRequest request){
		Ordering ord = new Ordering(sqlSession);
		ord.run(request);
		
		return "index";
	}
}
