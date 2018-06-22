package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.BoardDAO;
import coinweb.vo.BoardReplyVO;
import coinweb.vo.BoardVO;
import coinweb.vo.LikeitVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


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
			startCount = (reqPage-1) * pageSize; 
			endCount = reqPage *pageSize;
			
		}else{
			startCount = 0;
			endCount = 10;
			rpage="1";
		}
		
		ArrayList<BoardVO> list =dao.getBoardList(startCount,pageSize);
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
			startCount = (reqPage-1) * pageSize; 
			endCount = reqPage *pageSize;
			
		}else{
			startCount = 0;
			endCount = 10;
		}
		if(findValue.equals("title")){
			list =dao.getBoardListTitle(search,startCount,pageSize);
		}else if(findValue.equals("content")){
			list =dao.getBoardListContent(search,startCount,pageSize);
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
	public ModelAndView freeboard_content(String no){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		dao.getUpdateHits(no);
		BoardVO vo=dao.getBoardContent(no);	
		mv.addObject("vo",vo);
		mv.addObject("no",no);
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
	public ModelAndView freeboard_update(String no){
		ModelAndView mv = new ModelAndView();
		BoardDAO dao =sqlSession.getMapper(BoardDAO.class);
		BoardVO vo=dao.getBoardContent(no);
		mv.addObject("vo",vo);
		mv.addObject("no",no);
		
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
			obj.put("title",vo.getTitle());
			obj.put("name",vo.getName());
			obj.put("bdate",vo.getFbdate());
			obj.put("hits",vo.getHits());
			obj.put("likeit",vo.getLikeit());
			jsonArray.add(obj);
		}
		return jsonArray;
	}
	
	@RequestMapping(value="/freeboard_likeit.json", method=RequestMethod.POST)
	@ResponseBody
	public int freeboard_likeit(String no, String id) {
		int result = 0;
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param1", no);
		params.put("param2", id);
		
		String type = sqlSession.selectOne("getBoardLikeitCheck", params);
		
		if(type != null && type.equals("L")) {
			result = 0;
		} else {
			BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
			if(type != null && type.equals("DL")) {
				dao.deleteBoardLikeit(no, id);
				dao.likeitUp(no);
			}
			dao.likeitUp(no);
			dao.insertBoardLikeit(no, id, "L");
			result = 1;
		}
		System.out.println(result);
		return result;
	}
	

	@RequestMapping(value="/freeboard_dislikeit.json", method=RequestMethod.POST)
	@ResponseBody
	public int freeboard_dislikeit(String no, String id) {
		int result = 0;
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param1", no);
		params.put("param2", id);
		
		String type = sqlSession.selectOne("getBoardLikeitCheck", params);
		
		if(type != null && type.equals("DL")) {
			result = 0;
		} else {
			BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
			if(type != null && type.equals("L")) {
				dao.deleteBoardLikeit(no, id);
				dao.likeitDown(no);
			}
			dao.likeitDown(no);
			dao.insertBoardLikeit(no, id, "DL");
			result = 1;
		}
		return result;
	}


	//REPLY
	@RequestMapping(value="/reply_write_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String reply_write_check(String id, String rname, String content, String no){
	
	
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int result = dao.getReplyInsertResult(id, no, rname, content);		
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
			obj.put("rname", vo.getRname());
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
	public int freeboardreply_likeit(String bid,String rid, String id) {
		int result = 0;
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param1", bid);
		params.put("param2", rid);
		params.put("param3", id);
		
		String type = sqlSession.selectOne("getReplyLikeitCheck", params);
		
		if(type != null && type.equals("L")) {
			result = 0;
		} else {
			BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
			if(type != null && type.equals("DL")) {
				dao.deleteReplyLikeit(bid, rid, id);
				dao.replyDislikeitDown(bid,rid);
			}
			dao.replyLikeitUp(bid,rid);
			dao.insertReplyLikeit(bid,rid,id,"L");
			result = 1;
		}
		return result;
	}
	
	@RequestMapping(value="/freeboardreply_dislikeit.json", method=RequestMethod.POST)
	@ResponseBody
	public int freeboardreply_dislikeit(String bid,String rid, String id) {
		int result = 0;
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("param1", bid);
		params.put("param2", rid);
		params.put("param3", id);
		
		String type = sqlSession.selectOne("getReplyLikeitCheck", params);
		
		if(type != null && type.equals("DL")) {
			result = 0;
		} else {
			BoardDAO dao=sqlSession.getMapper(BoardDAO.class);
			if(type != null && type.equals("L")) {
				dao.deleteReplyLikeit(bid, rid, id);
				dao.replyLikeitDown(bid,rid);
			}
			dao.replyDislikeitUp(bid,rid);
			dao.insertReplyLikeit(bid,rid,id,"DL");
			result = 1;
		}
		return result;
	}
	

}

