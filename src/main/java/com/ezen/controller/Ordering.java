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
				System.out.println(coin);
	
				for (int j = 0; j < orders.size(); j++) {
					JSONObject obj = (JSONObject) orders.get(j);
					float dif_amount = Float.parseFloat(obj.get("amount").toString())-Float.parseFloat(obj.get("amount_c").toString());
					float dif_price = Float.parseFloat(obj.get("price").toString())-Float.parseFloat(obj.get("price_c").toString());
					if (obj.get("type").equals("B")) {
						for (int i = 0; i < bids.size(); i++) {
							JSONObject bid = (JSONObject) bids.get(i);		
							if(dif_amount<Float.parseFloat(bid.get("quantity").toString())){
								dao.getOrdering(obj.get("idx").toString(), String.valueOf(dif_price),String.valueOf(dif_amount));
								dao.getOrderCancel(obj.get("idx").toString());
							}else if (parseInt(bid.get("price")) <= parseInt(obj.get("price"))) {	
								dao.getOrdering(obj.get("idx").toString(), bid.get("price").toString(), bid.get("quantity").toString());
							}
							System.out.println("bid_q : " + bid.get("quantity"));
							System.out.println("bid_p : " + parseInt(bid.get("price")));
						}
					} else if (obj.get("type").equals("S")) {
						for (int i = 0; i < asks.size(); i++) {
							JSONObject ask = (JSONObject) asks.get(i);
							if(dif_amount<Float.parseFloat(ask.get("quantity").toString())){
								dao.getOrdering(obj.get("idx").toString(), String.valueOf(dif_price),String.valueOf(dif_amount));
								dao.getOrderCancel(obj.get("idx").toString());
							}else if (parseInt(ask.get("price")) >= parseInt(obj.get("price"))) {
								dao.getOrdering(obj.get("idx").toString(), ask.get("price").toString(), ask.get("quantity").toString());
							}
							System.out.println("ask_q : " + ask.get("quantity"));
							System.out.println("ask_p : " + ask.get("price"));
						}
					}
				}
	
				System.out.println();
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

		result = (int) Integer.parseInt(obj.toString());

		return result;
	}
}
