package com.ezen.controller;


import java.util.ArrayList;








import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coinweb.dao.bbsDAO;
import coinweb.vo.bbsVO;

@Controller
public class MainController2 {

	@RequestMapping(value="bbs.do", method=RequestMethod.GET)
	public ModelAndView bbs(String rpage){
			ModelAndView mv = new ModelAndView();		
			bbsDAO dao = new bbsDAO();			
			//����¡ ó�� - startCount, endCount ���ϱ�
			int startCount = 0;
			int endCount = 0;
			int pageSize = 5;	//���������� �Խù� ��
			int reqPage = 1;	//��û������	
			int pageCount = 1;	//��ü ������ ��
			int dbCount = dao.execTotalCount();	//DB���� ������ ��ü ���
			
			//�� ������ �� ���
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}

			//��û ������ ���
			if(rpage != null){				
				reqPage = Integer.parseInt(rpage); 
				startCount = (reqPage-1) * pageSize+1;	
				endCount = reqPage * pageSize; 
			}else{
				startCount = 1;
				endCount = 5;
			}
			
			
			ArrayList<bbsVO> list = dao.getResultList(startCount, endCount);
			
			mv.addObject("list", list);
			mv.addObject("dbCount", dbCount);
			mv.addObject("rpage", reqPage);
			mv.setViewName("/bbs");
			
			
		return mv;
	}
		
	

	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String wirite(){
		return "/freeboard/write";
	}
	@RequestMapping(value="guide.do", method=RequestMethod.GET)
	public String guide(){
		return "/guide/guide";
	}
//		�ּ�����
	@RequestMapping(value="FAQ.do", method=RequestMethod.GET)
	public String FAQ(){
		return "/guide/FAQ";
	}
	@RequestMapping(value="view.do", method=RequestMethod.GET)
	public String View(){
		return "/freeboard/view";
	}
	@RequestMapping(value="update.do", method=RequestMethod.GET)
	public String upDate(){
		return "/freeboard/update";
	}
	
	
	@RequestMapping(value="/writeAction.do", method=RequestMethod.POST)
	public String writeA(bbsVO vo){
		
		String page = "";
		bbsDAO bbsdao = new bbsDAO();
		
		int result=bbsdao.write(vo);
		if(result==1){
			page = "redirect:/bbs.do";
		}
		return page;
	}
	

	/* �Խ��� - DB���� �������� */
	@RequestMapping(value="/updateAction.do", method=RequestMethod.POST )
	public String board_update_check( bbsVO vo,String BbsID ){
		//ModelAndView mv = new ModelAndView();
		String page = "";
		
		bbsDAO dao = new bbsDAO();
		int result = dao.getUpdateResult(vo,BbsID);
		dao.close();
		
		if(result == 1){
			//mv.setViewName("/board/board_list");
			page = "redirect:/bbs.do";
		}
		
		return page;
	}
	
/*	@RequestMapping(value="/deleteAction.do", method=RequestMethod.GET)
	public ModelAndView de(String BbsID){
		ModelAndView mv = new ModelAndView();
		mv.addObject("BbsID" );
	
		mv.setViewName("/deleteAction.do");
		return mv;
	}*/
/*	@RequestMapping(value="board-delete.do", method=RequestMethod.GET)
	public ModelAndView deletef(String BbsID ){
		ModelAndView mv = new ModelAndView();
		mv.addObject("Bbsid", BbsID);
		
		mv.setViewName("/freeboard/board_delete");
		return mv;
		
	}*/
	@RequestMapping(value="/deleteAction.do",  method=RequestMethod.GET)
	public String board_delete(String BbsID){
				
		String page = "";
		bbsDAO dao = new bbsDAO();
		int result = dao.getDeleteResult(BbsID);
		dao.close();
		
		if(result == 1){
			page = "redirect:/bbs.do";
		}
		
		return page;
	}
	
}

