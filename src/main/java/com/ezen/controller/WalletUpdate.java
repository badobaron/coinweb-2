package com.ezen.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.mybatis.spring.SqlSessionTemplate;

import coinweb.dao.MemberDAO;
import coinweb.dao.WalletDAO;

public class WalletUpdate {
	SqlSessionTemplate sqlSession;

	public WalletUpdate() {
	};

	public WalletUpdate(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	};

	public void run(HttpServletRequest request) {
			WalletDAO dao = sqlSession.getMapper(WalletDAO.class);
	
			URL url = null, url2 = null, url3 = null;
			InputStreamReader isr = null, isr2 = null, isr3 = null;
			
			try {
				url = new URL("https://api.bithumb.com/public/ticker/ALL");
				url2 = new URL("http://mhj0932.cafe24.com/member_list.do");
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			
			try {
				isr = new InputStreamReader(url.openConnection().getInputStream(), "UTF-8");
				isr2 = new InputStreamReader(url2.openConnection().getInputStream(), "UTF-8");
			
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			JSONObject object = (JSONObject) JSONValue.parse(isr);
			if(object != null){
			JSONObject data = (JSONObject) object.get("data");
			
			JSONArray members = (JSONArray) JSONValue.parse(isr2);
			for(int i = 0; i < members.size(); i++) {
				JSONObject member = (JSONObject) members.get(i);
				String id = member.get("id").toString();
				
				try {
					url3 = new URL("http://mhj0932.cafe24.com/wallet_list.do?id="+id);
				} catch (MalformedURLException e) {
					e.printStackTrace();
				}

				try {
					isr3 = new InputStreamReader(url3.openConnection().getInputStream(), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				JSONArray wallet = (JSONArray) JSONValue.parse(isr3);
				JSONObject krw = (JSONObject) wallet.get(0);
				float tot = parseFloat(krw.get("available"));
				String list[] = {"KRW", "BTC", "BCH", "ETH", "ETC", "XRP", "DASH", "LTC", "XMR", "ZEC", "QTUM" };
				
				for(int j=1; j<wallet.size()-1; j++) {
					JSONObject coin = (JSONObject) data.get(list[j]);
					JSONObject w_coin = (JSONObject) wallet.get(j);
					float price = parseFloat(coin.get("closing_price"));
					float amount = floor(w_coin.get("coin_tot"));
					
					
					tot+= floor(price*amount);
					
				}
				dao.getWalletTotalUpdate(id, tot);
				
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


	public static float floor(Object amount) {
		float result = 0;
		result = (float) (Math.floor(parseFloat(amount) * 10000) / 10000.0);
		return result;
	}

}
