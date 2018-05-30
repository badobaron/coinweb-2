package coinweb.vo;

public class BoardReplyVO {
	int bid; //COINWEB_BOARD의 no 참조값
	int rid;
	int likeit,dislikeit;
	String content,rdate;
	/*덧글마다 추천 반대 likeit,dislikeit*/
	
	
	public int getLikeit() {
		return likeit;
	}
	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}
	public int getDislikeit() {
		return dislikeit;
	}
	public void setDislikeit(int dislikeit) {
		this.dislikeit = dislikeit;
	}

	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
}
