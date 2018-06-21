package coinweb.vo;

import java.util.Base64;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BoardVO {
	int rno,no,hits,likeit, id;
	String title,name,fbdate;
	String rfname,content;
	Base64 contents;
	CommonsMultipartFile file;
	
	
	
    /*base64,multipartFile*/
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public Base64 getContents() {
		return contents;
	}
	public void setContents(Base64 contents) {
		this.contents = contents;	
	}
	/*base64,multipartFile*/
	
	
	
	
	
	
	public String getRfname() {
		return rfname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRfname(String rfname) {
		this.rfname = rfname;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getLikeit() {
		return likeit;
	}
	public void setLikeit(int likeit) {
		this.likeit = likeit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getFbdate() {
		return fbdate;
	}
	public void setFbdate(String fbdate) {
		this.fbdate = fbdate;
	}
	
	
	
}
