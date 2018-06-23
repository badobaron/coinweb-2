package coinweb.dao;

import java.util.ArrayList;

import coinweb.vo.bbsVO;

public interface bbsDAO {

	// Constructor
 /* 전체 카운트 가져오기 */
	/*public int execTotalCount(); */
	public String getDate();
	public int getNext();
	public int execTotalCount();

	/* 글쓰기 */
	public int write(bbsVO vo);
/*전체리스트
*/	public ArrayList<bbsVO> getResultList(int startCount, int endCount);

   /*읽기*/
	public bbsVO getResultVO(String bbsID);
	/*업데이트*/
	public int getUpdateResult(bbsVO vo);
	
	/* 게시판글삭제 */
	public int getDeleteResult(String BbsID);

	}
