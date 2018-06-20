package com.ezen.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import coinweb.dao.OrderDAO;
import coinweb.dao.WalletDAO;

public class Ordering extends Thread {
	@Autowired
	SqlSessionTemplate sqlSession;

	public Ordering() {
	};

	public Ordering(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	};

	public void run() {
		while(true){
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
				
				int price = 0;
				for (int j = 0; j < orders.size(); j++) {
					JSONObject obj = (JSONObject) orders.get(j);
					float dif_amount = 0;
					int dif_price = (int) (parseInt(obj.get("price"))*floor(obj.get("amount"))) - parseInt(obj.get("price_c"));
					if (obj.get("type").equals("S")) {
						dif_amount = floor(parseFloat(obj.get("amount"))-parseFloat(obj.get("amount_c")));
						for (int i = 0; i < bids.size(); i++) {
							JSONObject bid = (JSONObject) bids.get(i);
							obj = (JSONObject) orders.get(j);
							if(parseInt(bid.get("price")) >= parseInt(obj.get("price")) && dif_amount<parseFloat(bid.get("quantity")) && dif_amount>0){
								System.out.println(dif_amount+", "+floor(parseFloat(bid.get("quantity"))));
								String axp = String.valueOf(axp(bid.get("price"),dif_amount));
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), String.valueOf(dif_amount));
								System.out.println("bid_end "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
								break;
							}else if (parseInt(bid.get("price")) >= parseInt(obj.get("price")) && dif_amount>0) {
								System.out.println(dif_amount+", "+String.format("%.4f", parseFloat(bid.get("quantity"))));
								String axp = String.valueOf(axp(bid.get("price"),floor(bid.get("quantity"))));
								dao.getOrdering(obj.get("idx").toString(), axp, String.valueOf(floor(bid.get("quantity"))));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(floor(bid.get("quantity"))), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(floor(bid.get("quantity"))), obj.get("type").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "S", bid.get("price").toString(), String.valueOf(floor(bid.get("quantity"))));
								dif_amount -= floor(bid.get("quantity"));
								if(dif_amount == floor(bid.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("bid_ing "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
							}
						}
					} else if (obj.get("type").equals("B")) {
						dif_amount = floor(parseFloat(obj.get("amount"))-parseFloat(obj.get("amount_c")));
						for (int i = 0; i < asks.size(); i++) {
							JSONObject ask = (JSONObject) asks.get(i);
							obj = (JSONObject) orders.get(j);
							if(parseInt(ask.get("price")) <= parseInt(obj.get("price")) && dif_amount<parseFloat(ask.get("quantity")) && dif_amount>0){
								System.out.println(dif_amount+", "+floor(parseFloat(ask.get("quantity"))));
								String axp = String.valueOf(axp(ask.get("price"),dif_amount));
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(dif_amount));
								System.out.println("ask_end");
								price += parseInt(axp);
								System.out.println(dif_price+", "+price);
								dif_price -= price;
								if(dif_price>0) {
									w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), String.valueOf(dif_price), String.valueOf(floor(dif_price/parseFloat(ask.get("price")))), obj.get("type").toString());
									w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), String.valueOf(dif_price), String.valueOf(floor(dif_price/parseFloat(ask.get("price")))), obj.get("type").toString());
									dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(floor(dif_price/parseFloat(ask.get("price")))));
								}
								break;
							}else if (parseInt(ask.get("price")) <= parseInt(obj.get("price")) && dif_amount>0) {
								System.out.println(dif_amount+", "+floor(parseFloat(ask.get("quantity"))));
								String axp = String.valueOf(axp(ask.get("price"),floor(ask.get("quantity"))));
								dao.getOrdering(obj.get("idx").toString(), axp, String.valueOf(floor(ask.get("quantity"))));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(floor(ask.get("quantity"))), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(floor(ask.get("quantity"))), obj.get("type").toString());
								dao.getHistoryInsert(obj.get("id").toString(), obj.get("coin").toString(), "B", ask.get("price").toString(), String.valueOf(floor(ask.get("quantity"))));
								dif_amount -= floor(ask.get("quantity"));
								price += parseInt(axp);
								if(dif_amount == floor(ask.get("quantity"))) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("ask_ing "+ask.get("price")+", "+axp+", "+ask.get("quantity"));
							}
						}
					}
				}
			}
	
			try {
				Thread.sleep(3500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		}
	}

	public static int parseInt(Object obj) {
		int result = 0;
		result = Integer.parseInt(obj.toString());

		return result;
	}
	
	public static float parseFloat(Object obj) {
		float result = 0;
		result = Float.parseFloat(obj.toString());

		return result;
	}
	
	public static int axp(Object price, Object amount){
		int result = 0;
		result = (int)(parseInt(price)*floor(amount));
		
		return result;
	}
	
	public static float floor(Object amount){
		float result = 0;
		result = (float) (Math.floor(parseFloat(amount)*10000)/10000.0);
		return result;
	}
	
}
