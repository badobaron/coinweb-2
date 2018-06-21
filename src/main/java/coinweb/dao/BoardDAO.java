package coinweb.dao;


import java.util.ArrayList;
import java.util.HashMap;

import coinweb.vo.BoardReplyVO;
import coinweb.vo.BoardVO;
import coinweb.vo.LikeitVO;


public interface BoardDAO {

	/* community list */
	public ArrayList<BoardVO> getBoardList(int startCount, int endCount);
	public ArrayList<BoardVO> getBoardListContent(String search, int startCount, int endCount);
	public ArrayList<BoardVO> getBoardListTitle(String search, int startCount, int endCount);
	public int execTotalCount();
	public int execTotalCountContent(String search);
	public int execTotalCountTitle(String search);
	
	/* community content */	
	public BoardVO getBoardContent(String no);
	public int getUpdateHits(String no);
	public int likeitUp(String no);
	public int likeitDown(String no);
	public BoardVO getLikeit(String no);
	public int insertBoardContent(BoardVO vo);
	public int deleteBoardContent(String no);
	public int updateBoardContent(BoardVO vo);
	public ArrayList<BoardVO> searchBoardList(String search);
	public int insertBoardLikeit(String bid, String id, String type);
	public int deleteBoardLikeit(String bid, String id);
	public LikeitVO getBoardLikeitCheck(HashMap<String, String> params);
	
	
	//reply
	public ArrayList<BoardReplyVO> getReplyList(String no);
	public int getReplyInsertResult(String rname, String content,String no);
	public int getReplyCount(String no);
	public void replyLikeitUp(String bid, String rid);
	public void replyDislikeitUp(String bid, String rid);
	public void replyLikeitDown(String bid, String rid);
	public void replyDislikeitDown(String bid, String rid);
	public BoardReplyVO getReplyLikeit(String bid, String rid);
	public int insertReplyLikeit(String bid, String rid, String id, String type);
	public int deleteReplyLikeit(String bid, String rid, String id);
	public int getReplyLikeitCheck(HashMap<String, String> params);

}
