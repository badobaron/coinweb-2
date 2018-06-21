package coinweb.vo;

public class OrderVO {
	int idx,id, price, price_completed;
	float amount, amount_completed;
	String coin, odate, type;
	
	
	public String getCoin() {
		return coin;
	}
	public void setCoin(String coin) {
		this.coin = coin;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_completed() {
		return price_completed;
	}
	public void setPrice_completed(int price_completed) {
		this.price_completed = price_completed;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getAmount_completed() {
		return amount_completed;
	}
	public void setAmount_completed(float amount_completed) {
		this.amount_completed = amount_completed;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
