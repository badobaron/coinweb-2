package com.ezen.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.math.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import coinweb.dao.OrderDAO;
import coinweb.dao.WalletDAO;
import coinweb.vo.OrderVO;

public class Ordering extends Thread {
	@Autowired
	SqlSessionTemplate sqlSession;

	public Ordering() {
	};

	public Ordering(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	};

	public void run() {
			OrderDAO dao = sqlSession.getMapper(OrderDAO.class);
			WalletDAO w_dao = sqlSession.getMapper(WalletDAO.class);
	
			URL url = null;
			try {
				url = new URL("https://api.bithumb.com/public/orderbook/ALL");
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			InputStreamReader isr = null;
			try {
				isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			JSONObject object = (JSONObject) JSONValue.parse(isr);
			if(object != null){
			JSONObject data = (JSONObject) object.get("data");
	
			String list[] = { "BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH", "XMR", "ZEC", "QTUM" };
			for (String coin : list) {
				URL url2 = null;
				try {
					url2 = new URL(
							"http://localhost:8080/coinweb/order_all_list.do?coin=" + coin);
				} catch (MalformedURLException e) {
					e.printStackTrace();
				}
				InputStreamReader isr2 = null;
				try {
					isr2 = new InputStreamReader(url2.openConnection().getInputStream(), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
	
				JSONArray orders = (JSONArray) JSONValue.parse(isr2);
	
				JSONObject COIN = (JSONObject) data.get(coin);
				JSONArray bids = (JSONArray) COIN.get("bids");
				JSONArray asks = (JSONArray) COIN.get("asks");
				
				BigDecimal price = new BigDecimal("0");
				for (int j = 0; j < orders.size(); j++) {
					JSONObject obj = (JSONObject) orders.get(j);
					BigDecimal dif_amount;
					BigDecimal dif_price = BigDecimal(axp(obj.get("price"),obj.get("amount"))).subtract(BigDecimal(obj.get("price_c")));
					if (obj.get("type").equals("S")) {
						dif_amount = BigFloat(BigFloat(obj.get("amount")).subtract(BigFloat(obj.get("amount_c"))));
						for (int i = 0; i < bids.size(); i++) {
							JSONObject bid = (JSONObject) bids.get(i);
							obj = (JSONObject) orders.get(j);
							if(parseFloat(bid.get("price")) >= parseFloat(obj.get("price")) && dif_amount.floatValue()<BigFloat(bid.get("quantity")).floatValue() && dif_amount.floatValue()>0){
								System.out.println(dif_amount+", "+BigFloat(bid.get("quantity")));
								String axp = axp(bid.get("price"),dif_amount).toString();
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), String.valueOf(dif_amount));
								System.out.println("bid_end "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
								break;
							}else if (parseFloat(bid.get("price")) >= parseFloat(obj.get("price")) && dif_amount.floatValue()>0) {
								System.out.println(dif_amount+", "+BigFloat(bid.get("quantity")));
								String axp = axp(bid.get("price"),bid.get("quantity")).toString();
								dao.getOrdering(obj.get("idx").toString(), axp, String.valueOf(BigFloat(bid.get("quantity"))));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(BigFloat(bid.get("quantity"))), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(BigFloat(bid.get("quantity"))), obj.get("type").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), String.valueOf(BigFloat(bid.get("quantity"))));
								dif_amount = dif_amount.subtract(BigFloat(bid.get("quantity")));
								if(BigFloat(dif_amount) == BigFloat(bid.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("bid_ing "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
							}
						}
					} else if (obj.get("type").equals("B")) {
						dif_amount = BigFloat(BigFloat(obj.get("amount")).subtract(BigFloat(obj.get("amount_c"))));
						for (int i = 0; i < asks.size(); i++) {
							JSONObject ask = (JSONObject) asks.get(i);
							obj = (JSONObject) orders.get(j);
							if(parseFloat(ask.get("price")) <= parseFloat(obj.get("price")) && dif_amount.floatValue()<BigFloat(ask.get("quantity")).floatValue() && dif_amount.floatValue()>0){
								System.out.println(dif_amount+", "+BigFloat(ask.get("quantity")));
								String axp = axp(ask.get("price"),dif_amount).toString();
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(dif_amount));
								System.out.println("ask_end");
								price = price.add(BigDecimal(axp));
								System.out.println(dif_price+", "+price);
								dif_price = dif_price.subtract(price);
								System.out.println(dif_price);
								if(dif_price.floatValue()>0) {
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), String.valueOf(dif_price), String.valueOf(BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), String.valueOf(dif_price), String.valueOf(BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)), obj.get("type").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(BigFloat(dif_price).divide(BigFloat(ask.get("price")),4,BigDecimal.ROUND_FLOOR)));
								}
								break;
							}else if (parseFloat(ask.get("price")) <= parseFloat(obj.get("price")) && dif_amount.floatValue()>0) {
								System.out.println(dif_amount+", "+BigFloat(ask.get("quantity")));
								String axp = axp(ask.get("price"),ask.get("quantity")).toString();
								dao.getOrdering(obj.get("idx").toString(), axp, String.valueOf(BigFloat(ask.get("quantity"))));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(BigFloat(ask.get("quantity"))), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(BigFloat(ask.get("quantity"))), obj.get("type").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(BigFloat(ask.get("quantity"))));
								dif_amount = dif_amount.subtract(BigFloat(ask.get("quantity")));
								price = price.add(BigDecimal(axp));
								if(BigFloat(dif_amount) == BigFloat(ask.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("ask_ing "+ask.get("price")+", "+axp+", "+ask.get("quantity"));
							}
						}
					}
				}
			}
		}
	}

	public static float parseFloat(Object obj) {
		float result = 0;
		BigDecimal value = new BigDecimal(obj.toString());;
		result = value.floatValue();

		return result;
	}
	
	public static BigDecimal BigDecimal(Object obj) {
		BigDecimal result = new BigDecimal(obj.toString());
		
		return result;
	}
	
	public static BigDecimal axp(Object price, Object amount){
		BigDecimal result = BigDecimal(price).multiply(BigFloat(amount));
		
		return result;
	}
	
	public static BigDecimal BigFloat(Object obj) {
		BigDecimal result = BigDecimal(obj.toString()).setScale(4, BigDecimal.ROUND_FLOOR);
		
		return result;
	}
	
	/*public static OrderVO vo(JSONObject obj) {
	OrderVO vo = new OrderVO();
	vo.setId(parseFloat(obj.get("id")));
	vo.setCoin(obj.get("coin").toString());
	vo.setPrice(BigFloat(obj.get("price")).floatValue());
	vo.setPrice_completed(BigFloat(obj.get("price_c")).floatValue());
	vo.setAmount(BigFloat(obj.get("amount")).floatValue());
	vo.setAmount_completed(BigFloat(obj.get("amount_c")).floatValue());
	
	return vo;
	}*/
}
