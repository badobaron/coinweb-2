package coinweb.vo;

public class BoardReplyVO {
	private int bid; //COINWEB_BOARD의 no 참조값
	private int rid;
	private int likeit,dislikeit;
	private String content,rdate,rname;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
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
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	@Override
	public String toString() {
		return "BoardReplyVO [bid=" + bid + ", rid=" + rid + ", likeit=" + likeit + ", dislikeit=" + dislikeit
				+ ", content=" + content + ", rdate=" + rdate + ", rname=" + rname + "]";
	}
	
	
	
	
	
	
}
