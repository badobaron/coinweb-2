package com.ezen.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Proxy {
	@RequestMapping(value="proxy.do", method=RequestMethod.GET)
	public void doGet(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		String reqUrl = null;
		String targetParams = "";

		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			if (name.equals("csurl")) {
				reqUrl = request.getParameter(name);
			} else {
				try {
					targetParams += name + "=" + URLEncoder.encode(request.getParameter(name), "utf-8") + "&";
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		if (targetParams.length() > 1) {
			reqUrl += "?" + targetParams;
		}
		
		System.out.println(reqUrl);

		try {
			URL url = new URL(reqUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2");
			con.setDoOutput(true);
			con.setRequestMethod(request.getMethod());
			int clength = request.getContentLength();
			if (clength > 0) {
				con.setDoInput(true);
				byte[] idata = new byte[clength];
				request.getInputStream().read(idata, 0, clength);
				con.getOutputStream().write(idata, 0, clength);
			}
			response.setContentType(con.getContentType());

			BufferedReader rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			PrintWriter out = response.getWriter();
			while ((line = rd.readLine()) != null) {
				out.println(line);
				System.out.println(line);
			}
			out.flush();
			rd.close();

		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(500);
		}
	}
}
