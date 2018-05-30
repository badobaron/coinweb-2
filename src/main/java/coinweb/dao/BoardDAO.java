package coinweb.dao;


import java.util.ArrayList;

import coinweb.vo.BoardReplyVO;
import coinweb.vo.BoardVO;


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
	/*좋아요*/
	public int likeitUp(String no);
	public int likeitDown(String no);
	public BoardVO getLikeit(String no);
	/*섹션 만든 후, name값 연동 */
	public int insertBoardContent(BoardVO vo);
	
	public int deleteBoardContent(String no);
	
	public int updateBoardContent(BoardVO vo);
	
	public ArrayList<BoardVO> searchBoardList(String search);
	
	/*reply*/
	public ArrayList<BoardReplyVO> getReplyList(String no);
	public int getReplyInsertResult(BoardReplyVO vo);
	public int getReplyCount(String no);
	public void replyLikeitUp(String bid, String rid);
	public void replyDislikeitUp(String bid, String rid);
	public BoardReplyVO getReplyLikeit(String bid, String rid);


}
