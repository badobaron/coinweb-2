package com.ezen.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.BoardDAO;
import coinweb.vo.BoardReplyVO;
import coinweb.vo.BoardVO;
import coinweb.vo.MemberVO;


@Controller
public class CommunityController {
	
@Autowired
ServletContext context;		
@Autowired
SqlSessionTemplate sqlSession;

	
	@RequestMapping(value="/freeboard.do", method=RequestMethod.GET)
	public ModelAndView freeboard(String rpage){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(coinweb.dao.BoardDAO.class);

		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount= dao.execTotalCount();
	
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

	
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
			
		}else{
			startCount = 1;
			endCount = 10;
			rpage="1";
		}
		
		ArrayList<BoardVO> list =dao.getBoardList(startCount,endCount);
		mv.setViewName("/community/freeboard");
		mv.addObject("list",list);
		mv.addObject("rpage",rpage);
		mv.addObject("dbCount",dbCount);
		return mv;		
	}
	
	@RequestMapping(value="/freeboard_search.do", method=RequestMethod.GET)
	public ModelAndView freeboard_saerch(String rpage,String search,String findValue){
		

		ModelAndView mv = new ModelAndView();
		BoardDAO dao = sqlSession.getMapper(coinweb.dao.BoardDAO.class);
		ArrayList<BoardVO> list= new ArrayList<BoardVO>();
	
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	
		int reqPage = 1;	
		int pageCount = 1;
		int dbCount=0;
		if(findValue.equals("title")){
			dbCount= dao.execTotalCountTitle(search);
		}else if(findValue.equals("content")){
			dbCount= dao.execTotalCountContent(search);		
		}else if(search.equals("")){
			dbCount= dao.execTotalCount();
		}
		

		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

	
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1; 
			endCount = reqPage *pageSize;
			
		}else{
			startCount = 1;
			endCount = 10;
		}
		if(findValue.equals("title")){
			list =dao.getBoardListTitle(search,startCount,endCount);
		}else if(findValue.equals("content")){
			list =dao.getBoardListContent(search,startCount,endCount);
		}else if(search.equals("")){
			list=dao.getBoardList(startCount, endCount);		
		}
		
		mv.setViewName("/community/freeboard_search");
		mv.addObject("list",list);
		mv.addObject("rpage",rpage);
		mv.addObject("dbCount",dbCount);
		mv.addObject("search",search);
		mv.addObject("findValue",findValue);
		
		return mv;		
	}
	

	
	
	@RequestMapping(value="/freeboard_write.do", method=RequestMethod.GET)
	public String freeboard_write(){		
		return "/community/freeboard_write";		
	}
	
	@RequestMapping(value="/freeboard_write_controller.do", method=RequestMethod.POST)
	public String freeboard_controller(BoardVO vo){		
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
	
		dao.insertBoardContent(vo);	
		
		return "redirect:/freeboard.do";
	}
	
	@RequestMapping(value="/freeboard_content.do", method=RequestMethod.GET)
	public ModelAndView freeboard_content(String no,String rno){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		dao.getUpdateHits(no);
		BoardVO vo=dao.getBoardContent(no);	
		mv.addObject("vo",vo);
		mv.addObject("no",no);
		mv.addObject("rno", rno);
		mv.setViewName("/community/freeboard_content");		
		return mv;
	}
	
	@RequestMapping(value="/freeboard_delete.do", method=RequestMethod.GET)
	public String freeboard_delete(String no){	
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		dao.deleteBoardContent(no);	
		return "redirect:freeboard.do";
	}
	
	@RequestMapping(value="/freeboard_update.do", method=RequestMethod.GET)
	public ModelAndView freeboard_update(String no,String rno){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		BoardVO vo=dao.getBoardContent(no);
		mv.addObject("vo",vo);
		mv.addObject("no",no);
		mv.addObject("rno", rno);
		mv.setViewName("/community/freeboard_update");
		return mv;
	}
	
	@RequestMapping(value="/freeboard_update_controller.do", method=RequestMethod.POST)
	public String freeboard_update_controller(BoardVO vo){
	BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
	dao.updateBoardContent(vo);
	return "redirect:freeboard.do";
	}
	 
			 
	@RequestMapping(value="/freeboard_list_search.do", method=RequestMethod.POST)
	@ResponseBody
	public JSONArray freeboard_list_search(String search){
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		JSONArray jsonArray = new JSONArray();
		ArrayList<BoardVO>list =dao.searchBoardList(search);
		for(BoardVO vo:list){
			JSONObject obj = new JSONObject();
			obj.put("rno",vo.getRno());
			obj.put("title",vo.getTitle());
			obj.put("name",vo.getName());
			obj.put("bdate",vo.getBdate());
			obj.put("hits",vo.getHits());
			obj.put("likeit",vo.getLikeit());
			jsonArray.add(obj);
		}
		return jsonArray;
	}
	
	@RequestMapping(value="/freeboard_likeit.json", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject freeboard_likeit(String no) {
		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
		JSONObject jsonObject = new JSONObject();
		dao.likeitUp(no);
		BoardVO vo= dao.getLikeit(no);
		jsonObject.put("likeit",vo.getLikeit());
		return jsonObject;
	}
	

	@RequestMapping(value="/freeboard_dislikeit.json", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject freeboard_dislikeit(String no) {
		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
		JSONObject jsonObject = new JSONObject();
		dao.likeitDown(no);
		BoardVO vo= dao.getLikeit(no);
		jsonObject.put("likeit",vo.getLikeit());
		return jsonObject;
	}
	
	
	
	


	//REPLY
	@RequestMapping(value="/reply_write_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String reply_write_check(String content, String no){
		BoardReplyVO vo = new BoardReplyVO();
		vo.setContent(content);
		vo.setBid(Integer.parseInt(no));
	
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = dao.getReplyInsertResult(vo);		
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/reply_list.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray reply_list(String no){
	
		JSONArray jarray = new JSONArray();				
		// ArrayList<BoardReplyVO>
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ArrayList<BoardReplyVO> list = dao.getReplyList(no);
			
		//ArrayList<BoardReplyVO> 
		for(BoardReplyVO vo:list){
			JSONObject obj = new JSONObject();
			obj.put("rid", vo.getRid());
			obj.put("content", vo.getContent());
			obj.put("rdate", vo.getRdate());
			obj.put("bid", vo.getBid());
			obj.put("likeit", vo.getLikeit());
			obj.put("dislikeit", vo.getDislikeit());
			jarray.add(obj);
		}			
		return jarray;
	}
	
	@RequestMapping(value="/reply_count.do", method=RequestMethod.GET)
	@ResponseBody
	public JSONObject reply_count(String no) {
		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
		int count =dao.getReplyCount(no);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("count", count);
		return jsonObject;
	}
	
	@RequestMapping(value="/freeboardreply_likeit.json", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject freeboardreply_likeit(String bid,String rid) {
		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
		JSONObject jsonObject = new JSONObject();
		dao.replyLikeitUp(bid,rid);
		BoardReplyVO vo= dao.getReplyLikeit(bid,rid);
		jsonObject.put("likeit",vo.getLikeit());
		return jsonObject;
	}
	
	@RequestMapping(value="/freeboardreply_dislikeit.json", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject freeboardreply_dislikeit(String bid,String rid) {
		BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
		JSONObject jsonObject = new JSONObject();
		dao.replyDislikeitUp(bid,rid);
		BoardReplyVO vo= dao.getReplyLikeit(bid,rid);
		jsonObject.put("dislikeit",vo.getDislikeit());
		return jsonObject;
	}
	
	
	
	
	
	
}



















