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

import coinweb.dao.OrderDAO;
import coinweb.dao.WalletDAO;

public class Ordering extends Thread {
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
	
				for (int j = 0; j < orders.size(); j++) {
					JSONObject obj = (JSONObject) orders.get(j);
					System.out.println(obj.get("idx"));
					float dif_amount = 0;
					if (obj.get("type").equals("S")) {
						for (int i = 0; i < bids.size(); i++) {
							JSONObject bid = (JSONObject) bids.get(i);
							obj = (JSONObject) orders.get(j);
							dif_amount = parseFloat(obj.get("amount"))-parseFloat(obj.get("amount_c"));
							if(parseInt(bid.get("price")) >= parseInt(obj.get("price")) && dif_amount<parseFloat(bid.get("quantity")) && dif_amount>0){
								String axp = String.valueOf(axp(bid.get("price"),dif_amount));
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("bid_end");
								break;
							}else if (parseInt(bid.get("price")) >= parseInt(obj.get("price")) && dif_amount>0) {
								String axp = String.valueOf(axp(bid.get("price"),bid.get("quantity")));
								dao.getOrdering(obj.get("idx").toString(), axp, bid.get("quantity").toString());
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, bid.get("quantity").toString(), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, bid.get("quantity").toString(), obj.get("type").toString());
								if(dif_amount <= 0) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("bid_ing "+bid.get("price")+", "+axp+", "+bid.get("quantity"));
							}
							
						}
					} else if (obj.get("type").equals("B")) {
						for (int i = 0; i < asks.size(); i++) {
							JSONObject ask = (JSONObject) asks.get(i);
							obj = (JSONObject) orders.get(j);
							dif_amount = parseFloat(obj.get("amount"))-parseFloat(obj.get("amount_c"));
							if(parseInt(ask.get("price")) <= parseInt(obj.get("price")) && dif_amount<=parseFloat(ask.get("quantity")) && dif_amount>0){
								String axp = String.valueOf(axp(ask.get("price"),dif_amount));
								dao.getOrdering(obj.get("idx").toString(), axp,String.valueOf(dif_amount));
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, String.valueOf(dif_amount), obj.get("type").toString());
								dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("ask_end");
								break;
							}else if (parseInt(ask.get("price")) <= parseInt(obj.get("price")) && dif_amount>0) {
								String axp = String.valueOf(axp(ask.get("price"),ask.get("quantity")));
								dao.getOrdering(obj.get("idx").toString(), axp, ask.get("quantity").toString());
								w_dao.getOrderingUpdate(obj.get("id").toString(), obj.get("coin").toString(), axp, ask.get("quantity").toString(), obj.get("type").toString());
								w_dao.getOrderingUpdate2(obj.get("id").toString(), obj.get("coin").toString(), axp, ask.get("quantity").toString(), obj.get("type").toString());
								if(dif_amount <= 0) dao.getOrderCancel(obj.get("idx").toString());
								System.out.println("ask_ing "+ask.get("price")+", "+axp+", "+ask.get("quantity"));
							}
						}
					}
				}
			}
	
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
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
		result = (int)(parseInt(price)*parseFloat(amount));
		
		return result;
	}
}
